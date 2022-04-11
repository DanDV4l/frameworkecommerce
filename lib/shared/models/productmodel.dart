class Product {
  String _name;
  String _imgURL;
  double _price;
  List _tags = [];

  get name => _name;
  get imgURL => _imgURL;
  get price => _price;
  get tags => _tags;

  set name(var value) => _name = value;
  set imgURL(var value) => _imgURL = value;
  set price(var value) => _price = value;
  set tags(var value) => _tags = value;

  Product(this._name, this._imgURL, this._price, this._tags);
}
