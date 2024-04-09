import 'dart:io';
import 'package:bloquear_pantalla_regreso/screen2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        print('estas por salir de la app');

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Estas seguro que quieres salir?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloquear boton de regreso'),
          elevation: 10,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return PopScope(
                        onPopInvoked: (didPop) {
                          DateTime now = DateTime.now();
                          var fecha = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
                          print('presiono regresar a pantalla $fecha');
                        },
                        canPop: false,
                        child: AlertDialog(
                          title: const Text("Mensaje"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            )
                          ],
                          content: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Solo se puede regresar con presionar boton ok'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text('Abrir mensaje'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PantallaHome()),
                    );
                  },
                  child: Text('Abrir nueva pantalla')),
            ],
          ),
        ),
      ),
    );
  }
}
