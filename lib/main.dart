import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teramedik/app/utils/constants/text_const.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: TextConst.teramedik,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
    ),
  );
}
