import 'package:flutter/material.dart';

class LatestCardLoading extends StatelessWidget {
  const LatestCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, i) => Container(
          width: 150,
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
