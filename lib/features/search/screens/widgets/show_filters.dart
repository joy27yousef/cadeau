import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cadeau/features/search/logic/bloc/search_bloc.dart';
import 'package:cadeau/features/search/logic/bloc/search_event.dart';
import 'package:cadeau/core/constant/app_color.dart';
import 'package:get/get_utils/get_utils.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<Map<String, dynamic>> colorsList = [
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Blue', 'color': Colors.blue},
    {'name': 'Green', 'color': Colors.green},
    {'name': 'Yellow', 'color': Colors.yellow},
    {'name': 'Purple', 'color': Colors.purple},
    {'name': 'Orange', 'color': Colors.orange},
    {'name': 'Black', 'color': Colors.black},
  ];
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController storageController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  String? selectedCategoryId;
  String? selectedColor;

  @override
  void dispose() {
    minPriceController.dispose();
    maxPriceController.dispose();
    storageController.dispose();
    sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 45,
                height: 5,
                margin: const EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            Text(
              "Filter Options".tr,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 25),

            _buildFilterTitle("Price Range".tr),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    "Min".tr,
                    minPriceController,
                    TextInputType.number,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildTextField(
                    "Max".tr,
                    maxPriceController,
                    TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildFilterTitle("Specifications".tr),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    "Storage (GB)".tr,
                    storageController,
                    TextInputType.text,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildTextField(
                    "Size",
                    sizeController,
                    TextInputType.text,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            _buildFilterTitle("Color".tr),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 8,
              children: colorsList.map((colorMap) {
                final colorName = colorMap['name'] as String;
                final colorValue = colorMap['color'] as Color;
                final isSelected = selectedColor == colorName;

                return GestureDetector(
                  onTap: () => setState(
                    () => selectedColor = isSelected ? null : colorName,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 200,
                    ), // تأثير حركي عند الاختيار
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: colorValue,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? Colors.grey.shade100
                            : Colors.transparent,
                        width: 2,
                      ),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: colorValue.withOpacity(0.4),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                      ],
                    ),
                    // إضافة علامة "صح" صغيرة عند الاختيار
                    child: isSelected
                        ? Center(
                            child: Icon(
                              Icons.check,
                              color: colorValue.computeLuminance() > 0.5
                                  ? Colors.black
                                  : Colors.white,
                              size: 20,
                            ),
                          )
                        : null,
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 40),

            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      minPriceController.clear();
                      maxPriceController.clear();
                      storageController.clear();
                      sizeController.clear();
                      setState(() => selectedColor = null);
                      context.read<SearchBloc>().add(ResetFilters());
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Reset".tr,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.mainColor,
                      elevation: 0,

                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      context.read<SearchBloc>().add(
                        FilterProducts(
                          minPrice: minPriceController.text.isNotEmpty
                              ? minPriceController.text
                              : null,
                          maxPrice: maxPriceController.text.isNotEmpty
                              ? maxPriceController.text
                              : null,
                          storage: storageController.text.isNotEmpty
                              ? storageController.text
                              : null,
                          size: sizeController.text.isNotEmpty
                              ? sizeController.text
                              : null,
                          color: selectedColor,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Apply Filters".tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    TextInputType type,
  ) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 14,
          color: AppColor.secondBlack,
          fontWeight: FontWeight.normal,
        ),
        filled: true,
        hoverColor: AppColor.mainColor,

        fillColor: Colors.grey[50],
        focusColor: AppColor.mainColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.lightScondary, width: 1),
        ),
      ),
    );
  }

  Widget _buildFilterTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 15,
          color: AppColor.secondBlack,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
