import 'package:cadeau/core/data/apis/dio_consumer.dart';
import 'package:cadeau/features/auth/login/data/repository/login_repo.dart';
import 'package:cadeau/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:cadeau/features/auth/login/screen/widgets/login_bottom.dart';
import 'package:cadeau/features/auth/login/screen/widgets/login_inputs.dart';
import 'package:cadeau/core/widgets/welcome_part.dart' show WelcomePart;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) {
        final repo = LoginRepo(api: DioConsumer(dio: Dio()));
        return LoginCubit(repo);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              WelcomePart(
                withImage: true,
                text1: 'Welcome Back,'.tr,
                text2: 'Welcome back to our store'.tr,
              ),
              LoginInputs(),
              LoginBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
