import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base_controller.dart';

class HomeController extends BaseController {

  bool isLoading = false;
  List<Widget> imageSliders = [];

  final List<String> imgList = [
    'assets/icons/home_slider.png',
    'assets/icons/slider.png',
    'assets/icons/home_slider.png',
    'assets/icons/slider.png',
    'assets/icons/slider.png',
    'assets/icons/home_slider.png',
    'assets/icons/slider.png',
  ];

  initSlider() {
    imageSliders = imgList.map((item) => ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(5.0)), child: Image.asset(item, fit: BoxFit.cover, width: double.infinity))).toList();
  }
}