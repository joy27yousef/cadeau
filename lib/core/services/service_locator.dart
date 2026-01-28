import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/dio_consumer.dart';
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
  sl.registerLazySingleton<BrandsRepo>(() => BrandsRepo(api: sl()));

  // =====================
  // Blocs
  // =====================
  sl.registerFactory<BrandsBloc>(() => BrandsBloc(repo: sl()));
}
