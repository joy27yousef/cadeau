import 'package:cadeau/features/social_section/screens/widgets/friend_brand.dart';
import 'package:cadeau/features/social_section/screens/widgets/friend_information_part.dart';
import 'package:cadeau/features/social_section/screens/widgets/friend_wishlist_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class FriendProfilePage extends StatelessWidget {
  const FriendProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left_2),
          onPressed: () => Get.back(),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Iconsax.more),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onSelected: (value) {
              if (value == 'unfriend') {
                _showUnfriendDialog(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'unfriend',
                child: Row(
                  children: const [
                    Icon(
                      Iconsax.user_remove,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Unfriend',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FriendInformationPart(),
            FriendBrand(),
            FriendWishlistPart(),
          ],
        ),
      ),
    );
  }

  // نافذة تأكيد إلغاء الصداقة (Confirmation Dialog)
  void _showUnfriendDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Unfriend Ahmad?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: const Text(
            'Are you sure you want to remove Ahmad from your friends list? You won\'t be able to view their wishlist updates.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // تنفيذ منطق إلغاء الصداقة من قاعدة البيانات هنا
                Navigator.pop(context); // إغلاق الدايلوج
                Navigator.pop(context); // العودة للصفحة السابقة بعد الإلغاء

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Friend removed successfully')),
                );
              },
              child: const Text(
                'Remove',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
