import 'package:aula_mobail/screen/myhomepage.dart';
import 'package:aula_mobail/screen/galeria_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aula01',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blueGrey),
      ),
       home: MyHomePage(title: 'Flutter aula 01', modoEscuro: true,
    aoAlterarTema: (bool value) {}),
    );
  }
}