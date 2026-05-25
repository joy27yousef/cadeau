import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/message.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/product/logic/cubit/add_rating_cubit.dart';
import 'package:cadeau/features/product/logic/cubit/add_rating_state.dart'
    hide AddRatingCubit;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class AddRatingPage extends StatelessWidget {
  const AddRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final int productId = args?['productId'] is String
        ? int.parse(args!['productId'])
        : args!['productId'] as int;

    final reviewController = TextEditingController();
    final ratingNotifier = ValueNotifier<double>(0);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              sl<ProductBloc>()..add(LoadProductById(productId as String)),
        ),
        BlocProvider(create: (_) => AddRatingCubit(repo: sl())),
      ],
      child: BlocListener<AddRatingCubit, AddRatingState>(
        listener: (context, state) {
          if (state is AddRatingSuccess) {
            showMessage(context, message: state.message, isSuccess: true);
            Get.back();
          } else if (state is AddRatingError) {
            showMessage(context, message: state.message, isSuccess: false);
          }
        },
        child: Scaffold(
          appBar: AppbarScreens(title: 'Add Review'.tr),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Rating",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    color: AppColor.secondBlack,
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ValueListenableBuilder<double>(
                    valueListenable: ratingNotifier,
                    builder: (context, rating, _) {
                      return RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,

                        itemCount: 5,
                        itemSize: 40,
                        unratedColor: Colors.grey.shade300,
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (value) {
                          ratingNotifier.value = value;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Your Review",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    color: AppColor.secondBlack,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormGen(
                  hint: '',
                  lable: 'Your Review',
                  isMessage: true,
                  typekey: TextInputType.text,
                  mycontroller: reviewController,
                ),
                const Spacer(),
                BlocBuilder<AddRatingCubit, AddRatingState>(
                  builder: (context, state) {
                    final isLoading = state is AddRatingSubmitting;
                    return BoxButtom(
                      color: AppColor.mainColor,
                      ontapfun: () {
                        isLoading
                            ? null
                            : () {
                                if (ratingNotifier.value == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please select rating"),
                                    ),
                                  );
                                  return;
                                }

                                context.read<AddRatingCubit>().submitRating(
                                  productId: productId,
                                  rating: ratingNotifier.value,
                                  review: reviewController.text.trim(),
                                );
                              };
                      },
                      text: isLoading ? "Submitting..." : "Submit Review",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
