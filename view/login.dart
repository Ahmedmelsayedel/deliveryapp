import 'package:delivery/controller/logincontroller.dart';
import 'package:delivery/funcation/valdateclass.dart';
import 'package:delivery/widget/materilabuttonwidget.dart';
import 'package:delivery/widget/textformwidget.dart';
import 'package:delivery/widget/titleloginwidget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Logincontroller());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<Logincontroller>(builder: (controller) {
          return Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    Titlelogin(
                      title: "E",
                      title2: "Commerce",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Delivery App",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Enter you email and password"),
                    const SizedBox(
                      height: 50,
                    ),
                    Textformauth(
                        controller: controller.email,
                        isnumber: false,
                        validator: (val) {
                          return valdate("email", 5, 20, val!);
                        },
                        hint: "Email",
                        suffix: const Icon(Icons.email_outlined)),
                    const SizedBox(
                      height: 30,
                    ),
                    GetBuilder<Logincontroller>(
                      builder: (controlle) => Textformauth(
                          obscuretext: controlle.ishide,
                          controller: controlle.password,
                          onTap: () {
                            controlle.changehidepasspowrd();
                          },
                          isnumber: false,
                          validator: (val) {
                            return valdate("password", 5, 20, val!);
                          },
                          hint: "Password",
                          suffix: const Icon(Icons.lock_outline)),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Materialbuttoninlogin(
                        onPressed: () {
                          controller.logincheck();
                          
                        },
                        button: "Login"),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ));
        }));
  }
}
