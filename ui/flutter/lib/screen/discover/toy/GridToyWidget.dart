import 'package:flutter/material.dart';
import 'package:toyexchange/screen/discover/toy/ToyDetailPage.dart';
import 'model/Toy.dart';

class GridToyWidget extends StatelessWidget {

  final List<Toy> toys;

  GridToyWidget({this.toys}) {}

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(this.toys.length, (index) {
        return Center(
          child: buildToyWidget(context, this.toys[index]),
        );
      }),
    );
  }

  Widget buildToyWidget(BuildContext context, Toy toy) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new ToyDetailPage(toy)));
      },
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _backImage(toy.images.first),
            Container(
              padding: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 6.0),
              child: _cardBottom(toy),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backImage(String trailerImage) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Image.network(
        trailerImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _cardBottom(Toy toy) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 5.0,
          width: double.infinity,
        ),
        Text(
          toy.name,
          style: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          "Nombre de pieces : " + toy.numberOfPieces.toString(),
          style: TextStyle(color: Colors.grey[500]),
        ),
      ],
    );
  }

  Widget _showtimeItem(name, value) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style:
          TextStyle(color: Colors.grey[500]),
        ),
        SizedBox(height: 2.0),
        Text(
          value,
          style:
          TextStyle(color: Colors.grey[900]),
        )
      ],
    );
  }
}