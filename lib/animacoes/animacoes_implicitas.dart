import 'package:flutter/material.dart';

class AnimacoesImplicitas extends StatefulWidget {
  const AnimacoesImplicitas({super.key});

  @override
  State<AnimacoesImplicitas> createState() => _AnimacoesImplicitasState();
}

class _AnimacoesImplicitasState extends State<AnimacoesImplicitas> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          padding: const EdgeInsets.all(20),
          duration: const Duration(
            seconds: 2,
          ),
          width: status ? 200 : 300,
          height: status ? 300 : 200,
          color: status ? Colors.white : Colors.purpleAccent,
          curve: Curves.elasticInOut,
          child: Image.asset("assets/logo.png"),
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              status = !status;
            });
          },
          child: const Text("Alterar"),
        )
      ],
    );
  }
}
