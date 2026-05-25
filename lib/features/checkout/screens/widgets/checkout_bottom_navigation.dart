import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:flutter/material.dart';

class CheckoutBottomNavigation extends StatelessWidget {
  final bool isLastPage;
  final int currentPage;
  final PageController pageController;
  const CheckoutBottomNavigation({
    super.key,
    required this.isLastPage,
    required this.currentPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 15,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (currentPage > 0)
            Expanded(
              child: InkWell(
                onTap: () {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade300, width: 0.5),
                  ),
                  child: Center(
                    child: Text(
                      'Back',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColor.mainColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (currentPage > 0) const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: BoxButtom(
              color: AppColor.mainColor,
              ontapfun: () {
                if (isLastPage) {
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              text: isLastPage ? 'Proceed to Payment' : 'Next Step',
            ),
          ),
        ],
      ),
    );
  }
}
