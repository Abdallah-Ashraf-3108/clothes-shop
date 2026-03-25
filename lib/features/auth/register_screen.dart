import 'package:ecommerce_app2/core/styles/app_colors.dart';
import 'package:ecommerce_app2/core/widgets/custom_button.dart';
import 'package:ecommerce_app2/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app2/core/widgets/spacing_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController fullNameController;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 25).r,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
              ),
              HeightSpace(8.h),
              Text(
                "Let's create your account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryColor,
                ),
              ),
              HeightSpace(24.h),
              Text(
                'Full Name',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
              ),
              HeightSpace(8.h),
              CustomTextField(
                controller: userNameController,
                hintText: "Enter your full name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your user name';
                  }
                  return null;
                },
              ),
              HeightSpace(16.h),
              Text(
                'User Name',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
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
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
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
              HeightSpace(16.h),
              Text(
                'Confirm Password',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
              ),
              HeightSpace(8.h),
              CustomTextField(
                controller: passwordController,
                hintText: "Enter your confirm password",
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
                  }
                },
                buttonText: "Create Account",
                buttonColor: Color(0xFF3669C9),
              ),
              Spacer(),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
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
                                (context).go('/login');
                              },
                        text: 'Login',
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
