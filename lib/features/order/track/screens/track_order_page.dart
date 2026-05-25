import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/features/order/track/logic/bloc/track_order_bloc.dart';
import 'package:cadeau/features/order/track/logic/bloc/track_order_event.dart';
import 'package:cadeau/features/order/track/logic/bloc/track_order_state.dart';
import 'package:cadeau/features/order/track/screens/order_dit.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/features/wishlist/screens/widgets/wishlist_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColor.mainColor,
      backgroundColor: AppColor.background,
      onRefresh: () async {
        context.read<TrackOrderBloc>().add(LoadTrackOrder());
        await Future.delayed(Duration(seconds: 2));
      },
      child: Scaffold(
        appBar: AppbarMainScreens(),
        body: BlocBuilder<TrackOrderBloc, TrackOrderState>(
          builder: (context, state) {
            if (state is TrackOrderLoading) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: const Center(child: WishlistSkeleton()),
              );
            }

            if (state is TrackOrderSuccess) {
              final orders = state.order.data ?? [];
              if (orders.isNotEmpty) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    final isExpanded = expandedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          expandedIndex = isExpanded ? null : index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.only(bottom: 25),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isExpanded
                              ? AppColor.background
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// HEADER
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order #${order.orderNumber}'.tr,
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(
                                        color: AppColor.secondBlack,
                                        fontSize: 16,
                                      ),
                                ),
                                Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.lightScondary,
                              ),
                              child: Center(
                                child: Text(
                                  order.orderStatus ?? '',
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(
                                        color: AppColor.background,
                                        fontSize: 16,
                                      ),
                                ),
                              ),
                            ),

                            /// DETAILS
                            AnimatedCrossFade(
                              firstChild: const SizedBox(),
                              secondChild: Column(
                                children: [
                                  const SizedBox(height: 15),

                                  OrderDit(
                                    title: 'Receiver Name'.tr,
                                    text: order.shippingName ?? '',
                                    icon: Iconsax.profile_tick,
                                  ),

                                  OrderDit(
                                    title: 'Address'.tr,
                                    text: order.shippingAddress ?? '',
                                    icon: Iconsax.location,
                                  ),

                                  OrderDit(
                                    title: 'Date'.tr,
                                    text: order.date ?? '',
                                    icon: Iconsax.calendar_1,
                                  ),

                                  OrderDit(
                                    title: 'Total price'.tr,
                                    text: "${order.total}\$",
                                    icon: Iconsax.money,
                                  ),
                                  OrderDit(
                                    title: 'Items :'.tr,
                                    text: '',
                                    icon: Iconsax.box,
                                  ),
                                  SizedBox(height: 5),

                                  ...order.orderItems!.map((item) {
                                    return Container(
                                      height: 30,
                                      margin: EdgeInsets.only(left: 0),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "- ${item.name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontSize: 14,
                                                  color: AppColor.secondBlack,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Text(
                                            'Qty: ${item.quantity}'.tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontSize: 14,
                                                  color: AppColor.secondBlack,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                              crossFadeState: isExpanded
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 300),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Empty(
                text1: 'There are currently no orders'.tr,
                text2: "Shop and order your own gift".tr,
              );
            }

            if (state is TrackOrderError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
