import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class ProductAllCard extends StatelessWidget {
  final List items;
  final void Function(dynamic item)? onTap;
  final void Function(dynamic item)? onWishlistTap;
  final String Function(dynamic item)? getImage;
  final String Function(dynamic item)? getTitle;
  final String Function(dynamic item)? getPrice;

  const ProductAllCard({
    super.key,
    required this.items,
    this.getImage,
    this.getTitle,
    this.onTap,
    this.getPrice,
    this.onWishlistTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 17,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, i) {
        final item = items[i];
        final imagePath = getImage != null ? getImage!(item) : item.toString();
        final title = getTitle != null ? getTitle!(item) : item.toString();
        final price = getPrice != null ? getPrice!(item) : item.toString();

        return InkWell(
          onTap: () => onTap?.call(item),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.background,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade100, blurRadius: 15),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: imagePath.isNotEmpty
                                ? NetworkImage(imagePath)
                                : const AssetImage(AppImages.empty)
                                      as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //  Wishlist
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () => onWishlistTap?.call(item),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: AppColor.darkGray,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$price \$',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColor.black,
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
