import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sambaternak_flutter_fbs/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:sambaternak_flutter_fbs/app/modules/market_place/components/card_caraousel_market.dart';
import 'package:sambaternak_flutter_fbs/configs/configs.dart';

import '../../../../constants/constants.dart';
import '../controllers/market_controller.dart';

class MarketDetail extends GetView<MarketController> {
  const MarketDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    color: kPrimaryColor,
                    child: Row(
                      children: [
                        SizedBox(
                          width: getProperWidht(9),
                        ),
                        SvgPicture.asset('assets/images/logosambat.svg'),
                        SizedBox(
                          width: 300.0,
                          child: Center(
                            child: Text(
                              'E-Commerce',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        const Icon(
                          Icons.add_shopping_cart,
                          color: kBackgroundColor1,
                        ),
                        SizedBox(
                          width: getProperWidht(10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProperWidht(18),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Kamu Harus Tau!',
                  style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      color: kPrimaryTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
                child: Text(
                  'Pemberian pakan, Vitamin dan alat penunjang kesehatan lainnnya dapat Meningkatkan potensi keunggulan pada ternak yang dipelihara dan meningkatkan hasil produksi',
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, color: kPrimaryTextColor),
                ),
              ),
              SizedBox(
                height: getProperWidht(18),
              ),
              const CarouselScroll(),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: SizedBox(
                  width: double.infinity,
                  height: getProperHeight(getProperWidht(56)),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(null);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.shopping_cart),
                          Expanded(
                            child: Center(
                              child: Text(
                                'Beli Sekarang',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarView(),
    );
  }
}

class CarouselScroll extends StatelessWidget {
  const CarouselScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MarketController controller = Get.find();
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller.buttonCarouselController,
          options: CarouselOptions(
            height: getProperWidht(160),
            onPageChanged: (index, reason) => controller.changePage(index),
            autoPlay: true,
          ),
          items: controller.korosal.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return CardCaraouselMarket(
                  img: i['image'],
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: getProperWidht(14),
        ),
        Obx(
          () => DotsIndicator(
            dotsCount: 3,
            position: controller.currentIndex.value.toDouble(),
            decorator: DotsDecorator(
              activeColor: kPrimaryColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),
      ],
    );
  }
}
