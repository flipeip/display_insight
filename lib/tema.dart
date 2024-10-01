import 'dart:ui';

class Tema {
  final Color corFundo;
  final Color corPrimaria;
  final Color corTexto;
  final bool neve;

  const Tema(
    this.corPrimaria,
    this.corFundo, {
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
final temaNatal = temaPadrao.copyWith(neve: true);

Tema tema() {
  return switch (DateTime.now().month) {
    DateTime.november => temaNovembroAzul,
    DateTime.october => temaOutubroRosa,
    DateTime.december => temaNatal,
    _ => temaPadrao,
  };
}
