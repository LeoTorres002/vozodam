import 'dart:async';
import 'package:flutter/material.dart';
import 'inicio.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navegar a la siguiente pantalla después de 5 segundos
    Timer(
      const Duration(seconds: 5),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const Inicio(); // Navega a la pantalla de inicio
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1D37), // Color de fondo oscuro
      body: Center(
        child: Image.asset(
          "assets/vozodam.png", // Ruta de la imagen
          width: 150, // Ajusta el tamaño según tus necesidades
          height: 150,
        ),
      ),
    );
  }
}