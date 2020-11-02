import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'home.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Future<void> createItem({String nome, String imagem, String idade}) async {
    final ParseObject newObject = ParseObject('perfil');
    newObject.set('name', nome);
    newObject.set('idade', idade);
    newObject.set('imagem', imagem);
    final ParseResponse apiResponse = await newObject.create();

    if (apiResponse.success && apiResponse.count > 0) {
      print(keyAppName + ': ' + apiResponse.result.toString());
    }
  }

  final _nameController = TextEditingController();

  final _idadeController = TextEditingController();

  final _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ));
          },
        ),
        title: Text('Novo produto'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              createItem(
                  idade: _idadeController.text,
                  nome: _nameController.text,
                  imagem: _linkController.text);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                controller: _nameController,
//onChanged: (newValue) => modelItems.nome = newValue,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.numberWithOptions(),
                textInputAction: TextInputAction.next,
                controller: _idadeController,
//onChanged: (newValue) => modelItems.preco = newValue,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Link da imagem'),
                      keyboardType: TextInputType.url,
                      controller: _linkController,
                      textInputAction: TextInputAction.done,
                      //  onChanged: (newValue) => modelItems.imagem = newValue,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _linkController.text.isEmpty
                        ? Text('Informe a URL')
                        : FittedBox(
                            child: Image.network(
                              _linkController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
