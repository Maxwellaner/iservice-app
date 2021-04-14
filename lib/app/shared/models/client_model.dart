class Client {
  int id;
  String name;
  String birth;
  String cpf;
  String phone;
  String email;
  String photoUrl;

  Client(
      {this.id,
      this.name,
      this.birth,
      this.cpf,
      this.phone,
      this.email,
      this.photoUrl});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    birth = json['birth'];
    cpf = json['cpf'];
    phone = json['phone'];
    email = json['email'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['birth'] = this.birth;
    data['cpf'] = this.cpf;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}
