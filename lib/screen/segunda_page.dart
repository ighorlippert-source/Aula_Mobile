

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menuDrawer.dart';
import 'myhomepage.dart';

class SegundaPage extends StatefulWidget {
  @override
  State<SegundaPage> createState() => _SegundaPageState();
}

class _SegundaPageState extends State<SegundaPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("Galaria"),
      ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
          child:
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmXHtggxB_8tAqDuz37zi5_dUEfuGzikoA3H0pK1nuwQ&s=10',),


                Image.asset('assets/images/Gato.jpg')
              ],
            ),
          )

      ),
    );
  }

}