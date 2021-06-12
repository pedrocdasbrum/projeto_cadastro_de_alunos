import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            //Listagem
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/",
                  (route) => false,
                );
              },
              icon: Icon(
                Icons.group,
              ),
              label: Text(
                "Listar Alunos",
              ),
            ),
            //Cadastro
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/register",
                  (route) => false,
                );
              },
              icon: Icon(
                Icons.add,
              ),
              label: Text(
                "Cadastrar Alunos",
              ),
            ),
            //Edição
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
              ),
              label: Text(
                "Editar Alunos",
              ),
            ),
            //Deleção
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
              ),
              label: Text(
                "Deletar Alunos",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
