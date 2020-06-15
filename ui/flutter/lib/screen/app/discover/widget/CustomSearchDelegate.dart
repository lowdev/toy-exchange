import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/discover/widget/toy/ToyPage.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/ToysBloc.dart';
import 'package:toyexchange/screen/app/model/adapter/ToyRepositoryFactory.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';

class CustomSearchDelegate extends SearchDelegate {

  ToyRepository _toyRepository = ToyRepositoryFactory.getToyRepository();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search Something !!!",
            ),
          )
        ],
      );
    }

    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    ToysBloc toysBloc = new ToysBloc();
    toysBloc.search(query);

    return StreamBuilder(
          stream: toysBloc.allToys,
          builder: (context, AsyncSnapshot<List<Toy>> snapshot) {
            if (!snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            if (snapshot.data.length == 0) {
              return Column(
                children: <Widget>[
                  Text(
                    "No Results Found.",
                  ),
                ],
              );
            }

            var results = snapshot.data;
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              itemCount: results.length,
              itemBuilder: (context, index) {
                Toy result = results[index];
                return ListTile(
                  title: Text(result.name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                  subtitle: Text(result.numberOfPieces.toString() + " pieces"),
                  onTap: () {
                    _toyRepository.findById(result.id)
                        .then((toy) => Navigator.push(context, MaterialPageRoute(builder: (context) => ToyPage(toy))));
                  }
                );
              },
            );
          },
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}