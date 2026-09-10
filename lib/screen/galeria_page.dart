

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menuDrawer.dart';
import 'myhomepage.dart';

class GaleriaPage extends StatefulWidget {

  const GaleriaPage({super.key,
    required this.modoEscuro,
    required this.aoAlterarTema,
  });

  final bool modoEscuro;

  final ValueChanged<bool> aoAlterarTema;

  @override
  State<GaleriaPage> createState() => _GaleriaPageState();
}

class _GaleriaPageState extends State<GaleriaPage>{
  final List<Map<String,String>> _lugares=[
    {
      'nome': 'Los caracoles',
      'local': 'Andes, Chile',
      'imagem': 'assets/images/Los caracoles.jpg',
      'descricao': 'Uma estrada inca na cordilheira dos andes com curvas em formato de caracol'
    },
    {
      'nome': 'Los caracoles',
      'local': 'Andes, Chile',
      'imagem': 'assets/images/Suecia.jpg',
      'descricao': 'Uma estrada inca na cordilheira dos andes com curvas em formato de caracol'
    },
    {
      'nome': 'Los caracoles',
      'local': 'Andes, Chile',
      'imagem': 'assets/images/Gato.jpg',
      'descricao': 'Uma estrada inca na cordilheira dos andes com curvas em formato de caracol'
    },
    {
      'nome': 'Los caracoles',
      'local': 'Andes, Chile',
      'imagem': 'assets/images/Escocia.jpg',
      'descricao': 'Uma estrada inca na cordilheira dos andes com curvas em formato de caracol'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Galeria"),
      ),
      drawer: MenuDrawer(),
      body: Padding(
          padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: _lugares.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
            ),

          itemBuilder: (context, index){
            final lugar = _lugares[index];
            return _builCardDestino(lugar);
          }
        ),
      )
    );
  }

  Widget _builCardDestino(Map<String, String> lugar) {
    final String nome = lugar['nome'] ?? '';
    final String local = lugar['local'] ?? '';
    final String imagem = lugar['imagem'] ?? '';

    //InkWell deixa o componente filho clicavel desenhando um efeito no mesmo.
    return InkWell(
      onTap: () => _abrirDestalhesDoLugar(lugar),
      child: Card(
        elevation:9,
        //Aqui usamos Stack porque queremos colocar o nome do lugar na frente da imagem e não embaixo dela.
        child: Stack(
          fit: StackFit.expand,
          children: [
            //ClipRRect recorta o componente filho, para que imagem fique com cantos arredondados.
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagem,
                fit: BoxFit.cover,

              ),
            ),
            //Posicao onde dentro do Stack este elemento vai ficar
            Positioned(
              left: 0, right: 0, bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    )
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nome,
                        style: TextStyle(
                          color: Colors.white
                        )
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.green,
                            size: 25,
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                              child: Text(
                                  local,
                                  style: TextStyle(
                                      color: Colors.white
                                  )
                              )
                          )
                        ],
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );

  }

  //abre bottonsheet (modal) com mais detalhes do destino escolhido
  void _abrirDestalhesDoLugar(Map<String, String> lugar){
    showModalBottomSheet(
        context: context,
        //Permite que o conteudo do bottomsheet ultrapasse a altura padrão, respeitando o tamanho da tela.
        isScrollControlled: true,
        builder: (context){
          return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Foto grande do lugar
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 450,
                    width: double.infinity,
                    child: Image.asset(lugar['imagem'] ?? '',
                      fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 16),
                Text(lugar['nome']??''),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16),
                    SizedBox(width: 6),
                    Text(lugar['local']??''),
                  ],
                ),
                SizedBox(height: 16),
                Text(lugar['descricao']??'')
              ],
            ),
          );
        }
    );
  }

}