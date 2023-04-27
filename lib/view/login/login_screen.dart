import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/view_model/controller/login/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final loginVM = Get.put(LoginViewModel());
final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(automaticallyImplyLeading: false, title: Text('Login Screen')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: loginVM.emailController.value,
              focusNode: loginVM.emailFocusNode.value,
              decoration: InputDecoration(
                  hintText: 'email_hint'.tr, border: OutlineInputBorder()),
            ),
            TextFormField(
              controller: loginVM.passwordController.value,
              focusNode: loginVM.passwordFocusNode.value,
              decoration: InputDecoration(
                  hintText: 'password'.tr, border: OutlineInputBorder()),
            ),
            Obx(
              () => RoundButton(
                title: 'Login',
                loading: loginVM.loading.value,
                onPress: () {
                  // if (_formKey.currentState!.validate()) {
                  loginVM.loginApi();
                  // }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
