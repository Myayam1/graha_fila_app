import 'package:flutter/material.dart';
import 'package:grafil_app/widget/mycard.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';

class ReservationCard extends StatelessWidget {
  final String waktu;
  final String tanggal;
  final String nama;
  final String lapangan;
  final String telp;
  final VoidCallback? onTap;

  const ReservationCard({
    Key? key,
    required this.waktu,
    required this.tanggal,
    required this.nama,
    required this.lapangan,
    required this.telp,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Mycard(
      width: double.infinity,
      borderRadius: 12,
      hasOutline: true,
      outlineColor: Colors.transparent,
      color: Colors.white,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header dengan waktu dan tanggal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: waktu,
                    fontSize: 14,
                    textcolor: Mycolors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  MyText(
                    text: tanggal,
                    fontSize: 14,
                    textcolor: Mycolors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Info dalam format label: nilai seperti di gambar
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kolom label
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Nama',
                        fontSize: 14,
                        textcolor: Mycolors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 4),
                      MyText(
                        text: 'lapangan',
                        fontSize: 14,
                        textcolor: Mycolors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 4),
                      MyText(
                        text: 'No telp',
                        fontSize: 14,
                        textcolor: Mycolors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // Kolom titik dua
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Column(
                      children: [
                        MyText(
                          text: ':',
                          fontSize: 14,
                          textcolor: Mycolors.blue,
                        ),
                        const SizedBox(height: 4),
                        MyText(
                          text: ':',
                          fontSize: 14,
                          textcolor: Mycolors.blue,
                        ),
                        const SizedBox(height: 4),
                        MyText(
                          text: ':',
                          fontSize: 14,
                          textcolor: Mycolors.blue,
                        ),
                      ],
                    ),
                  ),
                  // Kolom nilai
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: nama,
                          fontSize: 14,
                          textcolor: Mycolors.blue,
                          fontWeight: FontWeight.bold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        MyText(
                          text: lapangan,
                          fontSize: 14,
                          textcolor: Mycolors.blue,
                          fontWeight: FontWeight.bold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        MyText(
                          text: telp,
                          fontSize: 14,
                          textcolor: Mycolors.blue,
                          fontWeight: FontWeight.bold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}