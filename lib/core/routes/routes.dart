import 'package:bloc_demo_project/di.dart' show getIt;
import 'package:bloc_demo_project/feature/login/data/models/login_response_model.dart'
    show LoginResponseModel;
import 'package:bloc_demo_project/feature/login/domain/entities/user.dart';
import 'package:bloc_demo_project/feature/login/presentation/bloc/login_bloc.dart';
import 'package:bloc_demo_project/feature/login/presentation/screen/login_screenn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../feature/splash/presentation/screen/splash_screen.dart';
// Product screens
import '../../feature/products/presentation/screen/product_list_screen.dart';
import '../../feature/products/presentation/screen/product_detail_screen.dart';
import '../../feature/products/presentation/screen/product_create_screen.dart';
import '../../feature/products/presentation/screen/product_edit_screen.dart';
// User screens
import '../../feature/users/presentation/screen/user_list_screen.dart';
import '../../feature/users/presentation/screen/user_detail_screen.dart';
import '../../feature/users/presentation/screen/user_create_screen.dart';
import '../../feature/users/presentation/screen/user_edit_screen.dart';
// Category screens
import '../../feature/categories/presentation/screen/category_list_screen.dart';
import '../../feature/categories/presentation/screen/category_detail_screen.dart';
import '../../feature/categories/presentation/screen/category_create_screen.dart';
import '../../feature/categories/presentation/screen/category_edit_screen.dart';
// Auth screens
import '../../feature/auth/presentation/screen/profile_screen.dart';

class AppRouter {
  AppRouter._(); // Private constructor

  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RoutePaths.login,
        name: RouteNames.login,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<LoginBloc>(),
              child: const LoginScreen(),
            ),
      ),
      // Product routes
      GoRoute(
        path: RoutePaths.productList,
        name: RouteNames.productList,
        builder: (context, state) {
          if (state.extra != null && state.extra is User) {
            final user = state.extra as User;
            return ProductListScreen(user: user);
          }
          return _errorBuilder(context, state);
        },
      ),
      GoRoute(
        path: RoutePaths.productDetail,
        name: RouteNames.productDetail,
        builder: (context, state) => const ProductDetailScreen(),
      ),
      GoRoute(
        path: RoutePaths.productCreate,
        name: RouteNames.productCreate,
        builder: (context, state) => const ProductCreateScreen(),
      ),
      GoRoute(
        path: RoutePaths.productEdit,
        name: RouteNames.productEdit,
        builder: (context, state) => const ProductEditScreen(),
      ),
      // User routes
      GoRoute(
        path: RoutePaths.userList,
        name: RouteNames.userList,
        builder: (context, state) => const UserListScreen(),
      ),
      GoRoute(
        path: RoutePaths.userDetail,
        name: RouteNames.userDetail,
        builder: (context, state) => const UserDetailScreen(),
      ),
      GoRoute(
        path: RoutePaths.userCreate,
        name: RouteNames.userCreate,
        builder: (context, state) => const UserCreateScreen(),
      ),
      GoRoute(
        path: RoutePaths.userEdit,
        name: RouteNames.userEdit,
        builder: (context, state) => const UserEditScreen(),
      ),
      // Category routes
      GoRoute(
        path: RoutePaths.categoryList,
        name: RouteNames.categoryList,
        builder: (context, state) => const CategoryListScreen(),
      ),
      GoRoute(
        path: RoutePaths.categoryDetail,
        name: RouteNames.categoryDetail,
        builder: (context, state) => const CategoryDetailScreen(),
      ),
      GoRoute(
        path: RoutePaths.categoryCreate,
        name: RouteNames.categoryCreate,
        builder: (context, state) => const CategoryCreateScreen(),
      ),
      GoRoute(
        path: RoutePaths.categoryEdit,
        name: RouteNames.categoryEdit,
        builder: (context, state) => const CategoryEditScreen(),
      ),
      // Auth/Profile
      GoRoute(
        path: RoutePaths.profile,
        name: RouteNames.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
    errorBuilder: _errorBuilder,
  );
  static Widget _errorBuilder(BuildContext context, GoRouterState state) {
    return const Scaffold(body: Center(child: Text('404 - Page Not Found')));
  }
}

class RoutePaths {
  static const String splash = '/';
  static const String login = '/login';
  static const String productList = '/products';
  static const String productDetail = '/products/detail';
  static const String productCreate = '/products/create';
  static const String productEdit = '/products/edit';
  static const String userList = '/users';
  static const String userDetail = '/users/detail';
  static const String userCreate = '/users/create';
  static const String userEdit = '/users/edit';
  static const String categoryList = '/categories';
  static const String categoryDetail = '/categories/detail';
  static const String categoryCreate = '/categories/create';
  static const String categoryEdit = '/categories/edit';
  static const String profile = '/profile';
}

class RouteNames {
  static const String splash = 'splash';
  static const String login = 'login';
  static const String productList = 'productList';
  static const String productDetail = 'productDetail';
  static const String productCreate = 'productCreate';
  static const String productEdit = 'productEdit';
  static const String userList = 'userList';
  static const String userDetail = 'userDetail';
  static const String userCreate = 'userCreate';
  static const String userEdit = 'userEdit';
  static const String categoryList = 'categoryList';
  static const String categoryDetail = 'categoryDetail';
  static const String categoryCreate = 'categoryCreate';
  static const String categoryEdit = 'categoryEdit';
  static const String profile = 'profile';
}
