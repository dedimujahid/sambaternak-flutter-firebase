import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sambaternak_flutter_fbs/app/data/disease_model.dart';
import 'package:flutter_tflite/flutter_tflite.dart' as tfl;

class UploadController extends GetxController {
  final result = <dynamic>[].obs;
  final isPick = false.obs;
  final isExpan = false.obs;
  final image = File('path').obs;
  final title = ''.obs;
  final isLoading = false.obs;
  List<DiseaseModel> listDisease = [];

  void changeExpan() => isExpan.value = !isExpan.value;

  void onLoading() => isLoading.value = !isLoading.value;

  @override
  void onInit() {
    loadModel();
    super.onInit();
  }

  Future<void> loadModel() async {
    tfl.Tflite.close();
    try {
      String? res = await tfl.Tflite.loadModel(
        model: "assets/tflite/model_inception_1.tflite",
        labels: "assets/tflite/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false,
      );
      if (kDebugMode) {
        print('Model loaded: $res');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading model: $e');
      }
    }
  }

  Future<void> imageClassification() async {
    try {
      var recognitions = await tfl.Tflite.runModelOnImage(
        path: image.value.path,
        imageMean: 127.5,
        imageStd: 127.5,
        numResults: 6,
        threshold: 0.05,
        asynch: true,
      );

      result.value = recognitions!;
      if (kDebugMode) {
        print(result);
      }
      changeLabelToTitle();
    } catch (e) {
      throw Exception(e);
    }
  }

  void getImage(File filepath) {
    isPick.value = true;
    image.value = filepath;
  }

  void removeImage() {
    isPick.value = false;
    image.value = File('');
  }

  void changeLabelToTitle() {
    switch (result[0]['label']) {
      case 'pmk':
        title.value = 'PMK';
        listDisease = DiseaseModel.listPmk;
        break;
      case 'lsd':
        title.value = 'LSD';
        listDisease = DiseaseModel.listNewLsd;
        break;
      default:
        listDisease = [];
    }
  }
}
