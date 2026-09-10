import 'package:aula_mobail/screen/formulario_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/myhomepage.dart';
import '../screen/galeria_page.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Home"),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:(context) =>
                      MyHomePage(title: "Navegou", modoEscuro: true, aoAlterarTema: (bool value) {  },) ));
            },
          ),
          ListTile(
            title: Text("Galeria"),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:(context) =>
                      GaleriaPage(modoEscuro: true, aoAlterarTema: (bool value) {  },) ));
            },
          ),
          ListTile(
            title: Text("Formulario"),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:(context) =>
                      FormularioPage(modoEscuro: true, aoAlterarTema: (bool value) {  },) ));
            },
          ),
        ],
      ),
    );
  }

}