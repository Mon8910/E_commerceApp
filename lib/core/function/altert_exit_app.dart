import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> altretExitApp() {
  Get.defaultDialog(
      title: 'warning',
      middleText: 'Do You Want to Exit the Application',
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: const Text('Confirm'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('cancel'),
        ),
      ]);
      return Future.value(true);
}
