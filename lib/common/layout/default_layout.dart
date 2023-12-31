import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    super.key,
    this.title,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        // AppBar가 앞으로 튀어나온거 같은

        elevation: 0,
        title: Text(title!,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            )),
        // 앱 바 위의 글씨 색
        foregroundColor: Colors.black,
      );
    }
  }
}
