import 'package:flutter/material.dart';
import 'package:num_to_text/core/theme/theme.dart';
import 'package:num_to_text/features/num_to_text/page/page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().theme(),
      home: const NumToTextPage(),
    );
  }
}
