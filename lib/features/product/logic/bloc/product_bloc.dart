import 'package:cadeau/features/product/data/models/all_product_model.dart';
import 'package:cadeau/features/product/data/models/product_by_id_model.dart';
import 'package:cadeau/features/product/data/repository/product_repo.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/product/logic/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo repo;

  ProductBloc({required this.repo}) : super(ProductInitial()) {
    on<LoadAllProduct>(loadAllProduct);
    on<LoadProductById>(loadProductById);
    on<SelectAttribute>(onSelectAttribute);
  }

  Future<void> loadAllProduct(
    LoadAllProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());

    final products = await repo.getAllProducts();

    products.fold(
      (error) {
        emit(ProductError(error.message));
      },
      (model) {
        final sortedProducts = List<ProductData>.from(model.data)
          ..sort((a, b) => b.productRating.compareTo(a.productRating));

        final sortedModel = AllProductModel(
          status: model.status,
          data: sortedProducts,
          message: model.message,
          code: model.code,
        );

        emit(ProductSuccess(sortedModel));
      },
    );
  }

  Future<void> loadProductById(
    LoadProductById event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());

    final product = await repo.getProductById(event.productId);

    product.fold(
      (error) {
        emit(ProductError(error.message));
      },
      (model) {
        emit(
          ProductByIdSuccess(
            product: model,
            selectedAttributes: {},
            selectedVariant: null,
          ),
        );
      },
    );
  }

  void onSelectAttribute(SelectAttribute event, Emitter<ProductState> emit) {
    final current = state;
    if (current is ProductByIdSuccess) {
      final updated = Map<String, String>.from(current.selectedAttributes);
      updated[event.key] = event.value;

      final matchedVariant = findMatchingVariant(
        current.product.data.variants,
        updated,
      );

      emit(
        current.copyWith(
          selectedAttributes: updated,
          selectedVariant: matchedVariant,
        ),
      );
    }
  }

  // 1. تابع استخراج الفلاتر (متوافق مع تغير اللغة)
  Map<String, Set<String>> extractFilters(
    List<ProductVariant> variants, {
    bool isArabic = false,
  }) {
    final Map<String, Set<String>> filters = {};

    for (final variant in variants) {
      // نحدد أي خريطة نستخدم بناءً على لغة واجهة التطبيق
      final targetAttributes = isArabic
          ? variant.attributesAr
          : variant.attributesEn;

      targetAttributes.forEach((key, value) {
        if (value != null) {
          filters.putIfAbsent(key, () => <String>{});
          filters[key]!.add(value.toString());
        }
      });
    }

    return filters;
  }

  // 2. تابع استخراج الخصائص (هو نفسه السابق ولكن ليتوافق مع استدعاء الـ UI الخاص بك)
  Map<String, Set<String>> extractAttributes(
    List<ProductVariant> variants, {
    bool isArabic = false,
  }) {
    return extractFilters(variants, isArabic: isArabic);
  }

  // 3. تابع البحث عن الـ Variant المطابق (يبحث في اللغتين ليكون آمناً تماماً)
  ProductVariant? findMatchingVariant(
    List<ProductVariant> variants,
    Map<String, String> selectedAttributes,
  ) {
    for (final variant in variants) {
      bool match = true;
      for (final entry in selectedAttributes.entries) {
        final valueInEn = variant.attributesEn[entry.key]?.toString();
        final valueInAr = variant.attributesAr[entry.key]?.toString();

        // إذا كانت القيمة المحددة لا تطابق الإنكليزية ولا العربية إذن ليس هذا الـ variant
        if (valueInEn != entry.value && valueInAr != entry.value) {
          match = false;
          break;
        }
      }
      if (match) return variant;
    }
    return null;
  }
}
