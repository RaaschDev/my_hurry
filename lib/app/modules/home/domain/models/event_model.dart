class EventModel {
  int? id;
  String? description;
  String? email;
  String? date;
  String? start;
  String? end;
  int? eventType;
  int? category;
  String? image;
  String? advertsing;
  String? street;
  int? number;
  String? complement;
  String? district;
  String? city;
  String? state;
  String? zip;

  EventModel({this.id, this.description, this.email, this.date, this.start, this.end, this.eventType, this.category, this.image, this.advertsing, this.street, this.number, this.complement, this.district, this.city, this.state, this.zip});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    email = json['email'];
    date = json['date'];
    start = json['start'];
    end = json['end'];
    eventType = json['event_type'];
    category = json['category'];
    image = json['image'];
    advertsing = json['advertsing'];
    street = json['street'];
    number = json['number'];
    complement = json['complement'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['email'] = this.email;
    data['date'] = this.date;
    data['start'] = this.start;
    data['end'] = this.end;
    data['event_type'] = this.eventType;
    data['category'] = this.category;
    data['image'] = this.image;
    data['advertsing'] = this.advertsing;
    data['street'] = this.street;
    data['number'] = this.number;
    data['complement'] = this.complement;
    data['district'] = this.district;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    return data;
  }
}
