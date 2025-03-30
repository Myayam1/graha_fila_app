import 'package:flutter/material.dart';
import 'package:grafil_app/pages/riwayat/riwayatlapangan1.dart';
import 'package:grafil_app/pages/riwayat/riwayatlapangan2.dart';
import 'package:grafil_app/pages/riwayat/riwayatlapangan3.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mycard.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mytext.dart';

class RiwayatReservasi extends StatelessWidget {
  const RiwayatReservasi({super.key});

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
                    onPressed: () {},
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
                  text: 'Lapangan',
                  onPressed: () {},
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
                  onPressed: () {},
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

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Mycard(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  borderRadius: 15,
                  color: Mycolors.white,
                  hasOutline: true,
                  outlineColor: Mycolors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  RiwayatReservasi1(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: "Lapangan 1",
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              textcolor: Mycolors.darkBlue,
                            ),
                            SizedBox(height: 10),
                            MyText(
                              text: "Detail riwayat reservasi lapangan 1",
                              textcolor: Mycolors.blue,
                              fontSize: 15,
                            ),
                          ],
                        ),

                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Mycolors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Mycard(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  borderRadius: 15,
                  color: Mycolors.white,
                  hasOutline: true,
                  outlineColor: Mycolors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  RiwayatReservasi2(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: "Lapangan 2",
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              textcolor: Mycolors.darkBlue,
                            ),
                            SizedBox(height: 10),
                            MyText(
                              text: "Detail riwayat reservasi lapangan 2",
                              textcolor: Mycolors.blue,
                              fontSize: 15,
                            ),
                          ],
                        ),

                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Mycolors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Mycard(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  borderRadius: 15,
                  color: Mycolors.white,
                  hasOutline: true,
                  outlineColor: Mycolors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  RiwayatReservasi3(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: "Lapangan 3",
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              textcolor: Mycolors.darkBlue,
                            ),
                            SizedBox(height: 10),
                            MyText(
                              text: "Detail riwayat reservasi lapangan 3",
                              textcolor: Mycolors.blue,
                              fontSize: 15,
                            ),
                          ],
                        ),

                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Mycolors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
