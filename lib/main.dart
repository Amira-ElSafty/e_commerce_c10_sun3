import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/auth/login/login_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/auth/register/register_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/cart/cart_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/home_screen/home_screen_view.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/product_details/product_details_view.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/splash/splash_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreenView.routeName: (context) => HomeScreenView(),
              ProductDetailsView.routeName: (context) => ProductDetailsView(),
              CartScreen.routeName: (context) => CartScreen(),
            },
            theme: AppTheme.mainTheme,
          );
        });
  }
}
