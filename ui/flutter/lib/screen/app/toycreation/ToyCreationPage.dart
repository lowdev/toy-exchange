import 'package:flutter/material.dart';
import 'package:image_form_field_x/image_form_field_x.dart';
import 'dart:io';
import 'upload_button.dart';

class ToyCreationPage extends StatefulWidget {

  List<String> existingImages = [];

  @override
  ToyCreationPageState createState() => ToyCreationPageState();
}

class ToyCreationPageState extends State<ToyCreationPage> {
  final formKey = GlobalKey<FormState>();
  List<ImageInputAdapter> _images;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white30,
      body: createBody(context)
    );
  }

  AppBar createBar() {
    return new AppBar(
      elevation: 0,
      title: Center(
          child: Container(
              child: IconButton(
                icon: Icon(Icons.camera_alt, semanticLabel: "Add"),
                onPressed: () => {},
              )
          )
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.yellow]))
      )
    );
  }

  Widget createBody(BuildContext context) {
    return  Form(
        key: formKey,
        child: Column (
          children: <Widget>[
            new Card(child: createUploadImage()),
            new Card(child:
              Column(
                children: [
                  createTitleInput(),
                  createDescriptionInput()
                ]
              )
            ),
            new Card(child: createNumberOfPieceInput())
          ],
        )
    );
  }

  Widget createUploadImage() {
    final bool shouldAllowMultiple = true;
    return ImageFormField<ImageInputAdapter>(
        maxCount: 1,
        shouldAllowMultiple: shouldAllowMultiple,
        onSaved: (val) => _images = val,
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