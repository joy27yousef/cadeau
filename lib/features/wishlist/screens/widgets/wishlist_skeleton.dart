import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WishlistSkeleton extends StatelessWidget {
  const WishlistSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            period: const Duration(milliseconds: 1200),
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // صورة وهمية
                  Container(
                    height: 110,
                    width: 110,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // نص وهمي + زر قلب
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // عنوان وهمي + مساحة للـ Love Button
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 20,
                                color: Colors.grey.shade300,
                                margin: const EdgeInsets.only(bottom: 6),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),

                        // وصف وهمي
                        Container(
                          height: 14,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 6),
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          height: 14,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 6),
                          color: Colors.grey.shade300,
                        ),

                        const Spacer(),

                        Container(
                          height: 16,
                          width: 60,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
