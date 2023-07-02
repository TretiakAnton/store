import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/core/constants.dart';
import 'package:store/core/navigation/app_router.dart';
import 'package:store/core/widgets/inputs.dart';
import 'package:store/logic/login_bloc/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController(text: 'test@mail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Test1234');

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginCubit>();
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginCompleted) {
          context.router.popAndPush(const HomeScreenRoute());
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(verticalPadding),
            child: Column(
              children: [
                SizedBox(
                  height: verticalPadding * 7,
                ),
                Text(
                  'eCommerce',
                  style: GoogleFonts.prata(
                    textStyle: const TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: verticalPadding * 4,
                ),
                InputWidget(
                  textEditingController: emailController,
                  hintText: 'User name',
                ),
                SizedBox(
                  height: largeVerticalPadding,
                ),
                PasswordInput(
                  passController: passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: primary,
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: largeVerticalPadding,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginCompleted) {}
                    return Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(
                                verticalPadding * 2,
                                verticalPadding * 2,
                              ),
                              backgroundColor: primary,
                            ),
                            onPressed: () async {
                              state is LoginInProgress
                                  ? null
                                  : await bloc.googleLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                            },
                            child: state is LoginInProgress
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Log in',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
