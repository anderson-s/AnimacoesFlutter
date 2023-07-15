import 'package:animacoes_flutter/src/login_ui.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Trabalhando com animações no Flutter",
      debugShowCheckedModeBanner: false,
      home: LoginUi(),
    );
  }
}
