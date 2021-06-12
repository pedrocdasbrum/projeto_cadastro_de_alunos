import 'package:flutter/material.dart';
import 'package:projeto_cadastro_de_alunos/screens/home/listOfStudents.dart';
import 'package:projeto_cadastro_de_alunos/screens/registers/form_register.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Cadastro de Alunos",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (BuildContext context) => ListOfStudents(),
        "/register": (BuildContext context) => FormRegister(),
      },
      initialRoute: "/",
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
    ),
  );
}
