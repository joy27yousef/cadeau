import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FriendInformationPart extends StatelessWidget {
  const FriendInformationPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColor.mainColor.withOpacity(0.1),
            child: Icon(Iconsax.user, size: 50, color: AppColor.mainColor),
          ),
          const SizedBox(height: 16),
          Text(
            'Joy Yousef',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 6),
          Text(
            'Born on 27 october 🎂',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            softWrap: true,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            'bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildStatColumn(context, 'Wishlist Items', '6'),
              Container(
                width: 1,
                height: 30,
                color: Colors.grey.shade300,
                margin: const EdgeInsets.symmetric(horizontal: 30),
              ),
              buildStatColumn(context, 'Brands Followed', '8'),
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildStatColumn(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 22,
            color: AppColor.mainColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 15,
            color: AppColor.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
