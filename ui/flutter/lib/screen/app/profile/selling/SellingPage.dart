import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';
import 'package:toyexchange/screen/app/profile/selling/toy/MyToyPage.dart';
import 'package:toyexchange/screen/app/toywidget/GridToyWidget.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/adapter/ToyRepositoryFactory.dart';

class SellingPage extends StatefulWidget {

  final ToyRepository toyRepository = ToyRepositoryFactory.getToyRepository();

  @override
  SellingPageState createState() => SellingPageState();
}

class SellingPageState extends State<SellingPage> {

  Future<List<Toy>> futureToys;

  @override
  void initState() {
    super.initState();
    futureToys = widget.toyRepository.findAll();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Toy>>(
        future: futureToys,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridToyWidget(snapshot.data, onclickCallBack);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return new Center(
              child: CircularProgressIndicator()
          );
        }
    );
  }

  Function onclickCallBack(BuildContext context, Toy toy) {
     return () => Navigator.push(context, MaterialPageRoute(builder: (context) => new MyToyPage(toy)))
        .then((shouldRefresh) {
          if (shouldRefresh) {
            refresh();
          }
        });
  }

  void refresh() {
    setState(() {
      futureToys = widget.toyRepository.findAll();
    });
  }
}