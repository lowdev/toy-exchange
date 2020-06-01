import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';
import 'package:toyexchange/screen/app/profile/selling/toy/MyToyPage.dart';
import 'package:toyexchange/screen/app/toywidget/GridToyWidget.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/adapter/ToyRepositoryFactory.dart';

class SellingPage extends StatefulWidget {

  ToyRepository toyRepository = ToyRepositoryFactory.getToyRepository();

  Future<List<Toy>> futureToys;

  @override
  SellingPageState createState() => SellingPageState();
}

class SellingPageState extends State<SellingPage> {

  ToyRepository toyRepository = ToyRepositoryFactory.getToyRepository();
  Future<List<Toy>> futureToys;

  @override
  void initState() {
    super.initState();
    futureToys = toyRepository.findAll();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Toy>>(
        future: futureToys,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridToyWidget(snapshot.data, onclickCallBack );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return new Center(
              child: CircularProgressIndicator()
          );
        }
    );
  }

  final Function onclickCallBack = (BuildContext context, Toy toy) =>
      () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  new MyToyPage(toy)));
}