import 'package:firebase_database/firebase_database.dart';

class Note {
  String _id;
  String _a_title;
  String _image_url;
  String _a_price;
  String _f_price;
  String _a_link;
  String _f_link;

  Note(this._id, this._a_title, this._image_url, this._a_price, this._a_link, this._f_link, this._f_price);

  Note.map(dynamic obj) {
    this._id = obj['id'];
    this._a_title = obj['a_title'];
    this._image_url = obj['image_url'];
    this._a_price = obj['a_price'];
    this._f_price = obj['f_price'];
    this._f_link = obj['f_link'];
    this._a_link = obj['a_link'];
  }

  String get id => _id;
  String get a_title => _a_title;
  String get image_url => _image_url;
  String get a_price => _a_price;
  String get f_price => _f_price;
  String get f_link => _f_link;
  String get a_link => _a_link;

  Note.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _a_title = snapshot.value['a_title'];
    _image_url = snapshot.value['image_url'];
    _a_price =snapshot.value['a_price'];
    _f_price = snapshot.value['f_price'];
    _a_link = snapshot.value['a_link'];
    _f_link = snapshot.value['f_link'];
  }
}