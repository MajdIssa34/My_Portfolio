import 'package:flutter/material.dart';
import 'package:majd_website/layouts/desktop_layout.dart';
import 'package:majd_website/layouts/mobile_layout.dart';

class MyWebsite extends StatelessWidget {
  const MyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _getScreen(context),
    );
  }

  Widget _getScreen(BuildContext context){

    var screenWidth = MediaQuery.of(context).size.width;
    
    const mobileWidthThreshold = 800;

    if (screenWidth < mobileWidthThreshold) {
      return MobileLayout();
    } else {
      return DesktopLayout();
    }
  }

}
