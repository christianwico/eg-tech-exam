import 'package:exam/pages/landing/landing_page.dart';
import 'package:exam/pages/login/login_page.dart';
import 'package:exam/providers/auth/auth.dart';
import 'package:exam/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Auth(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<Auth>().init();
    context.watch<Auth>().addListener(() {
      if (!context.read<Auth>().isBusy) {
        EasyLoading.dismiss();

        if (context.read<Auth>().isLoggedIn) {
          EasyLoading.showSuccess('Logged-in successfully!');
        } else {
          EasyLoading.showInfo('Logged-out');
        }
      } else {
        EasyLoading.show();
      }
    });

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: context.watch<Auth>().isLoggedIn ? LandingPage() : LoginPage(),
      builder: EasyLoading.init(),
    );
  }
}
