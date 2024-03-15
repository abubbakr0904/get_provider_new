import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_provider_new/data/network/api_provider.dart';
import 'package:get_provider_new/data/repository/country_repository.dart';
import 'package:get_provider_new/screens/home_screen/home_screen.dart';
import 'package:get_provider_new/view_model/country_view_model.dart';
import 'package:get_provider_new/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  ApiProvider apiProvider = ApiProvider();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountryViewModel(
            countryRepository: DataRepository(apiProvider: apiProvider),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => UserViewModel(
            userRepo: DataRepository(apiProvider: apiProvider),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}