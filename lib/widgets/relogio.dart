import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../tema.dart';
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
    return switch (this) {
      Meses.janeiro => 'Janeiro',
      Meses.fevereiro => 'Fevereiro',
      Meses.marco => 'Março',
      Meses.abril => 'Abril',
      Meses.maio => 'Maio',
      Meses.junho => 'Junho',
      Meses.julho => 'Julho',
      Meses.agosto => 'Agosto',
      Meses.setembro => 'Setembro',
      Meses.outubro => 'Outubro',
      Meses.novembro => 'Novembro',
      Meses.dezembro => 'Dezembro',
    };
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
    return switch (this) {
      DiaSemana.domingo => 'Domingo',
      DiaSemana.segunda => 'Segunda-feira',
      DiaSemana.terca => 'Terça-feira',
      DiaSemana.quarta => 'Quarta-feira',
      DiaSemana.quinta => 'Quinta-feira',
      DiaSemana.sexta => 'Sexta-feira',
      DiaSemana.sabado => 'Sábado',
    };
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

  void atualizarHora() {
    final agora = DateTime.now();
    final horaAgora = agora.hour;
    final minutoAgora = agora.minute < 10 ? '0${agora.minute}' : agora.minute;
    final segundosAgora = agora.second < 10 ? '0${agora.second}' : agora.second;
    final diaAgora = agora.day;
    final mesAgora = Meses.values[agora.month - 1].nome;
    final diaSemana = DiaSemana.values[agora.weekday].nome;
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
      child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: tema().sombraLogo,
            blurRadius: 60,
            offset: Offset(0, 15)
          ),
        ],
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}
