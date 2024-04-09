import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PantallaHome extends StatefulWidget {
  const PantallaHome({super.key});

  @override
  State<PantallaHome> createState() => PantallaHomeState();
}

class PantallaHomeState extends State<PantallaHome> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        DateTime now = DateTime.now();
        var fecha = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
        print('desde pantalla 2, bloqueado regreso $fecha');
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenido'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              //Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Esta pantalla esta bloqueada, solo se puede regresar con el boton',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
