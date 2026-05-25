import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductPageShimmer extends StatelessWidget {
  const ProductPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const borderRadius = 8.0;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Stack(
        children: [
          ListView(
            children: [
              // Image
              Container(
                width: width,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              const SizedBox(height: 8),

              // Rating bar placeholder
              Container(
                width: 60,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius / 2),
                ),
              ),
              const SizedBox(height: 8),

              // Name + Price Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.6,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(borderRadius / 2),
                    ),
                  ),
                  Container(
                    width: width * 0.2,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(borderRadius / 2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Description
              Container(
                width: width,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              const SizedBox(height: 16),

              // Variants buttons
              Row(
                children: List.generate(
                  2,
                  (_) => Container(
                    width: 70,
                    height: 30,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Features
              Container(
                width: width * 0.3,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius / 2),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: width * 0.5,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius / 2),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),

          // Bottom Button
          Positioned(
            bottom: 0,
            left: 12,
            right: 12,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
