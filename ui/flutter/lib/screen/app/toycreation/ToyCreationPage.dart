import 'package:flutter/material.dart';
import 'package:image_form_field_x/image_form_field_x.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/adapter/ToyRepositoryFactory.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';
import 'dart:io';
import 'upload_button.dart';


class ToyCreationPage extends StatefulWidget {

  final ToyRepository toyRepository = ToyRepositoryFactory.getToyRepository();
  final List<String> existingImages = [];

  @override
  ToyCreationPageState createState() => ToyCreationPageState();
}

class ToyCreationPageState extends State<ToyCreationPage> {
  final _formKey = GlobalKey<FormState>();
  List<ImageInputAdapter> _images;
  Toy toy = Toy();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white30,
        appBar: createBar(),
        body: createBody(context),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 4.0,
          icon: const Icon(Icons.add),
          label: const Text('Ajout puzzle'),
          onPressed: () {
            _formKey.currentState.save();
            widget.toyRepository.save(this.toy);
            Navigator.pop(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  AppBar createBar() {
    return AppBar();
  }

  Widget createBody(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column (
          children: <Widget>[
            createUploadImage(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
                Column(
                  children: [
                    createTitleInput(),
                    createDescriptionInput()
                  ]
                )
            ),
            new Padding(
              padding: EdgeInsets.all(16.0),
              child: createNumberOfPieceInput()
            ),
          ],
        )
    );
  }

  Widget createUploadImage() {
    final bool shouldAllowMultiple = true;
    return ImageFormField<ImageInputAdapter>(
        maxCount: 1,
        shouldAllowMultiple: shouldAllowMultiple,
        onSaved: (val) => this.toy.images = ["https://fr.zenit.org/wp-content/uploads/2018/05/no-image-icon-1536x1536.png"],
        initialValue: widget.existingImages.map((i) => ImageInputAdapter(url: i)).toList().cast<ImageInputAdapter>(),
        initializeFileAsImage: (file) => ImageInputAdapter(file: file),
        buttonBuilder: (_, count) =>
            PhotoUploadButton(
                count: count,
                shouldAllowMultiple: shouldAllowMultiple
            ),
        previewImageBuilder: (_, image) => image.widgetize()
    );
  }

  Widget createUploadImageCustom() {
    return GestureDetector(
      onTap: () { print("Container was tapped"); },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(100.0),
            child: Column(
              children: <Widget>[
                Icon(Icons.camera_alt),
                Text("Ajouter une image")
              ]
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(width: 2.0, color: Colors.black)
            )
          )
        ]
      )
    );
  }

  Widget createTitleInput() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Nom du puzzle'
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "A remplir";
        }
        return null;
      },
      onSaved: (String value) {
        toy.name = value;
      },
    );
  }

  Widget createNumberOfPieceInput() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Nombre de pieces'
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "A remplir";
        }
        return null;
      },
      onSaved: (String value) {
        toy.numberOfPieces = int.parse(value);
      },
    );
  }

  Widget createDescriptionInput() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          labelText: 'Décrire'
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "A remplir";
        }
        return null;
      },
      onSaved: (String value) {
        toy.description = value;
      },
    );
  }
}

class ImageInputAdapter {
  /// Initialize from either a URL or a file, but not both.
  ImageInputAdapter({
    this.file,
    this.url
  }) : assert(file != null || url != null), assert(file != null && url == null), assert(file == null && url != null);

  /// An image file
  final File file;
  /// A direct link to the remote image
  final String url;

  /// Render the image from a file or from a remote source.
  Widget widgetize() {
    if (file != null) {
      return Image.file(file);
    } else {
      return FadeInImage(
        image: NetworkImage(url),
        placeholder: AssetImage("assets/images/placeholder.png"),
        fit: BoxFit.contain,
      );
    }
  }
}