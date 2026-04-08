import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dartz/dartz.dart' as either;
import 'package:dio/dio.dart';
import 'package:ecommerce_app2/core/styles/app_colors.dart';
import 'package:ecommerce_app2/core/widgets/custom_button.dart';
import 'package:ecommerce_app2/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app2/core/widgets/show_animated_snackbar.dart';
import 'package:ecommerce_app2/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app2/features/auth/models/login_response_model.dart';
import 'package:ecommerce_app2/features/auth/register_screen.dart';
import 'package:ecommerce_app2/features/auth/repo/auth_repo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }
  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    final resp = await AuthRepo().login(
      username: userNameController.text,
      password: passwordController.text,
    );

    resp.fold(
      (message) {
        showAnimatedSnackbar(
          message: "message",
          context: context,
          type: AnimatedSnackBarType.error,
        );
        log(message);
      },
      (response) {
        showAnimatedSnackbar(
          message: "Login successful",
          context: context,
          type: AnimatedSnackBarType.success,
        );
        log(response.toString());

        // 🔥 هنا تعمل navigation
        context.go('/home');
      },
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 25).r,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login to your account',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      HeightSpace(8.h),
                      Text(
                        "It’s great to see you again.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      HeightSpace(24.h),
                      Text(
                        'User Name',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      HeightSpace(8.h),
                      CustomTextField(
                        controller: userNameController,
                        hintText: "Enter your user name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your user name';
                          }
                          return null;
                        },
                      ),
                      HeightSpace(16.h),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      HeightSpace(8.h),
                      CustomTextField(
                        controller: passwordController,
                        hintText: "Enter your password",
                        suffixIcon: Icon(Icons.visibility_off_outlined),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      HeightSpace(55.h),
                      CustomButton(
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar.
                            login();
                          }
                        },
                        buttonText: "Sign In",
                        buttonColor: Color(0xFF3669C9),
                      ),
                      Spacer(),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'Don’t have an account? ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryColor,
                            ),
                            children: [
                              TextSpan(
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        (context).go('/register');
                                      },
                                text: 'Join',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
