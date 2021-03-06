import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/discover/widget/CustomSearchDelegate.dart';
import 'package:toyexchange/screen/app/discover/widget/toy/ToyPage.dart';
import 'package:toyexchange/screen/app/model/adapter/ToyRepositoryFactory.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';
import 'package:toyexchange/screen/utils/Screens.dart';
import '../toywidget/GridToyWidget.dart';
import 'widget/ListToyWidget.dart';
import '../model/Toy.dart';
import 'model/LayoutChoice.dart';

class DiscoverPage extends StatefulWidget {
  @override
  DiscoverPageState createState() => DiscoverPageState();
}

class DiscoverPageState extends State<DiscoverPage> {
  LayoutChoice selectedLayoutChoice = LayoutChoice.LIST_VIEW;

  void selectLayout(LayoutChoice choice) {
    setState(() {
      selectedLayoutChoice = choice;
    });
  }

  ToyRepository toyRepository = ToyRepositoryFactory.getToyRepository();
  Future<List<Toy>> futureToys;

  @override
  void initState() {
    super.initState();
    futureToys = toyRepository.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: getBar(),
      body: new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: FutureBuilder<List<Toy>>(
          future: futureToys,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return getBody(context, snapshot.data);
            }
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
  
           return new Center(
              child: CircularProgressIndicator()
           );
          }
        )
      )
    );
  }

  AppBar getBar() {
    return new AppBar(
        title: new Text(
            "Discover",
            style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87)
        ),
        actions: getActions()
    );
  }

  List<Widget> getActions() {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          );
        },
      ),
      PopupMenuButton<LayoutChoice>(
          icon: Icon(Icons.tune),
          onSelected: selectLayout,
          itemBuilder: (BuildContext context) {
            return LayoutChoice.allLayoutChoices().map<PopupMenuEntry<LayoutChoice>>((LayoutChoice choice) {
              return PopupMenuItem<LayoutChoice>(
                  value: choice,
                  child: ListTile(
                      leading: Icon(choice.icon),
                      title: Text(choice.title)
                  )
              );
            }).toList();
          }
      )
    ];
  }

  Widget getBody(BuildContext context, List<Toy> toys) {
    if (!Screens.isSmartphoneScreen(context)) {
      return GridToyWidget(toys, onclickCallBack);
    }

    if (this.selectedLayoutChoice == LayoutChoice.LIST_VIEW) {
      return ListToyWidget(toys: toys);
    }

    return GridToyWidget(toys, onclickCallBack);
  }

  final Function onclickCallBack = (BuildContext context, Toy toy) =>
    () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  new ToyPage(toy)));
}