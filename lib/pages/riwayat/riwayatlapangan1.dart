import 'package:flutter/material.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/myimgbtn.dart';
import 'package:grafil_app/widget/myreservationcard.dart';
import 'package:grafil_app/widget/mytextfield.dart';

class RiwayatReservasi1 extends StatelessWidget {
  final List<Map<String, String>> datareservasi = [
    {
      'waktu': '13:00 - 14:00 ',
      'tanggal': '20 Maret 2025',
      'nama': 'John Doe',
      'lapangan': 'Lapangan 1',
      'telp': '081234123445',
    },
    {
      'waktu': '11:00 - 12:00 ',
      'tanggal': '10 Maret 2025',
      'nama': 'Jane Smith',
      'lapangan': 'Lapangan 2',
      'telp': '081298765432',
    },
    {
      'waktu': '12:00 PM',
      'tanggal': '30 Maret 2025',
      'nama': 'Michael Johnson',
      'lapangan': 'Lapangan 3',
      'telp': '081212341234',
    },
    {
      'waktu': '12:00 PM',
      'tanggal': '30 Maret 2025',
      'nama': 'Michael Johnson',
      'lapangan': 'Lapangan 1',
      'telp': '081212341444',
    },
  ];

  RiwayatReservasi1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.background,
      body: Column(
        children: [
          Container(
            height: 300,
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Mycolors.white,
              boxShadow: [
                BoxShadow(
                  color: Mycolors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
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
                const SizedBox(height: 10),
                const Text(
                  "Lapangan 1",
                  style: TextStyle(
                    color: Mycolors.blue,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Mycolors.background,
                    boxShadow: [
                      BoxShadow(
                        color: Mycolors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: MyImageButton(
                    imagePath: 'assets/images/logolapangan1.png',
                    onTap: () {},
                    width: 250,
                    height: 150,
                    borderRadius: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Mycolors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Mycolors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: MyTextField(
                              hintText: "Search",
                              iconlogo: const Icon(Icons.search,color: Mycolors.blue,),
                              width: double.infinity,
                              height: 50,
                              borderRadius: 24,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                              hintTextStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Mycolors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.sort, color: Mycolors.blue),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(12.0),

                        itemCount: datareservasi.length,
                        itemBuilder: (context, index) {
                          final reservation = datareservasi[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: ReservationCard(
                              waktu: reservation['waktu']!,
                              tanggal: reservation['tanggal']!,
                              nama: reservation['nama']!,
                              lapangan: reservation['lapangan']!,
                              telp: reservation['telp']!,
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
