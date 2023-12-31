import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sambaternak_flutter_fbs/configs/configs.dart';
import 'package:sambaternak_flutter_fbs/constants/constants.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 0, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(
                    height: getProperWidht(25),
                  ),
                  Image.asset('assets/images/logosambat.png'),
                  SizedBox(
                    height: getProperWidht(25),
                  ),
                  // ! Ubah semua text style dengan yang sudah di buat seperti contoh di bawah
                  Text(
                    "Masukkan email dan password untuk melanjutkan",
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: getProperWidht(20),
                  ),
                  const Row(
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color.fromARGB(221, 0, 0, 0)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProperWidht(10),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Masukkan Alamat Email",
                      prefixIcon: const Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },
                  ),
                  SizedBox(
                    height: getProperWidht(25),
                  ),
                  const Row(
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color.fromARGB(221, 0, 0, 0)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProperWidht(10),
                  ),
                  // ! ingat kasih fungsi visible na
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Masukkan Password",
                      suffixIcon: const Icon(Icons.visibility),
                      prefixIcon: const Icon(Icons.lock_outlined),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: controller.passwordController,
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                  ),
                  SizedBox(
                    height: getProperWidht(25),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 65, 172, 254)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(14)),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        controller.checkLogin();
                      },
                    ),
                  ),
                  SizedBox(
                    height: getProperWidht(150),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    //child: Text('Don\'t have an account? Create'),
                    child: const Text.rich(TextSpan(children: [
                      TextSpan(text: "Belum Punya Akun? "),
                      // TextSpan(
                      //   text: 'Daftar',
                      //   recognizer: TapGestureRecognizer()
                      //     ..onTap = () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => RegisterView2()));
                      //     },
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       color: Theme.of(context).colorScheme.secondary),
                      // ),
                    ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
