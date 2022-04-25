import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:github_users/exports.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> with Validators {
  final GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isCheckBoxSelected = ValueNotifier(false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              CustomTextField(
                  controller: emailController,
                  textfieldLabel: "Email address",
                  validator: validateEmail),
              const YMargin(10),
              CustomTextField(
                  obscureText: true,
                  controller: passwordController,
                  textfieldLabel: "Password",
                  validator: validatePassword),
              Row(
                children: [
                  ValueListenableBuilder<bool>(
                      valueListenable: isCheckBoxSelected,
                      builder:
                          (BuildContext context, bool value, Widget? child) {
                        return Checkbox(
                          fillColor: MaterialStateProperty.resolveWith(
                              ((states) => kPrimaryColor)),
                          shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: kPrimaryColor, width: 0.5),
                              borderRadius: BorderRadius.circular(2)),
                          value: value,
                          onChanged: (bool? value) {
                            isCheckBoxSelected.value = value!;
                          },
                        );
                      }),
                  Text("Remember Me", style: mulishLightBlackTextStyle),
                  const Spacer(),
                  Text("Forgot Password?", style: mulishLightBlackTextStyle),
                ],
              ),
              const Spacer(),
              CustomButton(
                  title: "Sign In",
                  onTap: () {
                    if (_formKey!.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.homeView);
                    }
                  }),
              const YMargin(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: mulishLightBlackTextStyle.copyWith(fontSize: 14.sp),
                  ),
                  Text(
                    "Sign up",
                    style: mulishTextStyle.copyWith(color: kPrimaryColor),
                  )
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
