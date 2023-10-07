import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{
  TextEditingController? cEmail;
  TextEditingController? cPassword;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    cEmail = new TextEditingController();
    cPassword = new TextEditingController();
  }

  loginUser() async {
    final baseUrl = 'https://mediadwi.com';
    isLoading.value = true;

        final endpoint = '$baseUrl/api/latihan/login';
        final response = await http.post(Uri.parse(endpoint), body: {
          'email':cEmail!.text,
          'password': cPassword!.text,
        }
        );
        try {
          if (response.statusCode == 200) {
            final Map<String, dynamic> getToken = jsonDecode(response.body);
            final token = getToken['token'];
            print('Token : $token');
            Get.snackbar("selamat", "Login Sukses");
            
            isLoading.value = false;
          } else{
            Get.snackbar("Maaf", "Gagal Login");
          }
        } catch (e) {
          print(e);
        }
      }
    }

