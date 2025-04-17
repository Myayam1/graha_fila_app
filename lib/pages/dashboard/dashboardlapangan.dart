import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grafil_app/routes/app_route.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycard.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardLapanganPage extends StatelessWidget {
  const DashboardLapanganPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                      icon: Icon(Icons.logout),color: Mycolors.darkBlue,
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove(
                          'token',
                        ); 
                        Get.offAllNamed(
                          AppRoutes.login,
                        );
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
                        buttonbackgroundColor: Mycolors.blue,
                        textColor: Mycolors.white,
                        borderRadius: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
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
                  ],
                ),
                const SizedBox(height: 32),

              
                Mycard(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  borderRadius: 18,
                  color: Mycolors.white,
                  hasOutline: true,
                  outlineColor: Mycolors.blue,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            MyText(
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
                Mycard(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  borderRadius: 18,
                  color: Mycolors.white,
                  hasOutline: true,
                  outlineColor: Mycolors.blue,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            MyText(
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
                Mycard(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  borderRadius: 18,
                  color: Mycolors.white,
                  hasOutline: true,
                  outlineColor: Mycolors.blue,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            MyText(
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
        ),
      ),
    );
  }
}
