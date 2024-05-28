import 'package:display/widgets/logo_prestcontas.dart';
import 'package:display/widgets/relogio.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'tema.dart';
import 'widgets/fundo.dart';
import 'widgets/logo_full.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool fullscreen = false;

  void toggleFullscreen() {
    setState(() {
      fullscreen = !fullscreen;
      WindowManager.instance.setFullScreen(fullscreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: corPadrao,
        body: GestureDetector(
          onDoubleTap: toggleFullscreen,
          child: const Stack(
            children: [
              Fundo(),
              LogoFull(),
              Relogio(),
              Positioned(
                right: 0.0,
                child: LogoPrestcontas(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
