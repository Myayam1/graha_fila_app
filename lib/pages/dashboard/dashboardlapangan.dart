import 'package:flutter/material.dart';
import 'package:grafil_app/pages/detail_lapangan/reservasilapangan1.dart';
import 'package:grafil_app/pages/detail_lapangan/reservasilapangan2.dart';
import 'package:grafil_app/pages/detail_lapangan/reservasilapangan3.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycard.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/myimgbtn.dart';
import 'package:grafil_app/widget/mytext.dart';

class DashboardLapanganPage extends StatelessWidget {
  const DashboardLapanganPage({Key? key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyText(
                    text: 'Dashboard',
                    fontSize: 24,
                    textcolor: Mycolors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                  MyButton(
                    text: 'Reservasi',
                    onPressed: () {},
                    buttonbackgroundColor: Mycolors.blue,
                    textColor: Mycolors.white,
                    fontSize: 14,
                    height: 36,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    borderRadius: 28,
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Mycolors.white,
                      size: 18,
                    ),
                    iconPosition: IconPosition.left,
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
                              children: [
                                const MyText(
                                  text: 'Graha Fila Sport',
                                  fontSize: 16,
                                  textcolor: Mycolors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                const MyText(
                                  text: 'Badminton',
                                  fontSize: 16,
                                  textcolor: Mycolors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    MyText(
                                      text: 'Pendapatan bulan ini',
                                      fontSize: 12,
                                      textcolor: Colors.grey,
                                    ),
                                    MyText(
                                      text: 'Rp 135.000',
                                      fontSize: 16,
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
                      text: 'Reservasi',
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
                      text: 'Lapangan',
                      onPressed: () {},
                      buttonbackgroundColor: Mycolors.blue,
                      textColor: Mycolors.white,
                      borderRadius: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            MyImageButton(
                              imagePath: "assets/images/logolapangan1.png",
                              onTap: () {
                            Navigator.push(
                             context,
                              MaterialPageRoute(builder: (context) => const Reservasilapangan1()),

                             ); },
                            ),
                            const SizedBox(height: 40),
                            MyImageButton(
                              imagePath: "assets/images/logolapangan2.png",
                              onTap: () {Navigator.push(
                             context,
                              MaterialPageRoute(builder: (context) => const ReservasiLapangan2()),

                             ); },
                            ),
                            const SizedBox(height: 40),
                            MyImageButton(
                              imagePath: "assets/images/logolapangan3.png",
                              onTap: () {
                                Navigator.push(
                             context,
                              MaterialPageRoute(builder: (context) => const ReservasiLapangan3()),

                             ); 
                              },
                            ),
                          ],
                        ),
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
