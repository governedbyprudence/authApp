class UserModel{
  String email,token;

  UserModel({
    required this.email,
    required this.token
});

  factory UserModel.fromJson(String email,Map json){
    return UserModel(email: email, token: json["token"]);
  }
}