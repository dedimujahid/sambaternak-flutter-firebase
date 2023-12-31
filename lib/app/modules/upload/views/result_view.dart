import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sambaternak_flutter_fbs/app/data/disease_model.dart';
import 'package:sambaternak_flutter_fbs/app/modules/chat/views/doctor_list_view.dart';
import 'package:sambaternak_flutter_fbs/app/modules/upload/controllers/upload_controller.dart';
import 'package:sambaternak_flutter_fbs/app/modules/upload/views/detail_view.dart';
import 'package:sambaternak_flutter_fbs/configs/configs.dart';
import 'package:sambaternak_flutter_fbs/constants/constants.dart';

class ResultView extends GetView<UploadController> {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back-icon.svg',
            width: getProperWidht(44),
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Hasil Analisis',
          style: whiteTextStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getProperWidht(10)),
            child: SvgPicture.asset('assets/icons/link-icon.svg',
                width: getProperWidht(44)),
          ),
        ],
        backgroundColor: kPrimaryColor,
        toolbarHeight: getProperWidht(86),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller.title.value == 'Healthy'
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/success-state.svg',
                          ),
                          SizedBox(
                            height: getProperWidht(11),
                          ),
                          Center(
                            child: Text(
                              'Kelihatannya Ayam Kamu Terindikasi Sehat ',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: getProperHeight(getProperWidht(56)),
                            margin:
                                const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kSecondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Analisis Gambar Lain',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const ResultContent(),
                Column(
                  children: [
                    Text(
                      'Ingin Mendiagnosis lebih lanjut?',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: getProperWidht(11),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: getProperHeight(getProperWidht(56)),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(const DoctorListView());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Konsultasi dengan Expert',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResultContent extends StatelessWidget {
  const ResultContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UploadController controller = Get.find<UploadController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hasil Analisis Gambar',
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 18),
        ),
        SizedBox(
          height: getProperWidht(5),
        ),
        Text(
          'Berikut penyakit dari hasil analisis gambar Klik penyakit untuk mengetahui lebih lanjut',
          style: primaryTextStyle.copyWith(fontSize: 14),
        ),
        SizedBox(
          height: getProperWidht(14),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            getProperWidht(12),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kSecondaryColor,
            ),
          ),
          child: Center(
            child: Container(
              width: getProperWidht(300),
              height: getProperHeight(160.0),
              padding: EdgeInsets.all(
                getProperWidht(52),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(controller.image.value),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: kSecondaryColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: getProperWidht(14),
        ),
        Text(
          'Prediksi Penyakit',
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 18),
        ),
        SizedBox(
          height: getProperWidht(5),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.result.length,
          itemBuilder: (context, index) {
            var item = controller.result[index];
            return ListTile(
              title: Text('Confidence: ${item['confidence']}'),
              subtitle: Text('Label: ${item['label']}'),
            );
          },
        ),
      ],
    );
  }
}

class DiseaseCard extends StatelessWidget {
  const DiseaseCard({
    Key? key,
    required this.diseaseModel,
  }) : super(key: key);

  final DiseaseModel diseaseModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        getProperWidht(12),
      ),
      margin: EdgeInsets.only(bottom: getProperWidht(14)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kSecondaryColor,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: getProperHeight(getProperWidht(56)),
            child: ElevatedButton(
              onPressed: () {
                Get.to(DetailView(
                  diseaseModel: diseaseModel,
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Opacity(
                    opacity: 0,
                    child: Icon(Icons.arrow_forward),
                  ),
                  Text(
                    diseaseModel.title,
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_right_outlined),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProperWidht(14),
          ),
          Row(
            children: [
              Container(
                width: getProperWidht(56),
                height: getProperWidht(56),
                padding: EdgeInsets.all(getProperWidht(10)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryLightColor,
                ),
                child: SvgPicture.asset(
                  'assets/icons/virus-icon.svg',
                  color: diseaseModel.color,
                ),
              ),
              SizedBox(
                width: getProperWidht(10),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      diseaseModel.desc,
                      style: primaryTextStyle.copyWith(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: getProperWidht(7),
                width: getProperWidht(7),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kAlert,
                ),
              ),
              SizedBox(
                width: getProperWidht(4),
              ),
              Text(
                diseaseModel.status,
                style: primaryTextStyle.copyWith(
                  color: kAlert,
                  fontSize: 10,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
