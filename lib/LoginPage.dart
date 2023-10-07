import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hit_api/Homepage.dart';
import 'LoginController.dart';


class LoginPage extends StatelessWidget {
  final ctr = Get.put(LoginController());

  Widget form({required String label,required bool isObsecure, required TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
        obscureText: isObsecure,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          labelStyle: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page"
        ),
      ),
      body: Obx(
        () => ctr.isLoading.value
        ? Center(
          child: CircularProgressIndicator(),
        ) : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            form(label: "Email", isObsecure: false, controller: ctr.cEmail!),
            form(label: "Password", isObsecure: true, controller: ctr.cPassword!),
            ElevatedButton(onPressed: (){
              Get.to(Homepage());
              print(ctr.isLoading.value);
            }, child: Text("Login"))
          ],
        ),
      )
      ) 
    );
  }
}

