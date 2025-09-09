import 'package:flutter/material.dart';

import 'widgets/fundo.dart';
import 'widgets/fundo_quadriculado.dart';

class Tema {
  final Color corFundo;
  final Color corPrimaria;
  final Color corTexto;
  final Widget fundo;
  final String logo;

  const Tema({
    this.corFundo = const Color(0xFF730B0E),
    this.corPrimaria = const Color(0xFF8D1317),
    this.corTexto = const Color(0xFFFFFFFF),
    this.fundo = const Fundo(),
    this.logo = 'assets/vectors/logo.si',
  });

  Tema copyWith(
      {final Color? corFundo,
      final Color? corPrimaria,
      final Color? corTexto,
      final Widget? fundo}) {
    return Tema(
      corPrimaria: corPrimaria ?? this.corPrimaria,
      corFundo: corFundo ?? this.corFundo,
      corTexto: corTexto ?? this.corTexto,
      fundo: fundo ?? Fundo(),
    );
  }
}

const temaOutubroRosa = Tema(
  corFundo: Color(0xFFD15499),
  corPrimaria: Color(0xFFB63F8E),
);

const temaNovembroAzul = Tema(
  corFundo: Color(0xFF09379B),
  corPrimaria: Color(0xFF1760B4),
);

const temaSetembroAmarelo = Tema(
  corFundo: Color.fromARGB(255, 223, 169, 21),
  corPrimaria: Color.fromARGB(255, 214, 136, 19),
);

final temaNatal = Tema(
  fundo: Fundo(corDasParticulas: Colors.white),
  logo: 'assets/vectors/logo_natal.si',
);

final temaSanjas = Tema(
  fundo: FundoQuadriculado(),
  logo: 'assets/vectors/logo_sanjas.si',
);

Tema tema() {
  final now = DateTime.now();

  if (now.month == DateTime.december ||
      (now.month == DateTime.november && now.day >= 25)) {
    return temaNatal;
  }

  if (now.month == DateTime.june ||
      (now.month == DateTime.may && now.day >= 25)) {
    return temaSanjas;
  }

  return switch (now.month) {
    DateTime.september => temaSetembroAmarelo,
    DateTime.october => temaOutubroRosa,
    DateTime.november => temaNovembroAzul,
    _ => Tema(),
  };
}
