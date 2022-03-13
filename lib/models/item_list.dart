class ItemList {
  int? _length;
  late List<ItemModel> _item;
  List<ItemModel> get items => _item;
  int? get length => _length;

  ItemList({required length, required item}) {
    this._length = length;
    this._item = item;
  }

  ItemList.fromJson(Map<String, dynamic> json) {
    _length = json['length'];
    if (json['item'] != null) {
      _item = <ItemModel>[];
      json['item'].forEach((v) {
        _item.add(ItemModel.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['length'] = this.length;
  //   if (this.item != null) {
  //     data['item'] = this.item!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ItemModel {
  String? name;
  String? description;
  String? image;
  int? rating;
  double? price;
  int? comments;
  String? modified;

  ItemModel(
      {this.name,
      this.description,
      this.image,
      this.rating,
      this.price,
      this.comments,
      this.modified});

  ItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    price = json['price'];
    comments = json['comments'];
    modified = json['modified'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   data['image'] = this.image;
  //   data['rating'] = this.rating;
  //   data['price'] = this.price;
  //   data['comments'] = this.comments;
  //   data['modified'] = this.modified;
  //   return data;
  // }
}
