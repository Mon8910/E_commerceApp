import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/function/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postRequest(
      String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        print('here2 ${data}');
        var response = await http.post(Uri.parse(linkUrl), body: data);
        print('here');
        print('gggg ${response.body}');
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      print(_);
      return const Left(StatusRequest.serverfailure);
    }
  }
}
