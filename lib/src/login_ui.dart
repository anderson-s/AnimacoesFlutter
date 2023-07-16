import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _animationFade;
  late Animation<double> _animationSize;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    _animation = Tween<double>(
      begin: 5,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );
    _animationFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutQuint,
      ),
    );
    _animationSize = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.decelerate,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 8;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, widget) {
                return Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/fundo.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: _animation.value,
                      sigmaY: _animation.value,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          child: FadeTransition(
                            opacity: _animationFade,
                            child: Image.asset("assets/detalhe1.png"),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          child: FadeTransition(
                            opacity: _animationFade,
                            child: Image.asset("assets/detalhe2.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Column(
                children: [
                  AnimatedBuilder(
                      animation: _animationSize,
                      builder: (context, widget) {
                        return Container(
                          width: _animationSize.value,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[200]!,
                                blurRadius: 15,
                                spreadRadius: 4,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: const Icon(Icons.person),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: const Icon(Icons.lock),
                                    hintText: "Senha",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedBuilder(
                      animation: _animationSize,
                      builder: (context, widget) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            width: _animationSize.value,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(255, 100, 127, 1),
                                  Color.fromRGBO(255, 123, 145, 1),
                                ],
                              ),
                            ),
                            height: 50,
                            child: const Center(
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeTransition(
                    opacity: _animationFade,
                    child: const Text(
                      "Esqueci a minha senha!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 100, 127, 1),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
