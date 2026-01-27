import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/product/logic/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductVariants extends StatelessWidget {
  const ProductVariants({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is! ProductByIdSuccess) return const SizedBox();

        final attributes = context.read<ProductBloc>().extractAttributes(
          state.product.data.variants,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: attributes.entries.map((attr) {
            final key = attr.key;
            final values = attr.value.toList()..sort();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$key :',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColor.secondBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: values.map((value) {
                    final selected = state.selectedAttributes[key] == value;

                    return InkWell(
                      onTap: () {
                        context.read<ProductBloc>().add(
                          SelectAttribute(key, value),
                        );
                      },
                      borderRadius: BorderRadius.circular(6),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? AppColor.mainColor
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          value,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: selected
                                    ? Colors.white
                                    : AppColor.secondBlack,
                              ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
