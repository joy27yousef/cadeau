import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CategoriesAllpage extends StatelessWidget {
  final List items;
  final void Function(dynamic item)? onTap;
  final String Function(dynamic item)? getImage;
  final String Function(dynamic item)? getTitle;

  const CategoriesAllpage({
    super.key,
    required this.items,
    this.getImage,
    this.getTitle,
    this.onTap,
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
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, i) {
        final item = items[i];
        final imagePath = getImage != null ? getImage!(item) : item.toString();
        final title = getTitle != null ? getTitle!(item) : item.toString();

        return InkWell(
          onTap: () {
            if (onTap != null) onTap!(item);
          },
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: NetworkImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColor.secondBlack,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
