import 'package:animacoes_flutter/animacoes/animacoes_basicas.dart';
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
      home: AnimacoesBasicas(),
    );
  }
}
