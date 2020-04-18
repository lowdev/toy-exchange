import 'package:flutter/material.dart';
import 'ToyDetailPage.dart';
import '../model/Toy.dart';

class ListToyWidget extends StatelessWidget {

  final List<Toy> toys;

  ListToyWidget({this.toys}) {}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: toys.length,
      itemBuilder: (context, index) => buildToyWidget(context, toys[index]),
      padding: EdgeInsets.all(0.0),
    );
  }

  Widget buildToyWidget(BuildContext context, Toy toy) {
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
                    new Text(toy.numberOfPieces.toString() + " pieces",
                        style: new TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal
                        )
                    ),
                  ]
              ),
              onLongPress: () => showSnackBar(context, toy),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ToyDetailPage(toy)))
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