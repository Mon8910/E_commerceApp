import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/app_routes.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home.data.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;


abstract class HomeController extends GetxController {
  intialData();
  getData();
  goToItems(List categories, int selectedItem, int catid);
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  int? id;
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  List categories = [];
  List items = [];
  String? lang;
  bool isSearch = false;
  TextEditingController? search;
  List<ItemsModel> itemsData = [];
//   Future<String?> getAccessToken() async {
//     final serviceAccountJson = {
//   "type": "service_account",
//   "project_id": "ecommercephp-bb93f",
//   "private_key_id": "e31a360f67dee67ae58922f7347334c49cc0f647",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCSVzGLhRt+kkjz\nbfnxITcwY6GofqC+RmYIuqWn2zeCjBH5vjWmir294PvoB/3TwC3tZho2gjGxPakk\neCJGvyOqMajdbXyXhdvCGzU7Ag+D96nm5WKWiesk7ZT8k8DvEOrZDbyW66oGqXaS\n81YoT+cAaXuaILxX+vlE3VcMycBmRkZpA3v9JQ3/F6CYSq+bYNr/x3ZqqZcp6Bk4\nB0HApUtgJBYeTJgRYPVMWY7sqBxkHLsaKLco9x7D/lFvlWRzDyvz1Ob/lbYe2rfp\nbS1B2bRngj+7PCWpN17QbnLNlqD3+3yPccS8SF0qvVoRx1FvHbwZO5k6dkEp/E+r\npjX982vPAgMBAAECggEAMJzDahgA/qZEkoztcuL4TNxD5s+NwTdsjKjH/78sLPMv\nw3kipFzBVBKpS7Zf5NgZyZtZyNKuBDU5+1Hm/P5gsBhIAqpssX73df8Iyz3PfqSm\nbXu0qNJO6Rj9HXxNonzJrunHxJCrjgP8TiuEaubEE1h3BUermURXSr+GO8rHXZGp\nE7SzbneeGpPsYLA/DEQEJi21r9WYysuu8ck+80bdkk1IFy8hYhHZ0kRP5oLpxpic\nywDR4y6L1cxsf+SdLg8NLESXp/GmWH8MuDgi4GXmzlZzwgjXVDpPWft143EFsurr\n/lWFZF5ioXKFB44j1gBWFYD0TFRFEPoV5d2abrwwnQKBgQC+G5PzhcI1VDTzhVuq\nzW+HVWG0lMcXtZ1CBTwi/Wn3ewKxeITEcv0LQR7SLHUyCRHRUwhsykaM2WxPFFaj\nLgq7ooOzDMcm4bXcazCJjBTnz681YFadD1bNxxDY/mNSjS27YmK/FTevUsQYPq08\noaQKnj98puFGfCCK51SwaI83mwKBgQDFEB7t3k50koU6QejXrdV5/22/v2vynJpD\noPkr8DfUyKhdVXg8Hm5/pxOB2JJZLzTOWTmS3sOVija7apVdgQJay3wKvpBTy5OT\n8S7f2egn/MFG/Zxt5sGRnX8Ri/+kMDOAK0hrz3vKx1m6frMOR9T6Rs28gHqFyp0H\nn5hQRR9x3QKBgQCrNk0eIhYRT2BM/YrcHh7WxHe1WdSgrskNX4eUf6RC5X88dC0m\ne+UXkLOAV9fIk1B/tAc/a0D0sxAPfGK2nc2+xRNVWym1A8x00fipuAZP68SBDt2S\nn/DubNzogNrUyx8nxujl7Ob0uFaw+ymsFGuXwIOu8OCsSThJwSONqO1rBwKBgQCO\nTSbYhEjJOykDuaaHYJsgXsgEyBkOd/GZ1ns4NF5MxJ130IljeGI4whB/GkIMLt+G\nBr5hhYVczhLZ4Yx8mfV2VSx8ocGdEQu/sFE2CqfvgECdn/O/FPxAx6eDp0HycXAv\nJJJGb+ynsK7l0ipArLRqCoj0jx5q0LX2VFPr2w5q7QKBgDB2Bn4sS+zx1eBYndBP\n31FFcNREMmJzxWStNWiovhMIY/7b3JXzpudAoE1CG76tYPEYVrFxJ651ls15XYoA\n2UZqS5ODQkQRhzNIooyt7gwibvB6JFxtrQ8um2b8TrupOdBP7JE/8z3K0sfmk10X\nySJO17EWuMTLedFsLiT0/518\n-----END PRIVATE KEY-----\n",
//   "client_email": "firebase-adminsdk-iqth3@ecommercephp-bb93f.iam.gserviceaccount.com",
//   "client_id": "115944982828486563808",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-iqth3%40ecommercephp-bb93f.iam.gserviceaccount.com",
//   "universe_domain": "googleapis.com"
// };


//     List<String> scopes = [
//       "https://www.googleapis.com/auth/userinfo.email",
//       "https://www.googleapis.com/auth/firebase.database",
//       "https://www.googleapis.com/auth/firebase.messaging"
//     ];

//     try {
//       http.Client client = await auth.clientViaServiceAccount(
//           auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

//       auth.AccessCredentials credentials =
//           await auth.obtainAccessCredentialsViaServiceAccount(
//               auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//               scopes,
//               client);

//       client.close();
//       print(
//           "Access Token: ${credentials.accessToken.data}"); // Print Access Token
//       return credentials.accessToken.data;
//     } catch (e) {
//       print("Error getting access token: $e");
//       return null;
//     }
//   }
  


  @override
  intialData() {
    lang = myServices.sharedPreferences.getString("lang");

    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt('id');
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.subscribeToTopic("users");
    search = TextEditingController();
    getData();
    intialData();
    super.onInit();
    
   
  }

  checkSearch(val) {
    if (val == '') {
      statusRequest=StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      categories.addAll(response['categories']['data']);
      items.addAll(response['items']['data']);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchDatat(search!.text);
    print('==========$response');
    statusRequest = handlingData(response);
    if (response['status'] == 'success') {
      itemsData.clear();
      List responseData = response['data'];
      itemsData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  goToItems(categories, selectedItem, catid) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "Selectedcat": selectedItem,
      "catid": catid
    });
  }
  goToItemsDetails(itemsModel) {
    Get.toNamed(AppRoutes.itemsDetaisl, arguments: {"itemsModel": itemsModel});
  }
}
