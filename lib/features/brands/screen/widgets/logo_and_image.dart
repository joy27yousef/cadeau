import 'package:cadeau/core/functions/message.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:cadeau/features/brands/screen/widgets/follow_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoAndImage extends StatelessWidget {
  final String brandId;
  final String url;
  final String backimage;
  final bool isFollow;

  const LogoAndImage({
    super.key,
    required this.brandId,
    required this.url,
    required this.backimage,
    required this.isFollow,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<BrandsBloc, BrandsState>(
      listenWhen: (previous, current) =>
          previous.isFollowActionLoading != current.isFollowActionLoading ||
          previous.followSuccessMessage != current.followSuccessMessage ||
          previous.followActionErrorMessage != current.followActionErrorMessage,
      listener: (context, state) {
        if (state.followSuccessMessage != null &&
            !state.isFollowActionLoading) {
          showMessage(
            context,
            message: state.followSuccessMessage!,
            isSuccess: true,
          );
        }
        if (state.followActionErrorMessage != null &&
            !state.isFollowActionLoading) {
          showMessage(
            context,
            message: state.followSuccessMessage!,
            isSuccess: false,
          );
        }
      },
      child: Column(
        children: [
          SizedBox(
            height: 220,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(backimage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 15,
                  right: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(color: Colors.white, width: 3),
                          image: DecorationImage(
                            image: NetworkImage(url, scale: 0.9),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),

                      BlocBuilder<BrandsBloc, BrandsState>(
                        buildWhen: (previous, current) =>
                            previous.isFollowing != current.isFollowing ||
                            previous.isFollowActionLoading !=
                                current.isFollowActionLoading,
                        builder: (context, state) {
                          return FollowBottom(
                            isLoading: state.isFollowActionLoading,
                            ontapfun: () {
                              context.read<BrandsBloc>().add(
                                ToggleFollowBrandEvent(brandId),
                              );
                            },
                            text: state.isFollowing ? 'Following' : 'Follow',
                            isFollowing: state.isFollowing,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
