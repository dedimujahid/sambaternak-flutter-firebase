import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sambaternak_flutter_fbs/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:sambaternak_flutter_fbs/app/modules/chat/views/doctor_list_view.dart';
import 'package:sambaternak_flutter_fbs/configs/configs.dart';
import 'package:sambaternak_flutter_fbs/constants/constants.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pesan Saya',
          style: whiteTextStyle,
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProperWidht(50),
                ),
                Image.asset('assets/images/cuate.png'),
                SizedBox(
                  height: getProperWidht(25),
                ),
                const Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Opss tidak ada riwayat chat?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 16, 91, 153),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProperWidht(18),
                ),
                const Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Anda belum pernah melakukan konsultasi dengan ahli",
                    style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117),
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProperWidht(10),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: SizedBox(
                      width: getProperWidht(300),
                      height: getProperHeight(getProperWidht(50)),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(const DoctorListView());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ), // masih direct ke home
                        child: Text(
                          'Konsultasi Sekarang',
                          style: whiteTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarView(),
    );
  }
}
