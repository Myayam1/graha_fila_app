import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grafil_app/controllers/detail_reservasi_controller.dart';
import 'package:grafil_app/routes/app_route.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycard.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/myreservationcard.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardReservasiPage extends StatelessWidget {
  final reservationController = Get.find<ReservationController>();
  final TextEditingController dateController = TextEditingController();

  DashboardReservasiPage({Key? key}) : super(key: key);

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
            
              Row(
                children: [
                  const MyText(
                    text: 'Dashboard',
                    fontSize: 24,
                    textcolor: Mycolors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Mycolors.darkBlue),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.remove('token');
                      Get.offAllNamed(AppRoutes.login);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

          
              Mycard(
                width: double.infinity,
                borderRadius: 16,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const ImageIcon(
                              AssetImage('assets/images/shuttlecock.png'),
                              color: Mycolors.blue,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                MyText(
                                  text: 'Graha Fila Sport',
                                  fontSize: 17,
                                  textcolor: Mycolors.blue,
                                  fontWeight: FontWeight.w800,
                                ),
                                MyText(
                                  text: 'Badminton',
                                  fontSize: 17,
                                  textcolor: Mycolors.blue,
                                  fontWeight: FontWeight.w800,
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: MyButton(
                        text: 'Riwayat',
                        onPressed: () {
                          Get.toNamed(AppRoutes.pageRiwayat);
                        },
                        buttonbackgroundColor: Mycolors.blue,
                        textColor: Mycolors.white,
                        fontSize: 12,
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        borderRadius: 28,
                        icon: const Icon(
                          Icons.history,
                          color: Mycolors.white,
                          size: 16,
                        ),
                        iconPosition: IconPosition.left,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    text: 'All',
                    onPressed: () {
                      reservationController.changeSpotFilter(0);
                    },
                    buttonbackgroundColor: Mycolors.blue,
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
                      reservationController.changeSpotFilter(1);
                    },
                    buttonbackgroundColor: Mycolors.blue,
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
                      reservationController.changeSpotFilter(2);
                    },
                    buttonbackgroundColor: Mycolors.blue,
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
                      reservationController.changeSpotFilter(3);
                    },
                    buttonbackgroundColor: Mycolors.blue,
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
              const SizedBox(height: 15),

              
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: MyTextField(
                      controller: dateController,
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
                        reservationController.filterByDate(formattedDate);
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
                        reservationController.selectedDate.value != null
                            ? IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Mycolors.blue,
                              ),
                              onPressed: () {
                                dateController.clear();
                                reservationController.clearDateFilter();
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // List of Reservations
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
                            reservationController.filteredReservations;
                        if (reservationController.isLoading.value) {
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
