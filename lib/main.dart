import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/constants/init/inti_hive.dart';
import 'package:tashil_food_app/constants/locale/locale_controller.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/bindings/controller_binding.dart';
import 'package:tashil_food_app/core/logic/controllers/theme_controller.dart';
import 'package:tashil_food_app/routes/route_generator.dart';
import 'package:tashil_food_app/routes/screen_name.dart';
// import 'package:tashil_food_app/test_fi/test_firbase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  // SystemChrome.setSystemUIOverlayStyle
  //   SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.white.withOpacity(.8),
  //     statusBarColor: Colors.white.withOpacity(.8),
  //   ),
  // );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await InitHive.initBoxHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SharedPrefs.instance.clear();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: ControllerBinding(),

          debugShowCheckedModeBanner: false,
          title: 'MASHWY APP',
          locale: SharedPref.instance.getString("curruntLang") == null
              ? Get.deviceLocale
              : Locale(SharedPref.instance.getString("curruntLang")!),
          translations: MyLocale(),
          fallbackLocale: const Locale('en'),
          theme: ThemesApp.lightTheme(),
          darkTheme: ThemesApp.darkTheme(),
          themeMode: ThemeController().themeDataGet,
          // ThemeController().themeDataGet
          initialRoute: SharedPref.instance.getString('token') != null
              ? ScreenName.mainScreen
              : AppRoutes.splash,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
