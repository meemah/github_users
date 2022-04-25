import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_users/exports.dart';

import 'package:github_users/views/splash_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewmodel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context) => MaterialApp(
              onGenerateRoute: (settings) =>
                  Routers.generateRoute(settings, context),
              title: 'GitHub Users',
              theme: ThemeData(
                textTheme: GoogleFonts.montserratTextTheme(),
              ),
              home: const SplashView(),
            ));
  }
}
