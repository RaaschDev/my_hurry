class TiketModel {
  TiketModel({
    required this.id,
    required this.description,
    required this.batch,
    required this.price,
  });
  late final int id;
  late final String description;
  late final String batch;
  late final String price;

  TiketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    batch = json['batch'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['batch'] = batch;
    _data['price'] = price;
    return _data;
  }
}
