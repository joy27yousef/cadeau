import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_bloc.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_event.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

class ProductBottom extends StatelessWidget {
  final String id;
  final BoxButtom box;
  const ProductBottom({super.key, required this.id, required this.box});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(color: AppColor.background),
        child: Row(
          children: [
            BlocBuilder<WishlistBloc, WishlistState>(
              buildWhen: (previous, current) =>
                  current is LoadWishlistSuccess ||
                  current is AddWishlistSuccess ||
                  current is RemoveWishlistSuccess,
              builder: (context, _) {
                final liked =
                    context
                        .watch<WishlistBloc>()
                        .cachedWishlist
                        ?.data
                        ?.wishlistItems
                        .any((e) => e.id == id) ??
                    false;

                return Container(
                  height: 43,
                  width: 43,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: LikeButton(
                      size: 28,
                      isLiked: liked,
                      circleColor: const CircleColor(
                        start: Colors.orange,
                        end: Colors.red,
                      ),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: Colors.orange,
                        dotSecondaryColor: Colors.red,
                      ),
                      onTap: (isLiked) async {
                        context.read<WishlistBloc>().add(
                          isLiked
                              ? RemoveWishlistEvent(id)
                              : AddWishlistEvent(id),
                        );
                        return !isLiked;
                      },
                    ),
                  ),
                );
              },
            ),

            Expanded(child: box),
          ],
        ),
      ),
    );
  }
}
