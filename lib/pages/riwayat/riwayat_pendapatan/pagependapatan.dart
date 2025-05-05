import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/controllers/riwayat_pendapatan_controller.dart';
import 'package:grafil_app/routes/app_route.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/myhistorypendapatancard.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';
import 'package:intl/intl.dart';

class RiwayatPendapatanLapangan extends StatelessWidget {
  const RiwayatPendapatanLapangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RiwayatPendapatanController>();

    return Scaffold(
      backgroundColor: Mycolors.background,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Mycolors.blue,
                            ),
                            onPressed: () {
                              Get.toNamed(AppRoutes.dashboardReservasi);
                            },
                          ),
                        ],
                      ),
                      const Text(
                        "Riwayat",
                        style: TextStyle(
                          color: Mycolors.blue,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: MyButton(
                          text: 'Pendapatan',
                          onPressed: () {
                            Get.toNamed(AppRoutes.pendapatanlap);
                          },
                          buttonbackgroundColor: Mycolors.blue,
                          textColor: Mycolors.white,
                          borderRadius: 28,
                          fontWeight: FontWeight.w600,
                          margin: const EdgeInsets.only(right: 10, left: 10),
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          text: 'Reservasi',
                          onPressed: () {
                            Get.toNamed(AppRoutes.pageRiwayat);
                          },
                          buttonbackgroundColor: Mycolors.background,
                          textColor: Mycolors.blue,
                          borderRadius: 28,
                          isOutlined: true,
                          outlineColor: Mycolors.blue,
                          fontWeight: FontWeight.w600,
                          margin: const EdgeInsets.only(right: 10, left: 10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Filter controls
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        // Date filter indicator and button
                        Obx(
                          () => IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                              color:
                                  controller.selectedDate.value != null
                                      ? Colors.green
                                      : Mycolors.blue,
                            ),
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate:
                                    controller.selectedDate.value ??
                                    DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2030),
                              );
                              if (picked != null) {
                                controller.filterByDate(picked);
                              }
                            },
                          ),
                        ),

                        // Lapangan filter indicator and button
                        Obx(
                          () => IconButton(
                            icon: Icon(
                              Icons.filter_list,
                              color:
                                  controller.selectedLapangan.value != null
                                      ? Colors.green
                                      : Mycolors.blue,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Filter Berdasarkan Lapangan',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        // List of lapangan options
                                        ListTile(
                                          title: const Text('Lapangan 1'),
                                          onTap: () {
                                            controller.filterByLapangan(1);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Lapangan 2'),
                                          onTap: () {
                                            controller.filterByLapangan(2);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Lapangan 3'),
                                          onTap: () {
                                            controller.filterByLapangan(3);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        // Reset filters button
                        IconButton(
                          icon: const Icon(Icons.refresh, color: Mycolors.blue),
                          onPressed: () {
                            controller.resetFilters();
                          },
                        ),

                        const SizedBox(width: 10),

                        // Search field
                        Expanded(
                          child: MyTextField(
                            controller: controller.searchController,
                            hintText: "Search",
                            iconlogo: const Icon(
                              Icons.search,
                              color: Mycolors.blue,
                            ),
                            width: double.infinity,
                            height: 50,
                            borderRadius: 24,
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            hintTextStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Mycolors.blue,
                            ),
                            onChange: (value) {
                              controller.searchPayments(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Filter indicators
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (controller.selectedDate.value != null)
                            Chip(
                              label: Text(
                                'Tanggal: ${DateFormat('dd/MM/yy').format(controller.selectedDate.value!)}',
                              ),
                              deleteIcon: const Icon(Icons.close, size: 18),
                              onDeleted: () {
                                controller.selectedDate.value = null;
                                controller.applyFilters();
                              },
                            ),
                          if (controller.selectedLapangan.value != null)
                            Chip(
                              label: Text(
                                'Lapangan: ${controller.selectedLapangan.value}',
                              ),
                              deleteIcon: const Icon(Icons.close, size: 18),
                              onDeleted: () {
                                controller.selectedLapangan.value = null;
                                controller.applyFilters();
                              },
                            ),
                          if (controller.searchKeyword.value.isNotEmpty)
                            Chip(
                              label: Text(
                                'Pencarian: ${controller.searchKeyword.value}',
                              ),
                              deleteIcon: const Icon(Icons.close, size: 18),
                              onDeleted: () {
                                controller.searchController.clear();
                                controller.searchKeyword.value = '';
                                controller.applyFilters();
                              },
                            ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Payment list with RefreshIndicator
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                        shadowColor: Colors.black.withOpacity(0.05),
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        color: Mycolors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Obx(() {
                            if (controller.isLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Mycolors.blue,
                                ),
                              );
                            }

                            if (controller.errorMessage.isNotEmpty) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.errorMessage.value,
                                    style: const TextStyle(color: Colors.red),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () => controller.fetchPayments(),
                                    child: const Text('Coba Lagi'),
                                  ),
                                ],
                              );
                            }

                            if (controller.filteredPayments.isEmpty) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/dataisempty.jpg',
                                      width: 150,
                                    ),
                                    const SizedBox(height: 16),
                                    const MyText(
                                      text: 'Belum ada data pendapatan',
                                      fontSize: 16,
                                      textcolor: Mycolors.blue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              );
                            }
                            return RefreshIndicator(
                              onRefresh: () async {
                                await controller.refreshData();
                              },
                              child: ListView.separated(
                                padding: const EdgeInsets.fromLTRB(
                                  6,
                                  20,
                                  6,
                                  24,
                                ),
                                itemCount: controller.filteredPayments.length,
                                separatorBuilder:
                                    (context, index) =>
                                        const SizedBox(height: 25),
                                itemBuilder: (context, index) {
                                  final payment =
                                      controller.filteredPayments[index];

                                  return RiwayatPendapatanCard(
                                    nominal:
                                        payment.amount?.replaceAll('"', '') ??
                                        '0',
                                    tanggal: controller.formatDate(
                                      payment.createdAt,
                                    ),
                                    nama: payment.name ?? '-',
                                    lapangan: '${payment.spotId ?? "-"}',
                                    telp: payment.phone ?? '-',
                                  );
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
