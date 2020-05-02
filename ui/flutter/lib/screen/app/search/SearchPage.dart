import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/Toys.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar(
            onSearch: search,
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
      ),
    );
  }

  Future<List<Toy>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return Toys.allToys();
  }
}