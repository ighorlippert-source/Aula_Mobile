import 'dart:convert';

import 'package:aula_mobail/components/ElavateButtonComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menuDrawer.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key,
    required this.modoEscuro,
    required this.aoAlterarTema,
  });

  final bool modoEscuro;

  final ValueChanged<bool> aoAlterarTema;
  @override
  State<FormularioPage> createState() => _FormularioPage();
}


class _FormularioPage extends State<FormularioPage>{
  final _formKey = GlobalKey<FormState>();


  //controllers para os campos de input do formulario

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  String _jsonOutput = '';

  //função converte para JSON
  void _gerarJson(){
    if(_formKey.currentState?.validate() ?? false){
      final Map<String, dynamic> data ={
        'nome': _nomeController.text,
        'email': _emailController.text,
        'idade': _idadeController.text,
      };
      setState(() {
        _jsonOutput = jsonEncode(data);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Formulario"),
      ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
          child:
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                //formulario
                Form(
                  key: _formKey,
                  child: Column(
                     children: [
                       TextFormField(
                        controller: _nomeController,
                         decoration: InputDecoration(labelText: 'Nome'),
                         validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Por favor, Escreva o nome certo ';
                          }
                          return null;
                         },
                       ),

                       SizedBox(height: 20,),

                       TextFormField(
                         controller: _emailController,
                         decoration: InputDecoration(labelText: 'Email'),
                         keyboardType: TextInputType.emailAddress,
                         validator: (value){
                           if(value == null || value.isEmpty){
                             return 'Por favor, Escreva o email certo ';
                           }
                           return null;
                         },
                       ),
                       SizedBox(height: 20,),


                       TextFormField(
                         controller: _idadeController,
                         decoration: InputDecoration(labelText: 'Idade'),
                           keyboardType: TextInputType.number,
                         validator: (value){
                           if(value == null || value.isEmpty){
                             return 'Por favor, Escreva a idade certo ';
                           }
                           return null;
                         },
                       ),
                       SizedBox(height: 20,),
                       Elavatebuttoncomponent(label: "Salvar",
                           onPressed: _gerarJson,
                           cor: Colors.green
                       ),
                       SizedBox(height: 20,),
                       Text(_jsonOutput)

                     ],
                  )
                )
              ],
            ),
          )

      ),
    );
  }

}