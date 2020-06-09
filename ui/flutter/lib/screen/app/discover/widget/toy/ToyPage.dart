import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/toywidget/toydetail/ToyDescription.dart';
import 'package:toyexchange/screen/app/toywidget/toydetail/ToyDetailPage.dart';
import 'askforexchange/AskForExchangePage.dart';
import 'model/ToyPageChoice.dart';

class ToyPage extends StatefulWidget {

  final List<ToyPageChoice> toyPageChoices = ToyPageChoice.allToyPageChoices();

  final Toy toy;

  ToyPage(this.toy);

  @override
  ToyPageState createState() => ToyPageState();
}

class ToyPageState extends State<ToyPage> {
  int selectedPageChoice = 0;

  void selectPage(int pageChoice) {
    setState(() {
      selectedPageChoice = pageChoice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white30,
      body: createBody(),
      bottomNavigationBar: createBottomNavigationBar(),
    );
  }

  Widget createBody() {
    return  CustomScrollView(
      slivers: <Widget>[
        // Add the app bar to the CustomScrollView.
        SliverAppBar(
          // Allows the user to reveal the app bar if they begin scrolling
          // back up the list of items.
          floating: true,
          // Display a placeholder widget to visualize the shrinking size.
          flexibleSpace: _createImagePart(),
          // Make the initial height of the SliverAppBar larger than normal.
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
                  child: new ToyDescription(widget.toy.name, widget.toy.description)
              )
            ]
          ),
        ),
      ],
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

  Widget _createImagePart() {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        enlargeCenterPage: false
      ),
      items: widget.toy.images.map((image) {
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

  /*Widget createBody(BuildContext context) {
    if (ToyPageChoice.DETAIL_PAGE == getCurrentToyPageChoice()) {
      return new ToyDetailPage(widget.toy);
    }
    
    return new AskForExchangePage();
  }*/

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedPageChoice,
      onTap: selectPage,
      items: widget.toyPageChoices.map<BottomNavigationBarItem>(
          (ToyPageChoice pageChoice) {
        return BottomNavigationBarItem(
          title: Text(pageChoice.title),
          icon: Icon(pageChoice.icon),
        );
      }).toList()
    );
  }

  ToyPageChoice getCurrentToyPageChoice() {
    return widget.toyPageChoices[selectedPageChoice];
  }
}