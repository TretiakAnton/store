import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/constants.dart';
import 'package:store/core/navigation/app_router.dart';
import 'package:store/logic/login_bloc/login_cubit.dart';
import 'package:store/logic/store_bloc/store_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyA8g3OUbShXVmkYj8255MqOli25rS3osxM',
    appId: '1:26892132028:android:84a409a233b4ad00b0fab9',
    messagingSenderId: '26892132028	',
    projectId: 'store-429e8',
    storageBucket: 'store-429e8.appspot.com',
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<StoreCubit>(create: (context) => StoreCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: primary,
          ),
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
