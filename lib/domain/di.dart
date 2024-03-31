//todo: viewModel => object useCase
//todo: useCase => object repository
//todo: repository => object dataSource
//todo: dataSource =>object apiManager

import 'package:flutter_e_commerce_c10_sun3/data/api/ApiManager.dart';
import 'package:flutter_e_commerce_c10_sun3/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:flutter_e_commerce_c10_sun3/data/repository/repository/auth_repository_impl.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/auth_repository.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/login_use_case.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/use_cases/register_use_case.dart';

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authRepository: injectAuthRepository());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(authRepository: injectAuthRepository());
}
AuthRepository injectAuthRepository(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}