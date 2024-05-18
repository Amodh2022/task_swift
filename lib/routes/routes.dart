import 'package:get/get.dart';
import 'package:task_swift/component/bottom_nav_bar/bindings/bottom_nav_bar_bindings.dart';
import 'package:task_swift/component/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:task_swift/presentation/home_screen/bindings/home_screen_bindings.dart';
import 'package:task_swift/presentation/login_screen/bindings/login_screen_bindings.dart';
import 'package:task_swift/presentation/onboarding_screen/bindings/onboarding_bindings.dart';
import 'package:task_swift/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:task_swift/presentation/sign_up_screen/bindings/sign_up_bindings.dart';
import 'package:task_swift/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:task_swift/presentation/splash_screen/bindings/splash_screen_bindings.dart';
import 'package:task_swift/presentation/splash_screen/splash_screen.dart';
import 'package:task_swift/routes/app_route_name.dart';
import '../presentation/login_screen/login_screen.dart';

class AppRoutes {
  static final getPages = [
    GetPage(
        name: AppRouteName.splashScreen,
        page: () => const SplashScreen(),
        binding: SplashScreenBindings()),
    GetPage(
        name: AppRouteName.onBScreen,
        page: () => const OnBoardingScreen(),
        binding: OnboardingBindings()),
    GetPage(
        name: AppRouteName.loginScreen,
        page: () => const LoginScreen(),
        binding: LoginScreenBindings()),
    GetPage(
        name: AppRouteName.signUpScreen,
        page: () => const SignUpScreen(),
        binding: SignUpBindings()),
    GetPage(
        name: AppRouteName.navBar,
        page: () => const TaskSwiftNav(),
        bindings: [
          TaskSwiftNavBindings(),
          HomeScreenBindings(),
        ]),
  ];
}
