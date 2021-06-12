import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:projeto_cadastro_de_alunos/DAO/studentDAO.dart';
import 'package:projeto_cadastro_de_alunos/models/student.dart';
import 'package:projeto_cadastro_de_alunos/shared/menu.dart';

class FormRegister extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro de Alunos",
        ),
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              //Campo para o nome
              TextField(
                decoration: InputDecoration(
                  labelText: "Nome",
                ),
                keyboardType: TextInputType.name,
                controller: nameController,
              ),
              SizedBox(
                height: 10,
              ),
              //Campo para o e-mail
              TextField(
                decoration: InputDecoration(
                  labelText: "E-mai",
                ),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  saveRegister(context);
                },
                child: Text(
                  "Cadastrar",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveRegister(BuildContext mainContext) async {
    String name = nameController.text;
    String email = emailController.text;
    String message;

    if (!EmailValidator.validate(email)) {
      showDialog(
        context: mainContext,
        builder: (context) => AlertDialog(
          title: Text(
            "Mensagem do sistema",
          ),
          content: Text(
            "E-mail inválido",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
              ),
            ),
          ],
        ),
      );
    } else {
      Student student = Student(
        name: name,
        email: email,
      );
      int result = await StudentDAO.insertRecord("students", student.toMap());

      if (result != 0) {
        message = "Aluno(a) $name cadastrado(a) com sucesso!";
      } else {
        message = "Aluno(a) $name não pôde ser cadastrado cadastrado(a)!";
      }

      showDialog(
        context: mainContext,
        builder: (context) => AlertDialog(
          title: Text(
            "Mensagem do sistema",
          ),
          content: Text(
            message,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
              ),
            ),
          ],
        ),
      );
    }
  }
}
