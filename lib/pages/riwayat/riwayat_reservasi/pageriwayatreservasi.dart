import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/controllers/riwayat_reservasi_controller.dart';
import 'package:grafil_app/routes/app_route.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycard.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/myreservationcard.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';


class RiwayatReservasiPage extends StatelessWidget {
  final riwayatReservasiController = Get.find<RiwayatReservationController>();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  RiwayatReservasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.background,
      body: SafeArea(
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
                  buttonbackgroundColor: Mycolors.background,
                  textColor: Mycolors.blue,
                  outlineColor: Mycolors.blue,
                  isOutlined: true,
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
                  buttonbackgroundColor: Mycolors.blue,
                  textColor: Mycolors.white,
                  borderRadius: 28,
                  fontWeight: FontWeight.w600,
                  margin: const EdgeInsets.only(right: 10, left: 10),
                ),
              ),
            ],
          ),

              const SizedBox(height: 16),

              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      text: 'All',
                      onPressed: () {
                        riwayatReservasiController.changeSpotFilter(0);
                      },
                      buttonbackgroundColor:
                          riwayatReservasiController.selectedSpotId.value == 0
                              ? Mycolors.darkBlue
                              : Mycolors.blue,
                      textColor: Mycolors.white,
                      fontSize: 14,
                      height: 40,
                      fontWeight: FontWeight.bold,
                      width: 80,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                    ),
                    const SizedBox(width: 10),
                    MyButton(
                      text: 'Lap.1',
                      onPressed: () {
                        riwayatReservasiController.changeSpotFilter(1);
                      },
                      buttonbackgroundColor:
                          riwayatReservasiController.selectedSpotId.value == 1
                              ? Mycolors.darkBlue
                              : Mycolors.blue,
                      textColor: Mycolors.white,
                      fontSize: 14,
                      height: 40,
                      fontWeight: FontWeight.bold,
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                    ),
                    const SizedBox(width: 10),
                    MyButton(
                      text: 'Lap.2',
                      onPressed: () {
                        riwayatReservasiController.changeSpotFilter(2);
                      },
                      buttonbackgroundColor:
                          riwayatReservasiController.selectedSpotId.value == 2
                              ? Mycolors.darkBlue
                              : Mycolors.blue,
                      textColor: Mycolors.white,
                      fontSize: 14,
                      height: 40,
                      fontWeight: FontWeight.bold,
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                    ),
                    const SizedBox(width: 10),
                    MyButton(
                      text: 'Lap.3',
                      onPressed: () {
                        riwayatReservasiController.changeSpotFilter(3);
                      },
                      buttonbackgroundColor:
                          riwayatReservasiController.selectedSpotId.value == 3
                              ? Mycolors.darkBlue
                              : Mycolors.blue,
                      textColor: Mycolors.white,
                      fontSize: 14,
                      height: 40,
                      fontWeight: FontWeight.bold,
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: MyTextField(
                      controller: dateController,
                       isRiwayat: true,
                      hintText: "Pilih tanggal",
                      iconlogo: const Icon(
                        Icons.calendar_today,
                        color: Mycolors.blue,
                      ),
                      width: 175,
                      height: 50,
                      borderRadius: 24,
                      isDatePicker: true,
                      onDateSelected: (formattedDate) {
                        riwayatReservasiController.filterByDate(formattedDate);
                      },
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Mycolors.blue,
                      ),
                      hintTextStyle: const TextStyle(
                        fontSize: 15,
                        color: Mycolors.darkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Obx(
                    () =>
                        riwayatReservasiController.selectedDate.value != null
                            ? IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Mycolors.blue,
                              ),
                              onPressed: () {
                                dateController.clear();
                                riwayatReservasiController.clearDateFilter();
                              },
                            )
                            : const SizedBox(width: 0),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyTextField(
                      hintText: "Search",
                      iconlogo: const Icon(Icons.search, color: Mycolors.blue),
                      width: 60,
                      height: 50,
                      borderRadius: 24,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      hintTextStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Mycolors.blue,
                      ),
                      onChange: (value) {
                        riwayatReservasiController.updateSearchQuery(value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Mycard(
                    borderRadius: 16,
                    color: Mycolors.white,
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Obx(() {
                        final filteredList =
                            riwayatReservasiController
                                .filteredReservations; 
                        if (riwayatReservasiController.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (filteredList.isEmpty) {
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
                                  text: 'Belum ada data reservasi',
                                  fontSize: 16,
                                  textcolor: Mycolors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.separated(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          itemCount: filteredList.length,
                          separatorBuilder:
                              (context, index) => const SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            final res = filteredList[index];
                            return ReservationCard(
                              waktu: res.waktu,
                              tanggal: res.tanggal,
                              nama: res.nama,
                              lapangan: res.lapangan,
                              telp: res.telp,
                            );
                          },
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
    );
  }
}
