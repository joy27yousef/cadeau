import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cadeau/core/constant/app_color.dart';

void showFilters({
  required BuildContext context,
  required List<Map<String, String>> categories,
  required List<Map<String, String>> occasions,
  required List<Map<String, String>> brands,
  required Function({
    String? categoryId,
    String? occasionId,
    String? brandId,
    double? minPrice,
    double? maxPrice,
    String? color,
    String? size,
    String? storage,
  })
  onApply,
}) {
  Map<String, String>? selectedCategory;
  Map<String, String>? selectedOccasion;
  Map<String, String>? selectedBrand;
  double? minPrice;
  double? maxPrice;
  String? color;
  String? size;
  String? storage;

  // Example options, يمكن تعديلها حسب المشروع
  List<String> colors = ['Red', 'Blue', 'Green', 'Yellow'];
  List<String> sizes = ['S', 'M', 'L', 'XL'];
  List<String> storages = ['32GB', '64GB', '128GB', '256GB'];

  Get.bottomSheet(
    StatefulBuilder(
      builder: (context, setState) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                Text(
                  'Filter Products',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColor.secondBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),

                // Category Dropdown
                DropdownButtonFormField<Map<String, String>>(
                  value: selectedCategory,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: categories
                      .map(
                        (c) => DropdownMenuItem(
                          value: c,
                          child: Text(c['name'] ?? ''),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      setState(() => selectedCategory = value),
                ),
                const SizedBox(height: 15),

                // Occasion Dropdown
                DropdownButtonFormField<Map<String, String>>(
                  value: selectedOccasion,
                  decoration: const InputDecoration(labelText: 'Occasion'),
                  items: occasions
                      .map(
                        (o) => DropdownMenuItem(
                          value: o,
                          child: Text(o['name'] ?? ''),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      setState(() => selectedOccasion = value),
                ),
                const SizedBox(height: 15),

                // Brand Dropdown
                DropdownButtonFormField<Map<String, String>>(
                  value: selectedBrand,
                  decoration: const InputDecoration(labelText: 'Brand'),
                  items: brands
                      .map(
                        (b) => DropdownMenuItem(
                          value: b,
                          child: Text(b['name'] ?? ''),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(() => selectedBrand = value),
                ),
                const SizedBox(height: 15),

                // Price Range
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Min Price',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => minPrice = double.tryParse(val),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Max Price',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => maxPrice = double.tryParse(val),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Color Selection
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Color',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Wrap(
                  spacing: 10,
                  children: colors.map((c) {
                    bool isSelected = color == c;
                    return ChoiceChip(
                      label: Text(c),
                      selected: isSelected,
                      onSelected: (_) => setState(() => color = c),
                      selectedColor: AppColor.mainColor,
                      backgroundColor: Colors.grey.shade200,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),

                // Size Selection
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Size',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Wrap(
                  spacing: 10,
                  children: sizes.map((s) {
                    bool isSelected = size == s;
                    return ChoiceChip(
                      label: Text(s),
                      selected: isSelected,
                      onSelected: (_) => setState(() => size = s),
                      selectedColor: AppColor.mainColor,
                      backgroundColor: Colors.grey.shade200,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),

                // Storage Selection
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Storage',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Wrap(
                  spacing: 10,
                  children: storages.map((s) {
                    bool isSelected = storage == s;
                    return ChoiceChip(
                      label: Text(s),
                      selected: isSelected,
                      onSelected: (_) => setState(() => storage = s),
                      selectedColor: AppColor.mainColor,
                      backgroundColor: Colors.grey.shade200,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),

                // Buttons Row
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedCategory = null;
                            selectedOccasion = null;
                            selectedBrand = null;
                            minPrice = null;
                            maxPrice = null;
                            color = null;
                            size = null;
                            storage = null;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColor.mainColor),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Clear Filters'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          onApply(
                            categoryId: selectedCategory?['id'],
                            occasionId: selectedOccasion?['id'],
                            brandId: selectedBrand?['id'],
                            minPrice: minPrice,
                            maxPrice: maxPrice,
                            color: color,
                            size: size,
                            storage: storage,
                          );
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.mainColor,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Apply Filters'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    barrierColor: Colors.black.withOpacity(0.4),
    elevation: 10,
    enterBottomSheetDuration: const Duration(milliseconds: 400),
    exitBottomSheetDuration: const Duration(milliseconds: 250),
  );
}
