import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchForFriendsPart extends StatelessWidget {
  const SearchForFriendsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Find Friends',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 15),
        Container(
          height: 55,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: BoxBorder.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Icon(Iconsax.search_status, color: Colors.grey),
              SizedBox(width: 10),
              Text(
                'Search by username or phone...',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        // TextField(
        //   decoration: InputDecoration(
        //     hintText: ,
        //     prefixIcon: const
        //     filled: true,
        //     fillColor: Colors.white,
        //     contentPadding: const EdgeInsets.symmetric(vertical: 16),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(16),
        //       borderSide: BorderSide.none,
        //     ),
        //     enabledBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(16),
        //       borderSide: BorderSide(color: Colors.grey.shade200),
        //     ),
        //   ),
        // ),
        SizedBox(height: 30),
      ],
    );
  }
}
