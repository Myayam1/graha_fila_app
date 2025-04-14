import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grafil_app/routes/app_route.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/myhistorypendapatancard.dart';
import 'package:grafil_app/widget/myimgbtn.dart';
import 'package:grafil_app/widget/mytextfield.dart';

class RiwayatPendapatanLapangan3 extends StatelessWidget {
  const RiwayatPendapatanLapangan3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.background,
      body: Column(
        children: [
          const SizedBox(height: 10),
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
                      Navigator.pop(context);
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
          const SizedBox(height: 70),
          Row(
            children: [
              Expanded(
                child: MyButton(
                  text: 'Pendapatan',
                  onPressed: () {Get.toNamed(AppRoutes.pendapatanlap3);},
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
                  onPressed: () {Get.toNamed(AppRoutes.pageRiwayat);},
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
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                MyImageButton(
                  imagePath: 'assets/images/logolapangan1.png',
                  onTap: () {
                    Get.toNamed(AppRoutes.pendapatanlap1);
                  },
                  width: 105,
                  height: 100,
                  borderRadius: 20,
                ),
                MyImageButton(
                  imagePath: 'assets/images/logolapangan2.png',
                  onTap: () {
                    Get.toNamed(AppRoutes.pendapatanlap2);
                  },
                  width: 105,
                  height: 100,
                  borderRadius: 20,
                ),
                MyImageButton(
                  imagePath: 'assets/images/logolapangan3.png',
                  onTap: () {
                    Get.toNamed(AppRoutes.pendapatanlap3);
                  },
                  width: 110,
                  height: 105,
                  borderRadius: 20,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 33),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    hintText: "Search",
                    iconlogo: const Icon(Icons.search, color: Mycolors.blue),
                    width: double.infinity,
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
                const SizedBox(width: 10),
                IconButton(
                  padding: EdgeInsets.only(right: 40),
                  icon: const Icon(Icons.sort, color: Mycolors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
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
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(6, 20, 6, 24),
                    children: const [
                      RiwayatPendapatanCard(
                        nominal: '15.000',
                        tanggal: '03/07/24',
                        nama: 'Rahmat',
                        lapangan: '2',
                        telp: '09999888',
                      ),
                      SizedBox(height: 25),
                      RiwayatPendapatanCard(
                        nominal: '10.000',
                        tanggal: '03/07/24',
                        nama: 'Supri',
                        lapangan: '2',
                        telp: '09999888',
                      ),
                      SizedBox(height: 25),
                      RiwayatPendapatanCard(
                        nominal: '10.000',
                        tanggal: '03/07/24',
                        nama: 'Supri',
                        lapangan: '2',
                        telp: '09999888',
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
