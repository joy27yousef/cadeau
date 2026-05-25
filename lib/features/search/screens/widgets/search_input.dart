import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/features/search/logic/bloc/search_bloc.dart';
import 'package:cadeau/features/search/logic/bloc/search_event.dart';
import 'package:cadeau/features/search/screens/widgets/show_filters.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => SearchInputState();
}

class SearchInputState extends State<SearchInput> {
  Timer? debounce;

  void onSearchChanged(String value) {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer(const Duration(milliseconds: 600), () {
      context.read<SearchBloc>().add(FilterProducts(name: value));
    });
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              const SizedBox(width: 15),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Find your gift'.tr,
                    hintStyle: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: onSearchChanged,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onTap: () {
                    final searchBloc = context.read<SearchBloc>();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => BlocProvider.value(
                        value: searchBloc,
                        child: const FilterBottomSheet(),
                      ),
                    );
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.filter,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
