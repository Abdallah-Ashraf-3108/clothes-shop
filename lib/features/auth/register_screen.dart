import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:ecommerce_app2/core/di/service_locator.dart';
import 'package:ecommerce_app2/core/networking/storage_helper.dart';
import 'package:ecommerce_app2/core/styles/app_colors.dart';
import 'package:ecommerce_app2/core/widgets/custom_button.dart';
import 'package:ecommerce_app2/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app2/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app2/core/widgets/show_animated_snackbar.dart';
import 'package:ecommerce_app2/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app2/features/auth/cubit/auth_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController phoneController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();

    // Check if user is already logged in
    locator<StorageHelper>().getToken().then((token) {
      if (token != null && token.isNotEmpty) {
        context.go('/mainScreen');
      }
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is AuthError) {
          showAnimatedSnackbar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
        if (state is AuthSuccess) {
          showAnimatedSnackbar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.success,
          );
          context.go('/mainScreen');
        }
        if (state is AuthLoading) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 25).r,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
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
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    HeightSpace(8.h),
                    CustomTextField(
                      controller: fullNameController,
                      hintText: "Enter your full name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    HeightSpace(16.h),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    HeightSpace(8.h),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    HeightSpace(16.h),
                    Text(
                      'Phone',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    HeightSpace(8.h),
                    CustomTextField(
                      controller: phoneController,
                      hintText: "Enter your phone number",
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length < 11) {
                          return 'Please enter a valid phone number';
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
                      obscureText: true,
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    HeightSpace(16.h),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    HeightSpace(8.h),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hintText: "Enter your confirm password",
                      obscureText: true,
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your confirm password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    HeightSpace(55.h),
                    CustomButton(
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().register(
                            name: fullNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                      buttonText: "Create Account",
                      buttonColor: Color(0xFF3669C9),
                    ),
                    HeightSpace(16.h),
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
                                      (context).go('/loginScreen');
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
          ),
        );
      },
    );
  }
}
