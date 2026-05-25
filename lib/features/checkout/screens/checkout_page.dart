import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/features/checkout/screens/widgets/checkout_bottom_navigation.dart';
import 'package:cadeau/features/checkout/screens/widgets/checkout_points.dart';
import 'package:cadeau/features/checkout/screens/widgets/discount_and_delivery_page.dart';
import 'package:cadeau/features/checkout/screens/widgets/gift_packaging_page.dart';
import 'package:cadeau/features/checkout/screens/widgets/recipient_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final PageController pageController = PageController();
  int currentPage = 0;

  int selectedPackaging = 0; // 0: No Packaging, 1: Premium, 2: Luxury
  bool addGreetingCard = false;
  final TextEditingController messageController = TextEditingController();

  // States for Page 2
  int selectedRecipient = 0; // 0: Myself, 1: Friend, 2: Someone Else
  String selectedFriend = 'id_farah';
  // States for Page 3
  final TextEditingController promoController = TextEditingController();
  DateTime? selectedDeliveryDate;

  @override
  void dispose() {
    pageController.dispose();
    messageController.dispose();
    promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Checkout'.tr),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                children: [
                  GiftPackagingPage(
                    messageController: messageController,
                    initialSelectedPackaging: selectedPackaging,
                    initialAddGreetingCard: addGreetingCard,
                  ),
                  RecipientPage(
                    initialSelectedRecipient: selectedRecipient,
                    initialSelectedFriendId: selectedFriend,
                    onFriendChanged: (String newFriendId) {
                      setState(() {
                        selectedFriend = newFriendId;
                      });
                    },
                    onRecipientChanged: (int newRecipient) {
                      setState(() {
                        selectedRecipient = newRecipient;
                      });
                    },
                  ),
                  DiscountAndDeliveryPage(
                    promoController: promoController,
                    initialDeliveryDate: selectedDeliveryDate,
                  ),
                ],
              ),
            ),
            CheckoutPoints(currentPage: currentPage),
            CheckoutBottomNavigation(
              isLastPage: currentPage == 2,
              currentPage: currentPage,
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }
}
