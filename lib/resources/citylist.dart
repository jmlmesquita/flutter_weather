import 'package:flutter/material.dart';

class ChangeCity extends StatelessWidget {
  final inputcitycontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Alterar cidade"),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/inverno.jpg",
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          ListView(
            children: <Widget>[
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Cidade"
                  ),
                  controller: inputcitycontroller,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: FlatButton(
                  onPressed: (){
                    Navigator.pop(context, {"city": inputcitycontroller.text});
                  },
                  textColor: Colors.white,
                  color: Colors.brown,
                  child: Text("Exibir Previsão"),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
