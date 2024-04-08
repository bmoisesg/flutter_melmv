import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  bool flagSecure = false;
  @override
  void initState() {
    fntPreventCapture(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No tomar capturas'),
        elevation: 10,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: flagSecure,
              onChanged: (value) {
                setState(() {
                  flagSecure = value;
                  fntPreventCapture(flagSecure);
                });
              },
            ),
            const Text('Permitir capturas')
          ],
        ),
      ),
    );
  }

  fntPreventCapture(bool value) async {
    if (value) {
      await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    } else {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  }
}
