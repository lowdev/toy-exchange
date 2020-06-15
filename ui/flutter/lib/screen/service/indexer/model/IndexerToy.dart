class IndexerToy {
  final String _id;
  final String _title;
  final String _description;
  final String _numberOfPieces;

  IndexerToy(this._id, this._title, this._description, this._numberOfPieces);

  String getId() {
    return _id;
  }

  String getTitle() {
    return _title;
  }

  String getDescription() {
    return _description;
  }

  String getNumberOfPieces() {
    return _numberOfPieces;
  }
}