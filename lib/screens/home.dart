import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'add_product.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List list2;
  var dio = Dio();

  var url = "https://parseapi.back4app.com";

  var appId = 'vAARTZ5BX1YSDhfyRNZBc8xzkmJWoXgAxr1fy2Jj';

  var restApi = '3X6KMrpnInRUsI5YMGuG98uFdrNUBKG40covjJi4';

  var masterKey = '08KMBBk8r2umyChlvWtNjnjz6cn7fIEaNLYt8NCz';

  Future initData() async {
    await Parse().initialize(
      appId,
      url,
      clientKey: 'SxmaQ2XgtOotE1er3otUQQBYZCSwpVuwritQm2b8',
      appName: 'estudo_parse_server',
      masterKey: '08KMBBk8r2umyChlvWtNjnjz6cn7fIEaNLYt8NCz',
    );
  }

  Future getProducts() async {
    var parseResponde = await ParseObject("perfil").getAll();

    return list2 = parseResponde.result;

    print(list2);
  }

  @override
  void initState() {
    super.initState();
    initData();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.restore),
            onPressed: () {
              getProducts();
            },
          )
        ],
      ),
      body: Container(
        width: width,
        height: height,
        color: Colors.black,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: [
                  Text(/* list2 == null ? 'Texto vazio' :  */ list2[index]
                      ['name'])
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddProduct(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
