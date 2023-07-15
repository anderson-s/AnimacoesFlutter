import 'package:flutter/material.dart';

class MaisSobreAnimacoes extends StatefulWidget {
  const MaisSobreAnimacoes({super.key});

  @override
  State<MaisSobreAnimacoes> createState() => _MaisSobreAnimacoesState();
}

class _MaisSobreAnimacoesState extends State<MaisSobreAnimacoes>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    // _animation = Tween<double>(
    //   begin: 0,
    //   end: 1,
    // ).animate(_animationController);
    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(60, 60),
    ).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.repeat();
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: AnimatedBuilder(
        animation: _animationController,
        // child: Image.asset("assets/logo.png"),
        child: Stack(
          children: [
            Positioned(
                width: 180,
                height: 180,
                left: 0,
                top: 0,
                child: Image.asset("assets/logo.png"))
          ],
        ),
        builder: (context, widget) {
          return Transform.translate(
            offset: _animation.value,
            child: widget,
          );
          // return Transform.scale(
          //   scale: _animation.value,
          //   child: widget,
          // );
          // return Transform.rotate(
          //   angle: _animation.value,
          //   child: widget,
          // );
        },
      ),
    );
  }
}
