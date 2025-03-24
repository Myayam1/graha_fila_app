import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/myimgbtn.dart';
import 'package:grafil_app/widget/myreservationcard.dart';
import 'package:grafil_app/widget/mytextfield.dart';


class ReservasiLapangan3 extends StatefulWidget {
  const ReservasiLapangan3({super.key});

  @override
  State<ReservasiLapangan3> createState() => _ReservasiLapangan3State();
}

class _ReservasiLapangan3State extends State<ReservasiLapangan3> {
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
         
          Container(
            height: 250,
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
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
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Mycolors.darkBlue),
                       onPressed: () {
                         Navigator.pop(context);},
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Lapangan",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Mycolors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                MyImageButton(
                  imagePath: 'assets/images/logolapangan3.png',
                  onTap: () {},
                  width: 100,
                  height: 100,
                  borderRadius: 20,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MyTextField(
              controller: dateController,
              hintText: "Masukkan tanggal",
              iconlogo: const Icon(Icons.calendar_today,color: Mycolors.blue,),
              width: double.infinity,
              height: 50,
              borderRadius: 24,
              isDatePicker: true,
              suffixIcon: const Icon(Icons.arrow_drop_down_sharp,color: Mycolors.blue,),textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: Mycolors.blue),hintTextStyle: TextStyle(fontSize: 15,color: Mycolors.darkBlue,fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Mycolors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Mycolors.black.withOpacity(0.05),
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
                    lapangan: '2',
                    telp: '088837823323',
                  ),
                  const SizedBox(height: 20),
                  ReservationCard(
                    waktu: '08:00-09:00',
                    tanggal: '03/07/24',
                    nama: 'Rusli',
                    lapangan: '2',
                    telp: '088837823323',
                  ),
                  const SizedBox(height: 20),
                  ReservationCard(
                    waktu: '08:00-09:00',
                    tanggal: '03/07/24',
                    nama: 'Anto',
                    lapangan: '2',
                    telp: '088837823323',
                  ),
                  const SizedBox(height: 20),
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
    );
  }
}
