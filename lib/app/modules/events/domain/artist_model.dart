class ArtistModel {
  int? id;
  String? description;
  String? spotfy;
  String? start;
  String? end;
  String? img;

  ArtistModel({this.id, this.description, this.spotfy, this.start, this.end, this.img});

  ArtistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    spotfy = json['spotfy'];
    start = json['start'];
    end = json['end'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['spotfy'] = this.spotfy;
    data['start'] = this.start;
    data['end'] = this.end;
    data['img'] = this.img;
    return data;
  }
}
