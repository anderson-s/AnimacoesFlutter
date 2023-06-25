import 'package:flutter/material.dart';

class AnimacoesBasicas extends StatefulWidget {
  const AnimacoesBasicas({super.key});

  @override
  State<AnimacoesBasicas> createState() => _AnimacoesBasicasState();
}

class _AnimacoesBasicasState extends State<AnimacoesBasicas> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Meu App"),
        centerTitle: true,
      ),
      // body: AnimatedContainer(
      //   duration: const Duration(
      //     seconds: 2,
      //   ),
      //   color: Colors.green,
      //   padding: const EdgeInsets.only(bottom: 100, top: 20),
      //   alignment: status ? Alignment.bottomCenter : Alignment.topCenter,
      //   child: AnimatedOpacity(
      //     opacity: status ? 1 : 0,
      //     duration: const Duration(seconds: 1),
      //     child: const SizedBox(
      //       height: 50,
      //       child: Icon(
      //         Icons.airplanemode_active,
      //         size: 50,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              status = !status;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
            alignment: Alignment.center,
            width: status ? 60 : 160,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: status ? 1 : 0,
                    child: const Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: status ? 0 : 1,
                    child: const Text(
                      "Mensagem",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            status = !status;
          });
        },
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 6,
        child: const Icon(Icons.add_box),
      ),
    );
  }
}
