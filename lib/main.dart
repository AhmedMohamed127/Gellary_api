import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_updated/Shared/bloc_observer.dart';
import 'package:news_app_updated/login/gallery_login_screen.dart';
import 'package:news_app_updated/network/remote/DioHelper.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer =MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                color: Colors.deepPurple,
              )
          ),
          home: GallaryLoginScreen(),
        );
      }
  }
