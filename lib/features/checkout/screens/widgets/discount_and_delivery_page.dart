import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DiscountAndDeliveryPage extends StatefulWidget {
  final DateTime? initialDeliveryDate;
  final TextEditingController promoController;

  const DiscountAndDeliveryPage({
    super.key,
    this.initialDeliveryDate,
    required this.promoController,
  });

  @override
  State<DiscountAndDeliveryPage> createState() =>
      _DiscountAndDeliveryPageState();
}

class _DiscountAndDeliveryPageState extends State<DiscountAndDeliveryPage> {
  DateTime? _selectedDeliveryDate;

  void InitState() {
    super.initState();
    _selectedDeliveryDate = widget.initialDeliveryDate;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Text('Discount Code', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormGen(
                hint: "Enter the code",
                lable: 'Enter the code',
                typekey: TextInputType.text,
                mycontroller:
                    widget.promoController, // الوصول للمتحكم عبر widget.
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: BoxButtom(
                color: AppColor.mainColor,
                ontapfun: () {},
                text: 'Apply',
              ),
            ),
          ],
        ),

        const SizedBox(height: 40),
        Text('Delivery time', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),

        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDeliveryDate ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 30)),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: AppColor.mainColor,
                      onPrimary: Colors.white,
                      onSurface: Colors.black87,
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (pickedDate != null) {
              // الآن setState تعمل بشكل صحيح لأننا داخل StatefulWidget
              setState(() {
                _selectedDeliveryDate = pickedDate;
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _selectedDeliveryDate != null
                    ? AppColor.mainColor
                    : Colors.grey.shade300,
                width: _selectedDeliveryDate != null ? 1.5 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade50,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Iconsax.calendar_1,
                      color: _selectedDeliveryDate != null
                          ? AppColor.mainColor
                          : Colors.grey.shade600,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      _selectedDeliveryDate == null
                          ? 'Select delivery date'
                          : '${_selectedDeliveryDate!.year} - ${_selectedDeliveryDate!.month.toString().padLeft(2, '0')} - ${_selectedDeliveryDate!.day.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: _selectedDeliveryDate != null
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: _selectedDeliveryDate != null
                            ? AppColor.mainColor
                            : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Iconsax.arrow_right_3,
                  size: 18,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}
