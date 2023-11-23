import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class DialogProgress extends StatelessWidget {
  const DialogProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: (){

        },
        child: Scaffold(
          backgroundColor: AppColor.transparent,
          body: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration:  BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColor.colorPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
