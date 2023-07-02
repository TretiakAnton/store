import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/core/constants.dart';
import 'package:store/core/navigation/routes.dart';
import 'package:store/core/widgets/inputs.dart';
import 'package:store/logic/login_bloc/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginCubit>();
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginCompleted) {
          context.router.pushNamed(Routes.homeScreen);
        }
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                //TODO add validation
                InputWidget(
                  textEditingController: emailController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'User name',
                ),
                SizedBox(
                  height: largeVerticalPadding,
                ),
                PasswordInput(
                  passController: passwordController,
                  textInputAction: TextInputAction.done,
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
                                verticalPadding * 2.5,
                                verticalPadding * 2.5,
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
