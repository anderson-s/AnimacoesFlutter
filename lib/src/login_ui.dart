import 'package:flutter/material.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/fundo.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Image.asset("assets/detalhe1.png"),
                  ),
                  Positioned(
                    left: 50,
                    child: Image.asset("assets/detalhe2.png"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Column(
                children: [
                  Container(
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
                    child: const Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                        ),
                        TextField(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const InkWell(
                  //     // child: ,
                  //     ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Esqueci a minha senha!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 100, 127, 1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
