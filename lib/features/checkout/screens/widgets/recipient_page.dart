import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RecipientPage extends StatefulWidget {
  final int initialSelectedRecipient;
  final String initialSelectedFriendId; // يستقبل الـ id المختار كـ String
  final ValueChanged<String> onFriendChanged;
  final ValueChanged<int> onRecipientChanged;

  const RecipientPage({
    super.key,
    required this.initialSelectedRecipient,
    required this.initialSelectedFriendId,
    required this.onFriendChanged,
    required this.onRecipientChanged,
  });

  @override
  State<RecipientPage> createState() => _RecipientPageState();
}

class _RecipientPageState extends State<RecipientPage> {
  late int selectedRecipient;
  late String selectedFriendId; // يحفظ الـ id داخلياً

  // 🛠️ قائمة الأصدقاء مع الـ id والـ name الخاص بكل منهم للحفاظ على التصميم والبيانات معاً
  final List<Map<String, String>> friendsList = [
    {'id': 'id_farah', 'name': 'farah'},
    {'id': 'id_sara', 'name': 'Sara '},
    {'id': 'id_majd', 'name': 'Majd '},
  ];

  @override
  void initState() {
    super.initState();
    selectedRecipient = widget.initialSelectedRecipient;
    selectedFriendId = widget.initialSelectedFriendId;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Text(
          'The recipient person',
          style:
              Theme.of(context).textTheme.titleLarge ??
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        // Recipient Custom Segmented Tabs
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              _buildSegmentTab(0, 'Myself'),
              _buildSegmentTab(1, 'Friend'),
              _buildSegmentTab(2, 'Someone Else'),
            ],
          ),
        ),
        const SizedBox(height: 20),

        if (selectedRecipient == 0)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Iconsax.profile_circle, color: AppColor.mainColor),
                    const SizedBox(width: 10),
                    Text(
                      'Joy yousef',
                      style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Iconsax.mobile, color: AppColor.mainColor),
                    const SizedBox(width: 10),
                    Text(
                      '09471055060',
                      style: TextStyle(color: AppColor.darkGray, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Iconsax.location, color: AppColor.mainColor),
                    const SizedBox(width: 10),
                    Text(
                      'Lattakia',
                      style: TextStyle(color: AppColor.darkGray, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          )
        else if (selectedRecipient == 1)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Platform Friend',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),

              ...friendsList.map((Map<String, String> friend) {
                String friendId = friend['id']!;
                String friendName = friend['name']!;

                // المقارنة تتم الآن بناءً على الـ ID الفريد (String)
                bool isSelected = selectedFriendId == friendId;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFriendId = friendId; // حفظ الـ id عند الضغط
                    });
                    widget.onFriendChanged(
                      friendId,
                    ); // تمرير الـ id للشاشة الأب
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade50.withOpacity(0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                        color: isSelected
                            ? AppColor.mainColor
                            : Colors.grey.shade100,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: isSelected
                              ? AppColor.mainColor.withOpacity(0.1)
                              : Colors.grey.shade100,
                          child: Icon(
                            Iconsax.profile_circle,
                            color: isSelected
                                ? AppColor.mainColor
                                : Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                friendName, // الاسم يظهر في الواجهة كما هو تماماً
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected
                                      ? AppColor.mainColor
                                      : Colors.grey.shade700,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Tap to select as recipient',
                                style: TextStyle(
                                  color: AppColor.greyLight,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: isSelected
                              ? AppColor.mainColor
                              : Colors.grey.shade400,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          )
        else
          Column(
            children: [
              TextFormGen(
                hint: 'Full Name',
                lable: 'Full Name',
                typekey: TextInputType.text,
                iconform: Icon(
                  Iconsax.profile_circle,
                  color: AppColor.mainColor,
                ),
              ),
              const SizedBox(height: 15),
              TextFormGen(
                hint: 'Phone Number',
                lable: 'Phone Number',
                typekey: TextInputType.phone,
                iconform: Icon(Iconsax.mobile, color: AppColor.mainColor),
              ),
              const SizedBox(height: 15),
              TextFormGen(
                hint: 'Address',
                lable: 'Address',
                typekey: TextInputType.text,
                iconform: Icon(Iconsax.location, color: AppColor.mainColor),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Icon(Iconsax.location, color: AppColor.mainColor),
                  const SizedBox(width: 8),
                  Text(
                    'Set Location in Map',
                    style: TextStyle(color: AppColor.darkGray, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildSegmentTab(int index, String label) {
    bool isSelected = selectedRecipient == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRecipient = index;
          });
          widget.onRecipientChanged(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColor.mainColor : Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
