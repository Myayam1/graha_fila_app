import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grafil_app/controllers/addreservation_controller.dart';
import 'package:grafil_app/pages/reservasi/API/addreservasi_model.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';
import 'package:grafil_app/widget/mytimebox.dart';

class AddReservationPage extends StatelessWidget {
  final controller = Get.find<AddReservationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.background,
      appBar: AppBar(
        backgroundColor: Mycolors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Mycolors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: MyText(
          text: "Add Reservation",
          fontSize: 24,
          textcolor: Mycolors.blue,
          fontWeight: FontWeight.w800,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name field
                    SizedBox(height: 16),
                    MyTextField(
                      controller: controller.nameController,
                      iconlogo: Icon(Icons.person, color: Mycolors.darkBlue),
                      width: double.infinity,
                      height: 50,
                      borderRadius: 25,
                      hintText: "Nama",
                    ),

                    // Phone field
                    SizedBox(height: 16),
                    MyTextField(
                      controller: controller.phoneController,
                      iconlogo: Icon(Icons.phone, color: Mycolors.darkBlue),
                      width: double.infinity,
                      height: 50,
                      borderRadius: 25,
                      hintText: "No Telpon",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(15),
                      ],
                    ),

                    SizedBox(height: 16),
                    MyText(
                      text: "Jumlah Pembayaran",
                      fontSize: 16,
                      textcolor: Mycolors.darkBlue,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8),
                    MyTextField(
                      controller: controller.paymentController,
                      iconlogo: Icon(Icons.payment, color: Mycolors.darkBlue),
                      width: double.infinity,
                      height: 50,
                      borderRadius: 25,
                      hintText: "Harga pembayaran",
                      
                    ),

                    // Spot selector (button group)
                    SizedBox(height: 16),
                    MyText(
                      text: "Pilih Lapangan",
                      fontSize: 16,
                      textcolor: Mycolors.darkBlue,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8),
                    _buildSpotSelector(),

                    // Date field
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => controller.selectDate(context),
                      child: AbsorbPointer(
                        child: MyTextField(
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          controller: controller.dateController,
                          hintText: "Pilih tanggal",
                          fontWeight: FontWeight.w600,
                          textcolor: Mycolors.darkBlue,
                          iconlogo: Icon(
                            Icons.calendar_today,
                            color: Mycolors.darkBlue,
                          ),
                          width: double.infinity,
                          height: 50,
                          borderRadius: 25,
                        ),
                      ),
                    ),

                    // Time slots section
                    SizedBox(height: 24),
                    Center(
                      child: MyText(
                        text: "Waktu",
                        fontSize: 22,
                        textcolor: Mycolors.blue,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    SizedBox(height: 16),
                    _buildTimeGrid(context),

                    // Add button
                    SizedBox(height: 24),
                    Center(
                      child: MyButton(
                        text: "Tambah",
                        onPressed: () => controller.createReservation(),
                        buttonbackgroundColor: Mycolors.blue,
                        textColor: Mycolors.white,
                        width: 150,
                        height: 45,
                        borderRadius: 25,
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Loading indicator
            if (controller.isLoading.value)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }

  // Spot selector with toggle buttons
  Widget _buildSpotSelector() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.setSpotId(1),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color:
                      controller.selectedSpotId.value == 1
                          ? Mycolors.blue
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Mycolors.blue, width: 1.5),
                ),
                child: Center(
                  child: MyText(
                    text: "Lapangan 1",
                    textcolor:
                        controller.selectedSpotId.value == 1
                            ? Mycolors.white
                            : Mycolors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () => controller.setSpotId(2),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color:
                      controller.selectedSpotId.value == 2
                          ? Mycolors.blue
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Mycolors.blue, width: 1.5),
                ),
                child: Center(
                  child: MyText(
                    text: "Lapangan 2",
                    textcolor:
                        controller.selectedSpotId.value == 2
                            ? Mycolors.white
                            : Mycolors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () => controller.setSpotId(3),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color:
                      controller.selectedSpotId.value == 3
                          ? Mycolors.blue
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Mycolors.blue, width: 1.5),
                ),
                child: Center(
                  child: MyText(
                    text: "Lapangan 3",
                    textcolor:
                        controller.selectedSpotId.value == 3
                            ? Mycolors.white
                            : Mycolors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeGrid(BuildContext context) {
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: controller.timeSlots.length,
        itemBuilder: (context, index) {
          final String time = controller.allTimeSlots[index];
          final TimeSlot slot = controller.timeSlots[time]!;

          return MyTimeBox.withStatus(
            time: slot.time,
            status: slot.status,
            primaryColor: Mycolors.blue,
            disabledColor: Mycolors.grey,
            borderWidth: 2,
            borderRadius: 30,
            onTap: () {
              if (slot.status == "available") {
                controller.toggleTimeSlot(time);
              } else if (slot.status == "selected") {
                controller.toggleTimeSlot(time);
              }
            },
          );
        },
      ),
    );
  }
}
