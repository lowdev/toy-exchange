import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'ToyDescription.dart';

class ToyDetailPage extends StatelessWidget {

  final Toy _toy;
  final List<Widget> actions;

  ToyDetailPage(this._toy, this.actions);

  @override
  Widget build(BuildContext context) {
    return createBody();
  }

  Widget createBody() {
    return  CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          actions: this.actions,
          floating: true,
          flexibleSpace: _createImagePart(),
          expandedHeight: 300,
          backgroundColor: Colors.white12,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        // Next, create a SliverList
        SliverList(
          // Use a delegate to build items as they're scrolled on screen.
          delegate: SliverChildListDelegate(
              [
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new ToyDescription(_toy.name, _toy.description)
                )
              ]
          ),
        ),
      ],
    );
  }

  Widget _createImagePart() {
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 1.0,
          enlargeCenterPage: false
      ),
      items: _toy.images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Center(
                child: new Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                )
            );
          },
        );
      }).toList(),
    );
  }
}