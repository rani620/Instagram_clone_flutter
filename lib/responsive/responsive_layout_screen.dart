import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/dimention.dart';

class ResponseiveLayout extends StatelessWidget {
  final Widget webscreenLayout;
  final Widget mobilscreenlayout;
  const ResponseiveLayout({
    required this.webscreenLayout,
    required this.mobilscreenlayout,
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webscreen) {
          return webscreenLayout; //webcreen
        }
        return mobilscreenlayout; //mobil screen
      },
    );
  }
}
