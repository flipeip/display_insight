import 'dart:ui';

Color corPadrao() {
  return switch (DateTime.now().month) {
    DateTime.november => const Color(0xFF09379B),
    DateTime.october => const Color(0xFFB63F8E),
    _ => const Color(0xFF730B0E),
  };
}

Color corSecundaria() {
  return switch (DateTime.now().month) {
    DateTime.november => const Color(0xFF1760B4),
    DateTime.october => const Color(0xFFD15499),
    _ => const Color(0xFF8D1317),
  };
}

Color corTexto() {
  return switch (DateTime.now().month) {
    _ => const Color(0xFFFFFFFF),
  };
}
