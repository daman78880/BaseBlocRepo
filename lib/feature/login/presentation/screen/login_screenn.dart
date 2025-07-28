import 'package:bloc_demo_project/core/routes/routes.dart' show RouteNames;
import 'package:bloc_demo_project/feature/login/presentation/bloc/login_bloc.dart';
import 'package:bloc_demo_project/feature/login/presentation/bloc/login_event.dart'
    show SubmitLoginEvent;
import 'package:bloc_demo_project/feature/login/presentation/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/common_widgets/input_text_field.dart';
import '../../../../core/common_widgets/common_image_loader.dart';
import '../../../../core/constants/image_resource.dart';
import '../../../../core/common_widgets/button_bouncing_effect.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController(
    text: "john@mail.com",
  );
  final TextEditingController _pswdController = TextEditingController(
    text: "changeme",
  );

  @override
  void dispose() {
    _loginController.dispose();
    _pswdController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    FocusScope.of(context).unfocus();
    //     {
    //   "email": "test@test.com",
    //   "password": "123456"
    // }
    final email = _loginController.text.trim();
    final password = _pswdController.text;

    String? errorMessage;

    // Email validation
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );

    if (email.isEmpty) {
      errorMessage = 'Please enter your email address.';
    } else if (!emailRegex.hasMatch(email)) {
      errorMessage = 'Please enter a valid email address.';
    } else if (password.isEmpty) {
      errorMessage = 'Please enter your password.';
    } else if (password.length < 6) {
      errorMessage = 'Password must be at least 6 characters.';
    }

    if (errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
      return;
    }
    // context.goNamed(RouteNames.productList);
    // getIt<LoginBloc>().add(SubmitLoginEvent(email: email, password: password));
    context.read<LoginBloc>().add(
      SubmitLoginEvent(email: email, password: password),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(
            'AI Login',
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: colorScheme.surface,
          elevation: 0,
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error.toString())));
            }
            if (state is LoginSuccess) {
              // context.goNamed(RouteNames.productList);
              context.pushNamed(RouteNames.productList, extra: state.user);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Login Success")));
            }
          },
          builder: (BuildContext context, Object? state) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      CommonImageLoader(
                        asset: CommonImageAsset(
                          path: ImageResource.splashOverLayBlueYellow,
                          type: CommonImageType.png,
                        ),
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 24),
                      // Title
                      Text(
                        'Welcome Back',
                        style: textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Sign in to continue',
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32),
                      CommonInputTextField(
                        hintText: 'Email',
                        controller: _loginController,
                        borderRadius: 12,
                        textStyle: textTheme.bodyLarge,
                        hintStyle: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                        keyboardTypeParam: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      CommonInputTextField(
                        hintText: 'Password',
                        isPassword: true,
                        borderRadius: 12,
                        controller: _pswdController,
                        textStyle: textTheme.bodyLarge,
                        hintStyle: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                      SizedBox(height: 24),
                      ButtonBouncingEffect(
                        child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            onPressed: _onLoginPressed,
                            child: Text(
                              'Login',
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
