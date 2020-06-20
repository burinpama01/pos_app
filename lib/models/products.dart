import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static const ID = "id";
  static const TYPE = "type";
  static const NAME = "name";
  static const PRICE = "price";
  static const SERIALNUMBER = "serialNumber";
  static const QUANTITY = "quantity";
  static const SIZES = "sizes";
  static const SALEPRICE = "salePrice";
  static const IMAGES = "images";
  static const CREATEDAT = "createdAt";
  static const UPDATEDAT = "updatedAt";
  static const SUBINGREDIENTS = "subIngredients";

  Product();

  String _id;
  String _name;
  String _type;
  String _image;
  int _serialNumber;
  String _price;
  int _quantity;
  List _sizes;
  List _subIngredients;
  String _salePrice;
  Timestamp _createdAt;
  Timestamp _updatedAt;

//  getters
  String get name => _name;
  String get id => _id;
  String get type => _type;
  String get images => _image;
  String get price => _price;
  int get quantity => _quantity;
  List get sizes => _sizes;
  List get subIngredients => _subIngredients;
  String get salePrice => _salePrice;
  int get serialNumber => _serialNumber;
  Timestamp get createdAt => _createdAt;
  Timestamp get updatedAt => _updatedAt;
//  named constructure
  Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data;
    _name = data[NAME];
    _id = data[NAME];
    _type = data[TYPE];
    _price = data[PRICE];
    _quantity = data[QUANTITY];
    _salePrice = data[SALEPRICE];
    _serialNumber = data[SERIALNUMBER];
    _sizes = data[SIZES];
    _subIngredients = data[SUBINGREDIENTS];
    _image = data[IMAGES];
    _createdAt = data[CREATEDAT];
    _updatedAt = data[UPDATEDAT];
  }

  Product.fromMap(Map<String, dynamic> data) {
    _name = data[NAME];
    _id = data[NAME];
    _type = data[TYPE];
    _price = data[PRICE];
    _quantity = data[QUANTITY];
    _salePrice = data[SALEPRICE];
    _serialNumber = data[SERIALNUMBER];
    _subIngredients = data[SUBINGREDIENTS];
    _sizes = data[SIZES];
    _image = data[IMAGES];
    _createdAt = data[CREATEDAT];
    _updatedAt = data[UPDATEDAT];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'price': price,
      'serialNumber': serialNumber,
      'quantity': quantity,
      'sizes': sizes,
      'subIngredients': subIngredients,
      'salePrice': salePrice,
      'images': images,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
