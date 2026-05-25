import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';

class MainNotification extends StatelessWidget {
  const MainNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Product Alert'),
      body: Column(children: []),
    );
  }
}
