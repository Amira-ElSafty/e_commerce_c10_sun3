import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/cart_repository.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/repository/repository/home_repository.dart';

import '../entities/AddCartResponseEntity.dart';
import '../entities/failurs.dart';

class GetCartUseCase{
  CartRepository cartRepository ;
  GetCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(){
    return cartRepository.getCart();
  }
}