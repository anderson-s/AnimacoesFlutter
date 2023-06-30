import 'package:flutter/material.dart';

class AnimacaoTweenBuilder extends StatefulWidget {
  const AnimacaoTweenBuilder({super.key});

  @override
  State<AnimacaoTweenBuilder> createState() => _AnimacaoTweenBuilderState();
}

class _AnimacaoTweenBuilderState extends State<AnimacaoTweenBuilder> {
  static final colorTween = ColorTween(begin: Colors.white, end: Colors.orange);

  @override
  Widget build(BuildContext context) {
    //Rotação
    // return Center(
    //   child: TweenAnimationBuilder(
    //     tween: Tween<double>(begin: 0, end: 6.28),
    //     duration: const Duration(seconds: 2),
    //     builder: (BuildContext context, double angulo, Widget? widget) {
    //       return Transform.rotate(
    //         angle: angulo,
    //         child: Image.asset("assets/logo.png"),
    //       );
    //     },
    //   ),
    // );
    // return Center(
    //   child: TweenAnimationBuilder(
    //     tween: Tween<double>(begin: 50, end: 180),
    //     duration: const Duration(seconds: 2),
    //     builder: (BuildContext context, double largura, Widget? widget) {
    //       return Container(
    //         color: Colors.green,
    //         width: largura,
    //         height: 60,
    //       );
    //     },
    //   ),
    // );
    //Aplicando filtros
    return Center(
      child: TweenAnimationBuilder<Color?>(
        tween: colorTween,
        duration: const Duration(seconds: 2),
        child: Image.asset("assets/estrelas.jpg"),
        builder: (BuildContext context, Color? cor, Widget? widget) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(
              cor!,
              BlendMode.overlay,
            ),
            child: widget,
          );
        },
      ),
    );
  }
}
