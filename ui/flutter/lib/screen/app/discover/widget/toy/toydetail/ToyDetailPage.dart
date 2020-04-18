import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:toyexchange/screen/app/discover/model/Toy.dart';
import 'ToyDescription.dart';

class ToyDetailPage extends StatelessWidget {

  final Toy toy;

  ToyDetailPage(this.toy) { }

  @override
  Widget build(BuildContext context) {
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
                          child: new ToyDescription(this.toy.description)
                      )
                  )
              )
            ]
        )
    );
  }

  Widget createImagePart(BuildContext context) {
    return CarouselSlider(
      items: this.toy.images.map((image) {
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
}