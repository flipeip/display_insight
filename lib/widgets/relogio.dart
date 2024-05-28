import 'dart:async';

import 'package:flutter/material.dart';

import '../utils.dart';

class Relogio extends StatefulWidget {
  const Relogio({super.key});

  @override
  State<Relogio> createState() => _RelogioState();
}

class _RelogioState extends State<Relogio> {
  String hora = '00:00';

  atualizarHora() {
    final agora = DateTime.now();
    setState(() {
      hora = '${agora.hour}:${agora.minute}';
    });
  }

  @override
  void initState() {
    super.initState();
    atualizarHora();
    Timer.periodic(
      const Duration(milliseconds: 500),
      (_) => atualizarHora(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConstOf(context) * 20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.12,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            hora,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: sizeConstOf(context) * 70.0,
            ),
          ),
        ),
      ),
    );
  }
}
