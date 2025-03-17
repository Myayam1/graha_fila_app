import 'package:flutter/material.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycard.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/myreservationcard.dart';
import 'package:grafil_app/widget/mytext.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

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
              // Header
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

              // Sport Venue Card
              Mycard(
                width: double.infinity,
                borderRadius: 16,
                child: Stack(
                  children: [
                    // Card content
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon
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
                          // Venue details
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

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: MyButton(
                      text: 'Reservasi',
                      onPressed: () {},
                      buttonbackgroundColor: Mycolors.blue,
                      textColor: Mycolors.white,
                      borderRadius: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
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
                ],
              ),
              const SizedBox(height: 16),

              // Scrollable Reservation List
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                      ReservationCard(
                        waktu: '08:00-09:00',
                        tanggal: '03/07/24',
                        nama: 'Supri',
                        lapangan: '1',
                        telp: '088837823323',
                      ),
                      const SizedBox(height: 12),
                      ReservationCard(
                        waktu: '08:00-09:00',
                        tanggal: '03/07/24',
                        nama: 'Rusli',
                        lapangan: '1',
                        telp: '088837823323',
                      ),
                      const SizedBox(height: 12),
                      ReservationCard(
                        waktu: '08:00-09:00',
                        tanggal: '03/07/24',
                        nama: 'Anto',
                        lapangan: '1',
                        telp: '088837823323',
                      ),
                      const SizedBox(height: 12),
                      ReservationCard(
                        waktu: '08:00-09:00',
                        tanggal: '03/07/24',
                        nama: 'Dimas',
                        lapangan: '1',
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
