import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/apis/dio_consumer.dart';
import 'package:cadeau/features/auth/forgotPassword/data/repository/reset_pass_repo.dart';
import 'package:cadeau/features/auth/forgotPassword/logic/bloc/reset_password_bloc.dart';
import 'package:cadeau/features/auth/login/data/repository/login_repo.dart';
import 'package:cadeau/features/auth/login/logic/bloc/login_bloc.dart';
import 'package:cadeau/features/auth/signUp/data/repository/register_repo.dart';
import 'package:cadeau/features/auth/signUp/logic/bloc/register_bloc.dart';
import 'package:cadeau/features/auth/verificationAccount/data/repository/verification_account_repo.dart';
import 'package:cadeau/features/auth/verificationAccount/logic/bloc/verification_account_bloc.dart';
import 'package:cadeau/features/cart/data/repository/cart_repo.dart';
import 'package:cadeau/features/cart/logic/bloc/cart_bloc.dart';
import 'package:cadeau/features/categories/data/repository/categories_repo.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_bloc.dart';
import 'package:cadeau/features/latest_product/data/repository/latest_product_repo.dart';
import 'package:cadeau/features/latest_product/logic/bloc/Latest_product_bloc.dart';
import 'package:cadeau/features/occasions/data/repository/occasion_repo.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_bloc.dart';
import 'package:cadeau/features/only_for_you/data/repository/only_for_you_repo.dart';
import 'package:cadeau/features/only_for_you/logic/bloc/only_for_you_bloc.dart';
import 'package:cadeau/features/order/track/data/repository/track_order_repo.dart';
import 'package:cadeau/features/order/track/logic/bloc/track_order_bloc.dart';
import 'package:cadeau/features/product/data/repository/product_repo.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/cubit/add_rating_cubit.dart';
import 'package:cadeau/features/profile/reports%20&%20help/data/repository/report_repo.dart';
import 'package:cadeau/features/profile/reports%20&%20help/logic/bloc/report_bloc.dart';
import 'package:cadeau/features/profile/settings/delete_account/data/repository/delete_account_repo.dart';
import 'package:cadeau/features/profile/settings/delete_account/logic/bloc/delete_account_bloc.dart';
import 'package:cadeau/features/search/data/repository/searchProduct_repo.dart';
import 'package:cadeau/features/search/logic/bloc/search_bloc.dart';
import 'package:cadeau/features/special_occasions/logic/bloc/special_occasions_bloc.dart';
import 'package:cadeau/features/wishlist/data/repository/wishlist_repo.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:cadeau/features/brands/data/repository/brands_repo.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // =====================
  // Core
  // =====================
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  // =====================
  // Repositories
  // =====================
  sl.registerLazySingleton<ResetPassRepo>(
    () => ResetPassRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<VerificationAccountRepo>(
    () => VerificationAccountRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<ReportRepo>(
    () => ReportRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<DeleteAccountRepo>(
    () => DeleteAccountRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<SearchproductRepo>(
    () => SearchproductRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<WishlistRepo>(
    () => WishlistRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<BrandsRepo>(
    () => BrandsRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<OnlyForYouRepo>(
    () => OnlyForYouRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<OccasionRepo>(
    () => OccasionRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<CartRepo>(
    () => CartRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<WishlistRepo>(
    () => WishlistRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<TrackOrderRepo>(
    () => TrackOrderRepo(api: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<LatestProductRepo>(
    () => LatestProductRepo(api: sl(), networkInfo: sl()),
  );

  // =====================
  // Blocs
  // =====================
  sl.registerFactory<WishlistBloc>(() => WishlistBloc(repo: sl()));
  sl.registerFactory<DeleteAccountBloc>(() => DeleteAccountBloc(sl()));
  sl.registerFactory<SearchBloc>(() => SearchBloc(repo: sl()));
  sl.registerFactory<ReportBloc>(() => ReportBloc(sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));
  sl.registerFactory<ResetPasswordBloc>(() => ResetPasswordBloc(sl()));
  sl.registerFactory<VerificationAccountBloc>(
    () => VerificationAccountBloc(sl()),
  );
  sl.registerFactory<WishlistBloc>(() => WishlistBloc(repo: sl()));
  sl.registerFactory<ProductBloc>(() => ProductBloc(repo: sl()));
  sl.registerFactory<BrandsBloc>(() => BrandsBloc(repo: sl()));
  sl.registerFactory<OnlyForYouBloc>(
    () => OnlyForYouBloc(onlyForYouRepo: sl()),
  );
  sl.registerFactory<CategoriesBloc>(() => CategoriesBloc(repo: sl()));
  sl.registerFactory<OccasionsBloc>(() => OccasionsBloc(repo: sl()));
  sl.registerFactory<LatestProductBloc>(() => LatestProductBloc(repo: sl()));
  sl.registerFactory<AddRatingCubit>(() => AddRatingCubit(repo: sl()));
  sl.registerFactory<CartBloc>(() => CartBloc(repo: sl()));
  sl.registerFactory<TrackOrderBloc>(() => TrackOrderBloc(repo: sl()));
  sl.registerFactory<SpecialOccasionsBloc>(
    () => SpecialOccasionsBloc(repo: sl()),
  );
}
