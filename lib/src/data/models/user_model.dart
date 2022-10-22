class UserModel {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? gender;
  String? dateOfBirth;
  int? weight;
  String? weigthUnit;
  int? height;
  String? heightUnit;
  String? createdAt;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.avatar,
      this.gender,
      this.dateOfBirth,
      this.weight,
      this.weigthUnit,
      this.height,
      this.heightUnit,
      this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    weight = json['weight'];
    weigthUnit = json['weigthUnit'];
    height = json['height'];
    heightUnit = json['heightUnit'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    data['weight'] = this.weight;
    data['weigthUnit'] = this.weigthUnit;
    data['height'] = this.height;
    data['heightUnit'] = this.heightUnit;
    data['createdAt'] = this.createdAt;
    return data;
  }
}