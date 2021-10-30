import 'package:flutter/material.dart';

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text("NOME DO TOPO DA PAGINA", style: TextStyle(color: Colors.black, fontSize: 25),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black,), onPressed: () {  },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black,), onPressed: () {  },
          )
        ],
      ),
    );
  }
}
