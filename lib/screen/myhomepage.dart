import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0;

  double _counter2 = 0;

  double _resultado = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _decrementCounter2() {
    setState(() {
      _counter2--;
    });
  }

  void _limpar(){setState(() { _resultado = 0 ;});}

  void _adicao(){setState(() {_resultado = _counter + _counter2;});}

  void _subtracao(){setState(() {_resultado = _counter - _counter2;});}

  void _multiplicacao(){setState(() {_resultado = _counter * _counter2;});}

  void _divisao(){setState(() {_resultado = _counter / _counter2;});}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [

            const Text('Contador'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: 25,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), backgroundColor: Colors.greenAccent),
                    onPressed: (){_incrementCounter();} ,
                    child: Text('Aumentar')),

                SizedBox(height: 20,),

                ElevatedButton(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), backgroundColor: Colors.redAccent),
                    onPressed: (){_decrementCounter();} ,
                    child: Text('Diminuir')
                )
              ],
            ),
            SizedBox(height: 80,),

            const Text('Contador'),
            Text(
              '$_counter2',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), elevation: 20 , shadowColor: Colors.green.withOpacity(1.0), backgroundColor: Colors.greenAccent),
                    onPressed: (){_incrementCounter2();} ,
                    child: Text('Aumentar')),

                SizedBox(height: 20,),

                ElevatedButton(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), elevation: 20 , shadowColor: Colors.green.withOpacity(1.0),backgroundColor: Colors.redAccent),
                    onPressed: (){_decrementCounter2();} ,
                    child: Text('Diminuir')
                )
              ],
            ),
            SizedBox(height: 20,),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), backgroundColor: Colors.greenAccent),
                    onPressed: (){_adicao();} ,
                    child: Text('+')),

                SizedBox(height: 20,),

                ElevatedButton(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), backgroundColor: Colors.redAccent),
                    onPressed: (){_subtracao();} ,
                    child: Text('-')),

                SizedBox(height: 20,),

                ElevatedButton(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), backgroundColor: Colors.blueAccent),
                    onPressed: (){_multiplicacao();} ,
                    child: Text('*')),

                SizedBox(height: 20,),

                ElevatedButton(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), backgroundColor: Colors.orangeAccent),
                    onPressed: (){_divisao();} ,
                    child: Text('/')),
              ],
            ),

            const Text('Resultado'),
            Text(
              '$_resultado',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: 25),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), backgroundColor: Colors.white70),
                    onPressed: (){_limpar();},
                    child: Text('Limpar Resultado')),
              ],
            ),
          ],
        ),
      ),

    );
  }

}