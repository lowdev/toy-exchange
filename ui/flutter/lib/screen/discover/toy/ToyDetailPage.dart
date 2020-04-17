import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'model/Toy.dart';
import 'ToyDescription.dart';

class ToyDetailPage extends StatefulWidget {

  final Toy toy;

  ToyDetailPage(this.toy) { }

  @override
  ToyDetailPageState createState() => ToyDetailPageState();
}

class ToyDetailPageState extends State<ToyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return getScaffold();
  }

  Widget getScaffold() {
    return new Scaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      appBar: createBar(),
      body: createBody(context),
      bottomNavigationBar: createBottomNavigationBar(),
    );
  }

  AppBar createBar() {
    return new AppBar(
      title: new Text(
        widget.toy.name,
        style: new TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87),
      ),
    );
  }

  Widget createBody(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
            new Card(
                child: createImagePart(context)
            ),
            Expanded(
                child: new Card(
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new ToyDescription(widget.toy.description)
                    )
                )
            )
        ]
      )
    );
  }

  Widget createImagePart(BuildContext context) {
    return CarouselSlider(
      items: widget.toy.images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber
                ),
                child: new Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 100.0,
                )
            );
          },
        );
      }).toList(),
    );
  }

  Widget createDescriptionPart(BuildContext context) {
    return new ListTile(
      title: Text("Description"),
      subtitle: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text("country",
                style: new TextStyle(fontWeight: FontWeight.normal)),
            new Text('Population: ',
                style: new TextStyle( fontWeight: FontWeight.normal)),
          ]
      ),
    );
  }

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          title: Text("Description"),
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          title: Text("Ask for Exchange"),
          icon: Icon(Icons.add_box),
        ),
      ],
      onTap: (int index){
      },
    );
  }
}