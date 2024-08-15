

import 'package:ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/data/category/repository/category.dart';
import 'package:ecommerce/data/category/source/category_firebase_service.dart';
import 'package:ecommerce/data/order/repository/order.dart';
import 'package:ecommerce/data/order/source/order_firebase_service.dart';
import 'package:ecommerce/data/product/repository/product.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce/domain/auth/usecases/get_user.dart';
import 'package:ecommerce/domain/auth/usecases/is_logged_in.dart';
import 'package:ecommerce/domain/auth/usecases/send_password_reset_email.dart';
import 'package:ecommerce/domain/auth/usecases/signin.dart';
import 'package:ecommerce/domain/auth/usecases/siginup.dart';
import 'package:ecommerce/domain/category/usecases/get_categories.dart';
import 'package:ecommerce/domain/order/repository/order.dart';
import 'package:ecommerce/domain/order/usecases/add_to_cart.dart';
import 'package:ecommerce/domain/order/usecases/get_cart_products.dart';
import 'package:ecommerce/domain/order/usecases/remove_cart_product.dart';
import 'package:ecommerce/domain/product/repository/product.dart';
import 'package:ecommerce/domain/product/usecases/get_new_in.dart';
import 'package:ecommerce/domain/product/usecases/get_products_by_category_id.dart';
import 'package:ecommerce/domain/product/usecases/get_products_by_title.dart';
import 'package:ecommerce/domain/product/usecases/get_top_selling.dart';
import 'package:get_it/get_it.dart';

import 'data/product/source/product_firebase_service.dart';
import 'domain/category/repository/category.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Services
  
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<CategoryFirebaseService>(
    CategoryFirebaseServiceImpl()
  );

   sl.registerSingleton<ProductFirebaseService>(
    ProductFirebaseServiceImpl()
  );

  sl.registerSingleton<OrderFirebaseService>(
    OrderFirebaseServiceImpl()
  );


  // Repositories

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl()
  );

  sl.registerSingleton<ProductRepository>(
    ProductRepositoryImpl()
  );

  sl.registerSingleton<OrderRepository>(
    OrderRepositoryImpl()
  );


  // Usecases

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<GetAgesUseCase>(
    GetAgesUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );

  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase()
  );

  sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase()
  );

  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase()
  );

  sl.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase()
  );

  sl.registerSingleton<GetTopSellingUseCase>(
    GetTopSellingUseCase()
  );

  sl.registerSingleton<GetNewInUseCase>(
    GetNewInUseCase()
  );

  sl.registerSingleton<GetProductsByCategoryIdUseCase>(
    GetProductsByCategoryIdUseCase()
  );

  sl.registerSingleton<GetProductsByTitleUseCase>(
    GetProductsByTitleUseCase()
  );

  sl.registerSingleton<AddToCartUseCase>(
    AddToCartUseCase()
  );

  sl.registerSingleton<GetCartProductsUseCase>(
    GetCartProductsUseCase()
  );

  sl.registerSingleton<RemoveCartProductUseCase>(
    RemoveCartProductUseCase()
  );
}
