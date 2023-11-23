import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_color.dart';
import '../utils/constant.dart';
import 'progress.dart';

class PageBase extends StatelessWidget {
  Widget body;
  bool isLoading;
  Widget? appBar;
  Color? backgroundColor;
  TextDirection? textDirection;
  bool resizeToAvoidBottomInset;

  PageBase(
      {Key? key,
      required this.body,
      this.appBar,
      this.resizeToAvoidBottomInset = true,
      this.isLoading = false,
      this.backgroundColor,
      this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: textDirection ?? Constant.appTextDirection,
        child: Scaffold(
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            backgroundColor: backgroundColor ?? AppColor.backgroundColor,
            appBar: PreferredSize(
                preferredSize: const Size(double.infinity, 0),
                child: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    // Status bar color
                    statusBarColor: backgroundColor ?? AppColor.backgroundColor,
                    // Status bar brightness (optional)
                    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                    statusBarBrightness: Brightness.light, // For iOS (dark icons)
                  ),
                  elevation: 0, // App bar color
                )),
            body: Stack(
              children: [
                Column(
                  children: [
                    appBar ?? const SizedBox(),
                    Expanded(child: body),
                  ],
                ),
                if (isLoading) const DialogProgress()
              ],
            )));
  }
}
