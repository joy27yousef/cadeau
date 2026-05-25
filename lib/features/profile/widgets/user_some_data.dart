import 'package:flutter/material.dart';

class UserSomeData extends StatelessWidget {
  const UserSomeData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildStatColumn('Friends', '16', () {
              // الانتقال لقائمة الأصدقاء المشتركين
            }),
            Container(
              width: 1,
              height: 25,
              color: Colors.grey.shade300,
              margin: const EdgeInsets.symmetric(horizontal: 35),
            ),
            buildStatColumn('Wishlist', '8', () {
              // التمرير لأسفل أو فتح صفحة الـ Wishlist
            }),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget buildStatColumn(String label, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
