import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:hurry/app/modules/auth/domain/models/auth_model.dart';
import 'package:hurry/app/modules/auth/widgets/input/auth_input.dart';
import 'package:hurry/app/modules/src/buttons/primary_button.dart';
import 'package:hurry/app/modules/src/colors.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        color: AppColors.backGroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * .3,
                width: screenSize.width,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: screenSize.height * .6,
                child: Column(
                  children: [
                    AuthInput(
                      hint: 'Email',
                      obscure: false,
                      controller: emailController,
                    ),
                    AuthInput(
                      hint: 'Password',
                      obscure: true,
                      controller: passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    PrimaryButton(
                      text: 'ENTRAR',
                      onPressed: () async {
                        store.login(passwordController.text, emailController.text);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Nao tem um aconta? ',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Modular.to.pushNamed('/auth/register');
                          },
                          child: Text(
                            'Registre-se',
                            style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
