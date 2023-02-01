

import 'package:flutter/material.dart';
import 'package:instagram_flutter/models/user.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/utils/global_variable.dart';
import 'package:provider/provider.dart';

class ResponseiveLayout extends StatefulWidget {
  final Widget webscreenLayout;
  final Widget mobilscreenlayout;
  const ResponseiveLayout(
      {required this.webscreenLayout,
      required this.mobilscreenlayout,
      super.key});

  @override
  State<ResponseiveLayout> createState() => _ResponseiveLayoutState();
}

class _ResponseiveLayoutState extends State<ResponseiveLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshuser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webscreen) {
          return widget.webscreenLayout; //webcreen
        }
        return widget.mobilscreenlayout; //mobil screen
      },
    );
  }
}
