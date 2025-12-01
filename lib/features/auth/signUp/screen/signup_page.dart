import 'package:cadeau/core/widgets/welcome_part.dart';
import 'package:cadeau/features/auth/signUp/data/repository/register_repo.dart';
import 'package:cadeau/features/auth/signUp/logic/bloc/register_bloc.dart';
import 'package:cadeau/features/auth/signUp/screen/widgets/signup_inputs.dart';
import 'package:cadeau/features/auth/signUp/screen/widgets/signup_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:cadeau/core/data/apis/dio_consumer.dart';
import 'package:get/get_utils/get_utils.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (_) {
        final repo = RegisterRepo(api: DioConsumer(dio: Dio()));
        return RegisterBloc(repo);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: ListView(
            children: [
              WelcomePart(
                withImage: true,
                text1: 'Welcome Back,'.tr,
                text2: 'Welcome back to our store'.tr,
              ),
              SignupInputs(),
              SizedBox(height: 20),
              SignupBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
