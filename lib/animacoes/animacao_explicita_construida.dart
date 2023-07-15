import 'package:flutter/material.dart';

class AnimacoesExplicitaConstruida extends StatefulWidget {
  const AnimacoesExplicitaConstruida({super.key});

  @override
  State<AnimacoesExplicitaConstruida> createState() =>
      _AnimacoesExplicitaConstruidaState();
}

class _AnimacoesExplicitaConstruidaState
    extends State<AnimacoesExplicitaConstruida>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationStatus _animationStatus;
  @override
  void initState() {
    _animationStatus = AnimationStatus.dismissed;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      // ..repeat()
      ..addStatusListener((status) {
        _animationStatus = status;
      });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: 300,
            height: 400,
            child: RotationTransition(
              turns: _animationController,
              alignment: Alignment.center,
              child: Image.asset("assets/logo.png"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_animationStatus == AnimationStatus.dismissed) {
                _animationController.repeat();
              } else {
                _animationController.reverse();
              }
              // if (_animationController.isAnimating) {
              //   _animationController.stop();
              // } else {
              //   _animationController.reverse();
              // }
            },
            child: const Text(
              "Pressione o botão",
            ),
          ),
        ],
      ),
    );
  }
}
