// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:deliveryapp/components/my_button.dart';
import 'package:deliveryapp/components/my_textfield.dart';
import 'package:deliveryapp/service/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void register() async {
    final _authService = AuthService();

    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmpasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Vui lòng nhập đủ thông tin"),
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Mật khẩu không trùng khớp!"),
        ),
      );
      return;
    }

    try {
      await _authService.signUpWithEmailPassword(email, password);
      // Đăng ký thành công, quay lại màn hình đăng nhập
      
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),
            //massage, app sologan

            Text(
              "Tạo một tài khoản cho bạn",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            //email textfile

            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //password
            MyTextField(
              controller: passwordController,
              hintText: "Mật khẩu",
              obscureText: true,
            ),

            const SizedBox(height: 10),
            //confirm pass
            MyTextField(
              controller: confirmpasswordController,
              hintText: "Xác nhân mật khẩu",
              obscureText: true,
            ),

            const SizedBox(height: 10),

            //My sign up button
            MyButton(
              text: "Đăng ký",
              onTap: () {
                register();
              },
            ),

            const SizedBox(height: 25),

            //đã có tài khoản  & đăng nhập ngay
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Đã có tài khoản",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Đăng nhập ngay",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
