import 'package:flutter/material.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';
import 'package:grafil_app/widget/mytimebox.dart';
import 'package:intl/intl.dart';

class AddReservationPage extends StatelessWidget {
  AddReservationPage({Key? key}) : super(key: key);

  // Controller untuk textfield
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  // Untuk menyimpan pilihan lapangan
  final ValueNotifier<String> selectedField = ValueNotifier<String>("Lapangan");

  final ValueNotifier<Map<String, String>> timeSlots =
      ValueNotifier<Map<String, String>>({
        "8:00": "available",
        "9:00": "available",
        "10:00": "booked",
        "11:00": "available",
        "12:00": "booked",
        "13:00": "available",
        "14:00": "available",
        "15:00": "available",
        "16:00": "available",
        "17:00": "available",
        "18:00": "available",
        "19:00": "available",
        "20:00": "available",
        "21:00": "available",
        "22:00": "available",
        "23:00": "available",
        "24:00": "available",
      });

  // Untuk menyimpan tanggal yang dipilih
  final ValueNotifier<DateTime?> selectedDate = ValueNotifier<DateTime?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.background,
      appBar: AppBar(
        backgroundColor: Mycolors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Mycolors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),

        // text judul di paling ats
        title: MyText(
          text: "Add Reservation",
          fontSize: 24,
          textcolor: Mycolors.blue,
          fontWeight: FontWeight.w800,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ini textfield nama
              SizedBox(height: 16),
              MyTextField(
                controller: nameController,
                iconlogo: Icon(Icons.person, color: Mycolors.darkBlue),
                width: double.infinity,
                height: 50,
                borderRadius: 25,
              ),

              // ini textfield no telp
              SizedBox(height: 16),
              MyTextField(
                controller: phoneController,
                iconlogo: Icon(Icons.phone, color: Mycolors.darkBlue),
                width: double.infinity,
                height: 50,
                borderRadius: 25,
              ),

              // ini datepicker nya
              SizedBox(height: 16),
              
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: MyTextField(
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      controller: dateController,
                      hintText: "Pilih tanggal",
                      fontWeight: FontWeight.w600,
                      textcolor: Mycolors.darkBlue,
                      iconlogo: Icon(
                        Icons.calendar_today,
                        color: Mycolors.darkBlue,
                      ),
                      width: double.infinity,
                      height: 50,
                      borderRadius: 25,
                    ),
                  ),
                ),
              

              // ini dropdown lapangan
              SizedBox(height: 16),
              Center(
                child: ValueListenableBuilder<String>(
                  valueListenable: selectedField,
                  builder: (context, value, child) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: value,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Mycolors.darkBlue,
                            ),
                            isExpanded: true,
                            style: TextStyle(color: Mycolors.grey),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                selectedField.value = newValue;
                              }
                            },
                            items:
                                <String>[
                                  'Lapangan',
                                  'Lapangan 1',
                                  'Lapangan 2',
                                  'Lapangan 3',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.sports_tennis,
                                          color: Mycolors.darkBlue,
                                        ),
                                        SizedBox(width: 15),
                                        MyText(
                                          text: value,
                                          textcolor: Mycolors.darkBlue,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Text waktu
              SizedBox(height: 24),
              Center(
                child: MyText(
                  text: "Waktu",
                  fontSize: 22,
                  textcolor: Mycolors.blue,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 16),
              ValueListenableBuilder<Map<String, String>>(
                valueListenable: timeSlots,
                builder: (context, slotsMap, child) {
                  return _buildTimeGrid(context, slotsMap);
                },
              ),

              // button tambah
              SizedBox(height: 24),
              Center(
                child: MyButton(
                  text: "Tambah",
                  onPressed: () => _handleReservation(context),
                  buttonbackgroundColor: Mycolors.blue,
                  textColor: Mycolors.white,
                  width: 150,
                  height: 45,
                  borderRadius: 25,
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeGrid(BuildContext context, Map<String, String> slotsMap) {
    List<String> times = [
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

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3.2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: times.length,
      itemBuilder: (context, index) {
        final time = times[index];
        final status = slotsMap[time] ?? "available";

        return MyTimeBox.withStatus(
          time: time,
          status: status,
          primaryColor: Mycolors.blue,
          disabledColor: Mycolors.grey,
          borderWidth: 2,
          borderRadius: 30,
          onTap: () {
            if (status == "available") {
              final updatedSlots = Map<String, String>.from(slotsMap);
              updatedSlots[time] = "selected";
              timeSlots.value = updatedSlots;
            } else if (status == "selected") {
              final updatedSlots = Map<String, String>.from(slotsMap);
              updatedSlots[time] = "available";
              timeSlots.value = updatedSlots;
            }
          },
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = now;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: DateTime(now.year + 1),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: Mycolors.blue),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      dateController.text = formattedDate;

      // Simpan tanggal yang dipilih
      selectedDate.value = picked;
    }
  }

  void _handleReservation(BuildContext context) {
    // Validasi input dasar
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        dateController.text.isEmpty ||
        selectedField.value == "Lapangan") {
      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Harap lengkapi semua data"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Cek apakah ada waktu yang dipilih
    bool anyTimeSelected = timeSlots.value.values.contains("selected");
    if (!anyTimeSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Harap pilih minimal satu slot waktu"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Ambil waktu yang dipilih
    List<String> selectedTimes = [];
    timeSlots.value.forEach((time, status) {
      if (status == "selected") {
        selectedTimes.add(time);
      }
    });

    // Tampilkan konfirmasi reservasi (Cuiman UI)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Reservasi berhasil ditambahkan untuk ${selectedTimes.join(', ')}!",
        ),
        backgroundColor: Colors.green,
      ),
    );

    // Ini untuk reset jika sudah beres semua
    nameController.clear();
    phoneController.clear();
    dateController.clear();
    selectedField.value = "Lapangan";

    // ini untuk reset waktunya
    Map<String, String> resetSlots = {};
    timeSlots.value.forEach((time, _) {
      resetSlots[time] = "available";
    });
    timeSlots.value = resetSlots;

    selectedDate.value = null;
  }
}
