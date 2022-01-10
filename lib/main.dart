import 'package:flutter/material.dart';
import 'package:mini_pril/cloth.dart';
import 'package:mini_pril/mainScreen.dart';
import 'package:provider/provider.dart';

import 'object.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorFilters(),
      child: ChangeNotifierProvider(
          create: (context) => Provide(),
          child: MaterialApp(home: MainScreenCloth())),
    );
  }
}
