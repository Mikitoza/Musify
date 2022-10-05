import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/login/login_cubit.dart';
import 'package:musify_mobile/presentation/pages/login/login_state.dart';
import 'package:musify_mobile/presentation/theme/theme_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cubit = i.get<LoginCubit>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: cubit,
      listenWhen: (previous, current) {
        return !previous.showLoginError && current.showLoginError;
      },
      listener: (context, state) {
        if (state.showLoginError) {}
        cubit.reset();
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ThemeProvider.of(context).theme.secondaryAction,
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment(0.0, -0.9),
                  image: AssetImage(
                    'assets/images/bg.png',
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.25,
                      right: MediaQuery.of(context).size.width * 0.25,
                      top: MediaQuery.of(context).size.width * 0.4,
                      bottom: MediaQuery.of(context).size.width * 0.15,
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.width * 0.45,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: TextField(
                      controller: _loginController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                          color: ThemeProvider.of(context).theme.light,
                        ),
                        hintText: "Логин",
                        fillColor: ThemeProvider.of(context).theme.light.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.025,
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                          color: ThemeProvider.of(context).theme.light,
                        ),
                        hintText: "Пароль",
                        fillColor: ThemeProvider.of(context).theme.light.withOpacity(0.5),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => cubit.login(
                      username: _loginController.text,
                      password: _passwordController.text,
                    ),
                    child: const Text("Ввод"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.07,
                      ),
                      textStyle: TextStyle(
                        color: ThemeProvider.of(context).theme.light,
                      ),
                      primary: ThemeProvider.of(context).theme.primaryAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => cubit.register(
                      password: _passwordController.text,
                      username: _loginController.text,
                    ),
                    child: Text(
                      "Cоздать аккаунт",
                      style: TextStyle(
                        color: ThemeProvider.of(context).theme.light,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
