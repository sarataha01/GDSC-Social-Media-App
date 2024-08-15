class UserModel {
  final String? uid;
  final String name;
  final String username;
  final String email;
  final String phone;

  UserModel({
    this.uid,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> data, String documentId) {
    return UserModel(
      uid: documentId,
      name: data['name'] ?? '',
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
    );
  }
}
