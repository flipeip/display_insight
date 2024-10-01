import 'package:snow_widget/widget/snow_widget.dart';

import 'widgets/logo_prestcontas.dart';
import 'widgets/relogio.dart';
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
    });
    if (fullscreen) {
      windowManager.setFullScreen(true);
    } else {
      windowManager.setFullScreen(false);
    }
  }

  void firstFullScreen() async {
    // Problema no Windows faz isso ser necessário
    await Future.delayed(const Duration(seconds: 1));
    toggleFullscreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MouseRegion(
        cursor: SystemMouseCursors.none,
        child: Scaffold(
          backgroundColor: tema().corFundo,
          body: GestureDetector(
            onDoubleTap: toggleFullscreen,
            child: Stack(
              children: [
                Fundo(),
                if (tema().neve)
                  Positioned.fill(
                    child: SnowWidget(
                      totalSnow: 500,
                      speed: 0.5,
                      isRunning: true,
                      snowColor: Colors.white,
                    ),
                  ),
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
      ),
    );
  }
}
