import 'package:cadeau/features/wishlist/logic/bloc/wishlist_bloc.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_event.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

class Love extends StatelessWidget {
  final String id;
  const Love({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
        ),
        child: Center(
          child: BlocBuilder<WishlistBloc, WishlistState>(
            buildWhen: (previous, current) =>
                current is LoadWishlistSuccess ||
                current is AddWishlistSuccess ||
                current is RemoveWishlistSuccess,
            builder: (context, state) {
              final liked =
                  context
                      .watch<WishlistBloc>()
                      .cachedWishlist
                      ?.data
                      ?.wishlistItems
                      .any((e) => e.id == id) ??
                  false;

              return LikeButton(
                size: 25,
                isLiked: liked,
                onTap: (isLiked) async {
                  context.read<WishlistBloc>().add(
                    isLiked ? RemoveWishlistEvent(id) : AddWishlistEvent(id),
                  );
                  return !isLiked;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
