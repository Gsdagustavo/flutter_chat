class User {
  final int id;
  final String name;
  final String profileImage;

  User(this.id, this.name, this.profileImage);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['profileImage']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profileImage': profileImage
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, profileImage: $profileImage}';
  }
}
