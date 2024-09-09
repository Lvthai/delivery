import 'package:deliveryapp/components/my_button.dart';
import 'package:deliveryapp/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:deliveryapp/components/my_textfield.dart';
import 'package:flutter/widgets.dart';




class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void login() async{
      final _authService = AuthService();

      try{
        await _authService.signInWithEmailPassword(emailController.text, passwordController.text);
      }

      catch(e){
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
                "Ứng Dụng Giao Đồ Ăn",
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


              MyTextField(
                controller: passwordController,
                hintText: "Mật khẩu",
                obscureText: true,
              ),

              const SizedBox(height: 10),

              //My sign in button
              MyButton(text: "Đăng Nhập", onTap: login,),

              const SizedBox(height: 25),

              //register ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn chưa có tài khoản?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Đăng ký ngay?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      )
                      ),
                  )
                ],
              )


            ],
          ),
        ),
    );
  }
}


 