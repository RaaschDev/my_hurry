class ConsumableModel {
  int? id;
  String? description;
  String? consumableType;
  String? price;
  String? img;

  ConsumableModel({this.id, this.description, this.consumableType, this.price, this.img});

  ConsumableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    consumableType = json['consumable_type'];
    price = json['price'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['consumable_type'] = this.consumableType;
    data['price'] = this.price;
    data['img'] = this.img;
    return data;
  }
}
