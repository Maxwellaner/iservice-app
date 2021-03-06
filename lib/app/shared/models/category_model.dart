class Category {
  int id;
  String name;
  String photoUrl;

  Category({this.id, this.name, this.photoUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}
