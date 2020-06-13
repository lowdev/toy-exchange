import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/Toys.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchBarController<Toy> _searchBarController = SearchBarController();
  bool isReplay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar(
            searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
            headerPadding: EdgeInsets.symmetric(horizontal: 10),
            listPadding: EdgeInsets.symmetric(horizontal: 10),
            onSearch: search,
            searchBarController: _searchBarController,
            placeHolder: Text("placeholder"),
            cancellationWidget: Text("Cancel"),
            emptyWidget: Text("empty"),
            indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index.isEven ? 2 : 1),
            header: Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("sort"),
                  onPressed: () {
                    _searchBarController.sortList((Toy a, Toy b) {
                      return a.name.compareTo(b.name);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Desort"),
                  onPressed: () {
                    _searchBarController.removeSort();
                  },
                ),
                RaisedButton(
                  child: Text("Replay"),
                  onPressed: () {
                    isReplay = !isReplay;
                    _searchBarController.replayLastSearch();
                  },
                ),
              ],
            ),
          onCancelled: () {
            print("Cancelled triggered");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          onItemFound: (Toy toy, int index) {
              return ListTile(
                title: Text(toy.name),
              );
            },
            loader: Center(
              child: Text("loading..."),
            ),
          ),
        ),
    );
  }

  Future<List<Toy>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return Toys.allToys();
  }
}
