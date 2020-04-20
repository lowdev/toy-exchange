import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToyCreationPage extends StatefulWidget {

  @override
  ToyCreationPageState createState() => ToyCreationPageState();
}

class ToyCreationPageState extends State<ToyCreationPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white30,
      body: createBody(context)
    );
  }

  AppBar createBar() {
    return new AppBar(
      elevation: 0,
      title: Center(
          child: Container(
              child: IconButton(
                icon: Icon(Icons.camera_alt, semanticLabel: "Add"),
                onPressed: () => {},
              )
          )
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.yellow]))
      )
    );
  }

  Widget createBody(BuildContext context) {
    return  Form(
        key: formKey,
        child: Column (
          children: <Widget>[
            createUploadImage(),
            createTitleInput(),
            createNumberOfPieceInput(),
            createDescriptionInput()
          ],
        )
    );
  }

  Widget createUploadImage() {
    return GestureDetector(
      onTap: () { print("Container was tapped"); },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(100.0),
            child: Column(
              children: <Widget>[
                Icon(Icons.camera_alt),
                Text("Ajouter une image")
              ]
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(width: 2.0, color: Colors.black)
            )
          )
        ]
      )
    );
  }

  Widget createTitleInput() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Entrez le titre'
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "A remplir";
        }
        return null;
      },
    );
  }

  Widget createNumberOfPieceInput() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Nombre de pieces'
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "A remplir";
        }
        return null;
      },
    );
  }

  Widget createDescriptionInput() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          labelText: 'Décrire'
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "A remplir";
        }
        return null;
      },
    );
  }
}