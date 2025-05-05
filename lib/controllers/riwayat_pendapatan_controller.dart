import 'package:get/get.dart';
import 'package:grafil_app/pages/riwayat/riwayat_pendapatan/API/riwayatpendapatan_model.dart';
import 'package:grafil_app/pages/riwayat/riwayat_pendapatan/API/riwayatpendapatan_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RiwayatPendapatanController extends GetxController {
  final RiwayatPendapatanService _paymentService = RiwayatPendapatanService();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var payments = <RiwayatPendapatanModel>[].obs;
  var filteredPayments = <RiwayatPendapatanModel>[].obs;

  var searchController = TextEditingController();
  var selectedDate = Rx<DateTime?>(null);
  var selectedLapangan = Rx<int?>(null);
  var searchKeyword = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPayments();
  }

  Future<void> refreshData() async {
    await fetchPayments();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  // Mendapatkan semua data pendapatan
  Future<void> fetchPayments() async {
    try {
      isLoading(true);
      payments.clear();
      errorMessage('');

      final results = await _paymentService.getPayments();
      payments.assignAll(results);
      applyFilters();
    } catch (e) {
      errorMessage('Gagal memuat data: $e');
    } finally {
      isLoading(false);
    }
  }

  void searchPayments(String keyword) {
    searchKeyword.value = keyword;
    applyFilters();
  }

  Future<void> filterByDate(DateTime date) async {
    selectedDate.value = date;
    await applyFilters();
  }

  Future<void> filterByLapangan(int spotId) async {
    try {
      isLoading(true);
      print('Setting selected lapangan to: $spotId');
      selectedLapangan.value = spotId;

      print('Selected lapangan is now: ${selectedLapangan.value}');

      await applyFilters();
    } catch (e) {
      print('Error in filterByLapangan: $e');
      errorMessage('Gagal memfilter berdasarkan lapangan: $e');
    } finally {
      isLoading(false);
    }
  }

  void resetFilters() {
    selectedDate.value = null;
    selectedLapangan.value = null;
    searchKeyword.value = '';
    searchController.clear();
    filteredPayments.assignAll(payments);
  }

  Future<void> applyFilters() async {
    try {
      isLoading(true);
      errorMessage('');

      List<RiwayatPendapatanModel> result = List<RiwayatPendapatanModel>.from(
        payments,
      );

      if (selectedDate.value != null) {
        String formattedDate = DateFormat(
          'yyyy-MM-dd',
        ).format(selectedDate.value!);

        result =
            result.where((payment) {
              if (payment.createdAt == null) return false;
              return payment.createdAt!.startsWith(formattedDate);
            }).toList();
      }

      if (selectedLapangan.value != null) {
        result =
            result.where((payment) {
              print(
                'Payment spotId: ${payment.spotId}, Type: ${payment.spotId.runtimeType}',
              );
              print(
                'Selected lapangan: ${selectedLapangan.value}, Type: ${selectedLapangan.value.runtimeType}',
              );

              if (payment.spotId == null) return false;

              bool matchesAsString =
                  payment.getSpotIdString() ==
                  selectedLapangan.value.toString();
              bool matchesAsInt =
                  payment.getSpotIdInt() == selectedLapangan.value;
              bool matchesDirect = payment.spotId == selectedLapangan.value;

              print('Matches as string: $matchesAsString');
              print('Matches as int: $matchesAsInt');
              print('Matches direct: $matchesDirect');

              return matchesAsString || matchesAsInt || matchesDirect;
            }).toList();
      }

      if (searchKeyword.value.isNotEmpty) {
        final keyword = searchKeyword.value.toLowerCase();
        result =
            result
                .where(
                  (payment) =>
                      (payment.name?.toLowerCase().startsWith(keyword) ==
                          true) ||
                      (payment.phone?.toLowerCase().startsWith(keyword) ==
                          true),
                )
                .toList();
      }

      filteredPayments.assignAll(result);
    } catch (e) {
      errorMessage('Gagal menerapkan filter: $e');
    } finally {
      isLoading(false);
    }
  }

  String formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return '-';
    try {
      final DateTime date = DateTime.parse(dateStr);
      return DateFormat('dd/MM/yy').format(date);
    } catch (e) {
      return dateStr;
    }
  }

  String formatAmount(String? amount) {
    if (amount == null || amount.isEmpty) return '-';
    return 'Rp ${amount.replaceAll('"', '')}';
  }
}
