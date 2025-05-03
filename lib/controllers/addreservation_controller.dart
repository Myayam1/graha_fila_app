import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/pages/reservasi/API/addreservasi_model.dart';
import 'package:grafil_app/pages/reservasi/API/addreservasi_service.dart';
import 'package:intl/intl.dart';

class AddReservationController extends GetxController {
  final AddReservationService _apiService = Get.put(AddReservationService());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController paymentController = TextEditingController();

  final RxInt selectedSpotId = 1.obs;
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final RxBool isLoading = false.obs;
  final RxMap<String, TimeSlot> timeSlots = <String, TimeSlot>{}.obs;
  final RxInt defaultAmount = 0.obs;
  
  
  final int hourlyRate = 10000;
  
  
  final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  final List<String> allTimeSlots = [
    "8:00",
    "9:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
    "20:00",
    "21:00",
    "22:00",
    "23:00",
    "24:00",
  ];

  @override
  void onInit() {
    super.onInit();
    initializeTimeSlots();
    updatePaymentAmount();
  }

  void initializeTimeSlots() {
    for (var time in allTimeSlots) {
      timeSlots[time] = TimeSlot(time: time, status: "available");
    }
  }

  void setSpotId(int id) {
    selectedSpotId.value = id;

    initializeTimeSlots();
    updatePaymentAmount();

    if (selectedDate.value != null) {
      final String formattedDate = DateFormat(
        'yyyy-MM-dd',
      ).format(selectedDate.value!);
      fetchBookedSlots(formattedDate, selectedSpotId.value);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF2196F3),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate.value = picked;
      final String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      initializeTimeSlots();
      updatePaymentAmount();

      await fetchBookedSlots(formattedDate, selectedSpotId.value);
    }
  }

  Future<void> fetchBookedSlots(String date, int spotId) async {
    try {
      isLoading.value = true;

      initializeTimeSlots();

      final List<String> bookedTimes = await _apiService.getReservationTimes(
        date,
        spotId,
      );

      for (var time in bookedTimes) {
        String formattedTime = time.substring(0, 5);
        if (timeSlots.containsKey(formattedTime)) {
          timeSlots[formattedTime] = TimeSlot(
            time: formattedTime,
            status: "booked",
          );
        }
      }

      final now = DateTime.now();
      final todayStr = DateFormat('yyyy-MM-dd').format(now);

      final cutoffTime = DateTime(now.year, now.month, now.day, now.hour, 0);

      if (date == todayStr) {
        for (var time in allTimeSlots) {
          final parts = time.split(":");
          final slotHour = int.parse(parts[0]);
          final slotMinute = int.parse(parts[1]);

          final slotDateTime = DateTime(
            now.year,
            now.month,
            now.day,
            slotHour,
            slotMinute,
          );

          if (slotDateTime.isBefore(cutoffTime)) {
            if (timeSlots.containsKey(time) &&
                timeSlots[time]!.status == "available") {
              timeSlots[time] = TimeSlot(time: time, status: "booked");
            }
          }
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch booked slots: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  
  void toggleTimeSlot(String time) {
    if (!timeSlots.containsKey(time)) return;

    final currentStatus = timeSlots[time]!.status;
    if (currentStatus == "available") {
      timeSlots[time] = TimeSlot(time: time, status: "selected");
    } else if (currentStatus == "selected") {
      timeSlots[time] = TimeSlot(time: time, status: "available");
    }
    
    
    updatePaymentAmount();
  }
  
  
  void updatePaymentAmount() {
    int selectedSlotsCount = 0;
    
    timeSlots.forEach((time, slot) {
      if (slot.status == "selected") {
        selectedSlotsCount++;
      }
    });
    
    
    int newAmount = selectedSlotsCount * hourlyRate;
    defaultAmount.value = newAmount;
    
    
    if (newAmount == 0) {
      paymentController.text = currencyFormatter.format(0);
    } else {
      paymentController.text = currencyFormatter.format(newAmount);
    }
  }

Future<void> createReservation() async {
  if (nameController.text.isEmpty ||
      phoneController.text.isEmpty ||
      dateController.text.isEmpty ||
      selectedDate.value == null) {
    Get.snackbar(
      'Validation Error',
      'Harap lengkapi semua data',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return;
  }

  final List<String> selectedTimes = [];
  timeSlots.forEach((time, slot) {
    if (slot.status == "selected") {
      selectedTimes.add(time);
    }
  });

  if (selectedTimes.isEmpty) {
    Get.snackbar(
      'Validation Error',
      'Harap pilih minimal satu slot waktu',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return;
  }

  try {
    isLoading.value = true;

    for (var time in selectedTimes) {
      final String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate.value!);
      final String formattedDateTime = "$formattedDate $time:00";

      final AddReservationModel reservation = AddReservationModel(
        name: nameController.text,
        phone: phoneController.text,
        spotId: selectedSpotId.value,
        reservationTime: formattedDateTime,
        amount: hourlyRate, 
      );

      await _apiService.createReservation(reservation);
    }

    Get.snackbar(
      'Success',
      'Reservasi berhasil ditambahkan untuk ${selectedTimes.join(", ")}!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    resetForm();
  } catch (e) {
    Get.snackbar(
      'Error',
      'Failed to create reservation: $e',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  } finally {
    isLoading.value = false;
  }
}

  void resetForm() {
    nameController.clear();
    phoneController.clear();
    dateController.clear();
    paymentController.clear();
    selectedDate.value = null;
    selectedSpotId.value = 1;
    initializeTimeSlots();
    updatePaymentAmount(); 
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    dateController.dispose();
    paymentController.dispose();
    super.onClose();
  }
}