import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';

class GiftPackagingPage extends StatefulWidget {
  final int initialSelectedPackaging;
  final bool initialAddGreetingCard;
  final TextEditingController messageController;

  const GiftPackagingPage({
    super.key,
    required this.initialSelectedPackaging,
    required this.initialAddGreetingCard,
    required this.messageController,
  });

  @override
  State<GiftPackagingPage> createState() => _GiftPackagingPageState();
}

class _GiftPackagingPageState extends State<GiftPackagingPage> {
  late int selectedPackaging;
  late bool addGreetingCard;

  final List<Map<String, String>> premiumPackages = [
    {'title': 'Birthday Package', 'price': '+\$3.00'},
    {'title': 'Wedding Package', 'price': '+\$5.00'},
    {'title': 'Classic Wrap', 'price': '+\$2.50'},
    {'title': 'Luxury Box', 'price': '+\$7.00'},
    {'title': 'Anniversary Wrap', 'price': '+\$4.00'},
  ];

  @override
  void initState() {
    super.initState();
    selectedPackaging = widget.initialSelectedPackaging;
    addGreetingCard = widget.initialAddGreetingCard;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Text('Gift Packaging', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(
          'Choose how your gift arrives.',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 30),

        _buildStandardOption(
          index: 0,
          title: 'No Packaging',
          subtitle: 'Standard delivery box',
          price: 'Free',
        ),

        const SizedBox(height: 25),

        Text(
          'Premium Packaging Options',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 12),

        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: premiumPackages.length,
            itemBuilder: (context, i) {
              int packageId = i + 1;
              bool isSelected = selectedPackaging == packageId;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPackaging = packageId;
                  });
                },
                child: Container(
                  width: 260,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                    border: Border.all(
                      color: isSelected
                          ? AppColor.mainColor
                          : Colors.grey.shade200,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(AppImages.ads2),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            premiumPackages[i]['title']!,
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            premiumPackages[i]['price']!,
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontSize: 15,
                                  color: AppColor.mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 32),

        // Greeting Card Toggle Card
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Column(
            children: [
              SwitchListTile(
                inactiveThumbColor: Colors.grey.shade500,
                inactiveTrackColor: Colors.grey.shade200,
                activeColor: AppColor.mainColor,
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Include a Greeting Card',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(fontSize: 16),
                  ),
                ),
                subtitle: Text(
                  'Add a personalized handwritten note',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                value: addGreetingCard,
                onChanged: (bool value) {
                  setState(() {
                    addGreetingCard = value;
                  });
                },
              ),
              if (addGreetingCard)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormGen(
                    hint: 'Write your warm wishes here...',
                    lable: 'Write your warm wishes here...',
                    typekey: TextInputType.text,
                    isMessage: true,
                    mycontroller: widget.messageController,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // ويدجيت مخصصة لبناء خيار "بدون تغليف" أو أي خيار قائمة عمودية قياسية
  Widget _buildStandardOption({
    required int index,
    required String title,
    required String subtitle,
    required String price,
  }) {
    bool isSelected = selectedPackaging == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPackaging = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColor.mainColor : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? AppColor.mainColor : Colors.grey,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColor.mainColor : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
