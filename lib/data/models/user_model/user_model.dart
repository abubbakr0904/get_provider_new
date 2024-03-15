class UserModel {
  final int id;
  final String username;
  final String name;
  final String state;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.state,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map <String, dynamic> json){
    return UserModel(id: json["id"],
        username: json["username"] as String ?? "",
        name: json["name"] as String ?? "",
        state: json["state"] as String ?? "",
        avatarUrl: json["avatar_url"] as String ?? ""
    );
  }
}
