import 'dart:async';

import '../tema.dart';
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
    final horaAgora = agora.hour;
    final minutoAgora = agora.minute < 10 ? '0${agora.minute}' : agora.minute;
    final segundosAgora = agora.second < 10 ? '0${agora.second}' : agora.second;
    setState(() {
      hora = '$horaAgora:$minutoAgora:$segundosAgora';
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
      padding: EdgeInsets.symmetric(
        horizontal: sizeConstOf(context) * 60.0,
        vertical: sizeConstOf(context) * 15,
      ),
      child: Text(
        hora,
        style: TextStyle(
          color: tema().corTexto,
          fontWeight: FontWeight.bold,
          fontSize: sizeConstOf(context) * 90.0,
        ),
      ),
    );
  }
}
