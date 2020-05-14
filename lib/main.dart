import 'package:flutter/material.dart';
import 'package:minimal/pages/pages.dart';
import 'package:minimal/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/utils/bouncing_scroll_behavior.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint(breakpoint: 450, name: MOBILE),
            ResponsiveBreakpoint(
                breakpoint: 800, name: TABLET, autoScale: true),
            ResponsiveBreakpoint(
                breakpoint: 1000, name: TABLET, autoScale: true),
            ResponsiveBreakpoint(breakpoint: 1200, name: DESKTOP),
            ResponsiveBreakpoint(breakpoint: 2460, name: "4K", autoScale: true),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      initialRoute: Routes.home,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Routes.home:
            return Routes.fadeThrough(settings, (context) => ListPage());
            break;
          case Routes.post:
            return Routes.fadeThrough(settings, (context) => PostPage());
            break;
          case Routes.style:
            return Routes.fadeThrough(settings, (context) => TypographyPage());
            break;
          default:
            return null;
            break;
        }
      },
      theme: Theme.of(context).copyWith(platform: TargetPlatform.android),
      debugShowCheckedModeBanner: false,
    );
  }
}
