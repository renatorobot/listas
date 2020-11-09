import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){

    for(int i=0; i<=10; i++){

      Map<String, dynamic> item = Map(); 
      item["titulo"] = "${i} What is Lorem Ipsum?";
      item["descricao"] = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
      _itens.add(item); 
    }

  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(title: Text("Listas"), backgroundColor: Colors.black,),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice){
              return ListTile(
                onTap: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text(_itens[indice]["titulo"]),
                      titlePadding: EdgeInsets.all(20),
                      content: Text(_itens[indice]["descricao"]),
                      actions: <Widget>[
                        FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Sim")),
                        FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Não"))
                      ],
                    );
                  });
                },
                //onLongPress: (){

                //},
                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            }
          ),
      ),
    );
  }
}