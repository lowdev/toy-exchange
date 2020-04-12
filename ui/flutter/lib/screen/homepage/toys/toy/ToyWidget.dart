import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toyexchange/screen/homepage/toys/toy/ToyDetailPage.dart';
import 'model/Toy.dart';

class ToyWidget extends StatelessWidget {

  final Toy toy;

  ToyWidget({this.toy}) {}

  @override
  Widget build(BuildContext context) {
      return new Card(
          child: new Column(
            children: <Widget>[
              new ListTile(
                leading: new Image.network(
                  toy.images.first,
                  fit: BoxFit.cover,
                  width: 100.0,
                ),
                title: new Text(
                  toy.name,
                  style: new TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                subtitle: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(this.toy.numberOfPieces.toString() + " pieces",
                          style: new TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal
                          )
                      ),
                    ]
                ),
                onLongPress: () => showSnackBar(context, toy),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ToyDetailWidget(toy)))
              )
            ],
          ));
  }

  showSnackBar(BuildContext context, Toy item) {
    final SnackBar snackBar = new SnackBar(
      content: new Text("${item.name}"),
      backgroundColor: Colors.amber,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}