import 'dart:async';

import 'package:gap/gap.dart';

import '../tema.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

enum Meses {
  janeiro,
  fevereiro,
  marco,
  abril,
  maio,
  junho,
  julho,
  agosto,
  setembro,
  outubro,
  novembro,
  dezembro;

  String get nome {
    switch (this) {
      case Meses.janeiro:
        return 'Janeiro';
      case Meses.fevereiro:
        return 'Fevereiro';
      case Meses.marco:
        return 'Março';
      case Meses.abril:
        return 'Abril';
      case Meses.maio:
        return 'Maio';
      case Meses.junho:
        return 'Junho';
      case Meses.julho:
        return 'Julho';
      case Meses.agosto:
        return 'Agosto';
      case Meses.setembro:
        return 'Setembro';
      case Meses.outubro:
        return 'Outubro';
      case Meses.novembro:
        return 'Novembro';
      case Meses.dezembro:
        return 'Dezembro';
    }
  }
}

enum DiaSemana {
  domingo,
  segunda,
  terca,
  quarta,
  quinta,
  sexta,
  sabado;

  String get nome {
    switch (this) {
      case DiaSemana.domingo:
        return 'Domingo';
      case DiaSemana.segunda:
        return 'Segunda-feira';
      case DiaSemana.terca:
        return 'Terça-feira';
      case DiaSemana.quarta:
        return 'Quarta-feira';
      case DiaSemana.quinta:
        return 'Quinta-feira';
      case DiaSemana.sexta:
        return 'Sexta-feira';
      case DiaSemana.sabado:
        return 'Sábado';
    }
  }
}

class Relogio extends StatefulWidget {
  const Relogio({super.key});

  @override
  State<Relogio> createState() => _RelogioState();
}

class _RelogioState extends State<Relogio> {
  String hora = '';
  String dia = '';

  atualizarHora() {
    final agora = DateTime.now();
    final horaAgora = agora.hour;
    final minutoAgora = agora.minute < 10 ? '0${agora.minute}' : agora.minute;
    final segundosAgora = agora.second < 10 ? '0${agora.second}' : agora.second;
    final diaAgora = agora.day;
    final mesAgora = Meses.values[agora.month - 1].nome;
    final diaSemana = DiaSemana.values[agora.weekday - 1].nome;
    setState(() {
      hora = '$horaAgora:$minutoAgora:$segundosAgora';
      dia = '$diaSemana, $diaAgora de $mesAgora';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(sizeConstOf(context) * 20),
          Text(
            hora,
            style: TextStyle(
              color: tema().corTexto,
              fontWeight: FontWeight.bold,
              height: 0.9,
              fontSize: sizeConstOf(context) * 90.0,
            ),
          ),
          Text(
            dia,
            style: TextStyle(
              color: tema().corTexto,
              fontSize: sizeConstOf(context) * 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
