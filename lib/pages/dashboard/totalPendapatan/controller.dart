import 'dart:async';
import 'package:get/get.dart';
import 'package:grafil_app/pages/dashboard/totalPendapatan/service.dart';
import 'package:intl/intl.dart';

class PaymentController extends GetxController {
  final PaymentService _paymentService = PaymentService();
  var todayIncome = '0'.obs;
  var isLoading = false.obs;
  Timer? _timer; 

  @override
  void onInit() {
    super.onInit();
    fetchTodayIncome();
    
    _startPolling();
  }


  Future<void> refreshData() async {
    await fetchTodayIncome();
  }

  @override
  void onClose() {
    _timer?.cancel(); 
    super.onClose();
  }

  void _startPolling() {
    _timer = Timer.periodic(Duration(seconds: 120), (timer) {
      fetchTodayIncome(); 
    });
  }

  Future<void> resetAndFetchIncome() async {
    todayIncome.value = '0';
    await fetchTodayIncome();
  }

  Future<void> fetchTodayIncome() async {
    try {
      isLoading(true);
      final String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final result = await _paymentService.getTodayIncome(currentDate);
      todayIncome.value = result.amount.toString();
    } catch (e) {
      print('Error fetching today income: $e');
      Get.snackbar(
        'Error',
        'Gagal memuat data pendapatan hari ini',
        snackPosition: SnackPosition.TOP, 
      );
    } finally {
      isLoading(false);
    }
  }

  String formatCurrency(String amount) {
    if (amount.isEmpty) return '0';
    try {
      final value = int.parse(amount);
      final formatted = value.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]}.',
      );
      return formatted;
    } catch (e) {
      return amount;
    }
  }
}