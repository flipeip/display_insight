import 'dart:ui';

class Tema {
  final Color corFundo;
  final Color corPrimaria;
  final Color corTexto;
  final bool neve;

  const Tema(
    this.corFundo,
    this.corPrimaria, {
    this.corTexto = const Color(0xFFFFFFFF),
    this.neve = false,
  });

  Tema copyWith(
      {final Color? corFundo,
      final Color? corPrimaria,
      final Color? corTexto,
      final bool? neve}) {
    return Tema(
      corPrimaria ?? this.corPrimaria,
      corFundo ?? this.corFundo,
      corTexto: corTexto ?? this.corTexto,
      neve: neve ?? this.neve,
    );
  }
}

const temaPadrao = Tema(Color(0xFF8D1317), Color(0xFF730B0E));
const temaOutubroRosa = Tema(Color(0xFFD15499), Color(0xFFB63F8E));
const temaNovembroAzul = Tema(Color(0xFF1760B4), Color(0xFF09379B));
const temaSetembroAmarelo = Tema(
  Color.fromARGB(255, 223, 180, 38),
  Color.fromARGB(255, 206, 149, 26),
  corTexto: Color.fromARGB(255, 44, 5, 0),
);
final temaNatal = temaPadrao.copyWith(neve: true);

Tema tema() {
  return switch (DateTime.now().month) {
    DateTime.december => temaNatal,
    DateTime.november => temaNovembroAzul,
    DateTime.october => temaOutubroRosa,
    DateTime.september => temaSetembroAmarelo,
    _ => temaPadrao,
  };
}
