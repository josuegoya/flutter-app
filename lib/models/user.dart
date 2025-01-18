class User {
  final int? id;
  final String? name;
  final String? username;
  final String? email;

  User({this.id, this.name, this.username, this.email});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'username': username, 'email': email};
  }
}
