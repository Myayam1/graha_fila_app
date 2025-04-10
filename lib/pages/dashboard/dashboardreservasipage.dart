import 'package:flutter/material.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycard.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/myimgbtn.dart';
import 'package:grafil_app/widget/myreservationcard.dart';
import 'package:grafil_app/widget/mytext.dart';

class DashboardReservasiPage extends StatelessWidget {
  const DashboardReservasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText(
                text: 'Dashboard',
                fontSize: 24,
                textcolor: Mycolors.blue,
                fontWeight: FontWeight.w800,
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
                              children: [
                                const MyText(
                                  text: 'Graha Fila Sport',
                                  fontSize: 17,
                                  textcolor: Mycolors.blue,
                                  fontWeight: FontWeight.w800,
                                ),
                                const MyText(
                                  text: 'Badminton',
                                  fontSize: 17,
                                  textcolor: Mycolors.blue,
                                  fontWeight: FontWeight.w800,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    MyText(
                                      text: 'Pendapatan bulan ini',
                                      fontSize: 13,
                                      textcolor: Colors.grey,
                                    ),
                                    MyText(
                                      text: 'Rp 135.000',
                                      fontSize: 17,
                                      textcolor: Mycolors.blue,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ],
                                ),
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
                        onPressed: () {},
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
                children: [
                  Expanded(
                    child: MyButton(
                      text: 'Lapangan',
                      onPressed: () {},
                      buttonbackgroundColor: Mycolors.background,
                      textColor: Mycolors.blue,
                      borderRadius: 28,
                      isOutlined: true,
                      outlineColor: Mycolors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: MyButton(
                      text: 'Reservasi',
                      onPressed: () {},
                      buttonbackgroundColor: Mycolors.blue,
                      textColor: Mycolors.white,
                      borderRadius: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyImageButton(
                    imagePath: 'assets/images/logolapangan1.png',
                    onTap: () {},
                    width: 105,
                    height: 100,
                    borderRadius: 20,
                  ),
                  MyImageButton(
                    imagePath: 'assets/images/logolapangan2.png',
                    onTap: () {},
                    width: 105,
                    height: 100,
                    borderRadius: 20,
                  ),
                  MyImageButton(
                    imagePath: 'assets/images/logolapangan3.png',
                    onTap: () {},
                    width: 105,
                    height: 100,
                    borderRadius: 20,
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.43,

                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Mycolors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(14),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 6,
                    ),

                    children: const [
                      ReservationCard(
                        waktu: '08:00-09:00',
                        tanggal: '03/07/24',
                        nama: 'Supri',
                        lapangan: '2',
                        telp: '088837823323',
                      ),
                      SizedBox(height: 14),
                      ReservationCard(
                        waktu: '08:00-09:00',
                        tanggal: '03/07/24',
                        nama: 'Rusli',
                        lapangan: '2',
                        telp: '088837823323',
                      ),
                      SizedBox(height: 14),
                      ReservationCard(
                        waktu: '08:00-09:00',
                        tanggal: '03/07/24',
                        nama: 'Anto',
                        lapangan: '2',
                        telp: '088837823323',
                      ),
                      SizedBox(height: 14),
                      ReservationCard(
                        waktu: '08:00-09:00',
                        tanggal: '03/07/24',
                        nama: 'Dimas',
                        lapangan: '2',
                        telp: '088837823323',
                      ),
                    ],
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
