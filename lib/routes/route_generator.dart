import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tashil_food_app/core/logic/bindings/address/address_show_binding.dart';
import 'package:tashil_food_app/core/logic/bindings/address_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/auth_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/category_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/checkout_binding.dart';
import 'package:tashil_food_app/core/logic/bindings/favorites_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/fode_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/home_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/main_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/myLocaleBinding.dart';
import 'package:tashil_food_app/core/logic/bindings/offer_binding.dart';
import 'package:tashil_food_app/core/logic/bindings/onboarding_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/onboarding_home_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/order_binding.dart';
import 'package:tashil_food_app/core/logic/bindings/product_details_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/resturant_page_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/resturant_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/review_product_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/search_bindings.dart';
import 'package:tashil_food_app/core/logic/bindings/settengs_bindings.dart';
import 'package:tashil_food_app/presentation/screens/address/add_address/write_address_screen.dart';
import 'package:tashil_food_app/presentation/screens/address/show_address/show_address_screen.dart';
import 'package:tashil_food_app/presentation/screens/meals/all_meals_screen.dart';
import 'package:tashil_food_app/presentation/screens/auth/ForgotPassword/forgot_password_screen.dart';
import 'package:tashil_food_app/presentation/screens/auth/ForgotPassword/new_password_screen.dart';
import 'package:tashil_food_app/presentation/screens/auth/ForgotPassword/send_otp_screen.dart';
import 'package:tashil_food_app/presentation/screens/auth/login_screen.dart';
import 'package:tashil_food_app/presentation/screens/auth/signup_screen.dart';
import 'package:tashil_food_app/presentation/screens/cart/cart_screen.dart';
import 'package:tashil_food_app/presentation/screens/address/add_address/address_in_map_screen.dart';
import 'package:tashil_food_app/presentation/screens/cart/checkout_screen.dart';
import 'package:tashil_food_app/presentation/screens/category/category_screen.dart';
import 'package:tashil_food_app/presentation/screens/home/home_screen.dart';
import 'package:tashil_food_app/presentation/screens/main/main_screen.dart';
import 'package:tashil_food_app/presentation/screens/notification/notification_screen.dart';
import 'package:tashil_food_app/presentation/screens/splach/onboarding_screen.dart';
import 'package:tashil_food_app/presentation/screens/meals/product_details_scree.dart';
import 'package:tashil_food_app/presentation/screens/category/meals_in_category_screen.dart';
import 'package:tashil_food_app/presentation/screens/review_rating/all_review_screen.dart';
import 'package:tashil_food_app/presentation/screens/review_rating/edit_review_screen.dart';
import 'package:tashil_food_app/presentation/screens/review_rating/write_review_screen.dart';
import 'package:tashil_food_app/presentation/screens/search/filter_screen.dart';
import 'package:tashil_food_app/presentation/screens/search/search_screen.dart';
import 'package:tashil_food_app/presentation/screens/settings/change_password_screen.dart';
import 'package:tashil_food_app/presentation/screens/order_screen/my_orders.dart';
import 'package:tashil_food_app/presentation/screens/settings/edit_profile.dart';
import 'package:tashil_food_app/presentation/screens/settings/offer_screen.dart';
import 'package:tashil_food_app/presentation/screens/settings/profile_setting.dart';
import 'package:tashil_food_app/presentation/screens/settings/rest_password.dart';
import 'package:tashil_food_app/presentation/screens/settings/settings_screen.dart';
import 'package:tashil_food_app/presentation/screens/splach/splash_screen.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class AppRoutes {
  static const splash = ScreenName.splashScreen;

  static const login = ScreenName.loginScreen;
  static final routes = [
    GetPage(
      name: ScreenName.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: ScreenName.loginScreen,
      page: () => LoginScreen(),
      bindings: [
        AuthBindings(),
      ],
    ),
    GetPage(
      name: ScreenName.signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        AuthBindings(),
      ],
    ),
    GetPage(
        name: ScreenName.onBoardingScreen,
        page: () => OnBoardingScreen(),
        bindings: [
          OnBoardingBinding(),
        ]),
    GetPage(
      name: ScreenName.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: ScreenName.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBindings(),
        MyLocaleBindings(),
        MainBindings(),
        FavoritesBindings(),
        OnBoardingHomeBinding(),
        SettengsBindings(),
        CategotyBindings(),
        HomeBindings(),
      ],
    ),
    GetPage(
      name: ScreenName.homeScreen,
      page: () => HomeScreen(),
      binding: OnBoardingHomeBinding(),
    ),
    GetPage(
      name: ScreenName.sendOTPScreen,
      page: () => SendOTPScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: ScreenName.newPwScreen,
      page: () => NewPwScreen(),
    ),
    GetPage(
      name: ScreenName.cartScreen,
      page: () => CartScreen(),
    ),
    GetPage(
        name: ScreenName.searchScreen,
        page: () => SearchScreen(),
        binding: SearchBindings()),
    GetPage(
      name: ScreenName.filterScreen,
      page: () => FilterScreen(),
      binding: MealsBindings(),
    ),
    GetPage(
        name: ScreenName.settingsScreen,
        page: () => SettingsScreen(),
        binding: SettengsBindings()),
    GetPage(
      name: ScreenName.profileSetting,
      page: () => ProfileSetting(),
    ),
    GetPage(
      name: ScreenName.restPasswordScreen,
      page: () => RestPasswordScreen(),
    ),
    GetPage(
      name: ScreenName.editProfile,
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: ScreenName.notificatonScreen,
      page: () => NotificationScreen(),
    ),
    GetPage(
        name: ScreenName.categoryScreen,
        page: () => CategoryScreen(),
        binding: RestaurantBinding()),
    GetPage(
        name: ScreenName.resturantScreen,
        page: () => RestaurantScreen(),
        binding: ResturantBageBinding()),
    GetPage(
      name: ScreenName.myOrdersScreen,
      page: () => MyOrdersScreen(),
      binding: OrderBindings(),
    ),
    // GetPage(
    //   name: ScreenName.foodScreen,
    //   page: () => FoodScreen(),
    // ),

    GetPage(
        name: ScreenName.productDetailsScreen,
        page: () => ProductDetailsScreen(),
        bindings: [
          MealDetailsBindings(),
          FavoritesBindings(),
        ]),
    GetPage(
        name: ScreenName.checkoutScreen,
        page: () => CheckoutScreen(),
        binding: CheckoutBindings()),
    GetPage(
        name: ScreenName.addressInMapScreen,
        page: () => AddressInMapScreen(),
        binding: AddressBindings()),
    GetPage(
        name: ScreenName.allReviewScreen,
        page: () => AllReviewScreen(),
        binding: PreviewRatingMealBinding()),

    GetPage(
      name: ScreenName.writeReviewScreen,
      page: () => WriteReviewScreen(),
    ),
    GetPage(
      name: ScreenName.editReviewScreen,
      page: () => EditReviewScreen(),
    ),
    GetPage(
        name: ScreenName.allFoodScreen,
        page: () => AllFoodScreen(),
        binding: MealsBindings()),
    GetPage(
      name: ScreenName.offerScreen,
      page: () => OfferScreen(),
      binding: OfferBindings(),
    ),
    GetPage(
      name: ScreenName.updatePassword,
      page: () => UpdatePassword(),
    ),
    GetPage(
      name: ScreenName.writeAddressScreen,
      page: () => WriteAddressScreen(),
    ),
    GetPage(
      name: ScreenName.showAddress,
      page: () => ShowAddress(),
      bindings: [AddressShowBindings(), CheckoutBindings()],
    ),
  ];
}
