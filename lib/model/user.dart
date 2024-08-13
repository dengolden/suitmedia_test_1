class User {
  final int id;
  final String name;
  final String email;
  final String avatar;

  User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: "${json['first_name']} ${json['last_name']}",
      avatar: json['avatar'],
      email: json['email'],
    );
  }
}

class UserResponse {
  final List<User> users;
  final int page;
  final int totalPages;

  UserResponse({
    required this.users,
    required this.page,
    required this.totalPages,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      users: (json['data'] as List).map((i) => User.fromJson(i)).toList(),
      page: json['page'],
      totalPages: json['total_pages'],
    );
  }
}
