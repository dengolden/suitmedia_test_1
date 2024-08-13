import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suitmedia_test/model/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;
  User? _selectedUser;
  final int _perPage = 10;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  User? get selectedUser => _selectedUser;

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      if (isRefresh) {
        _currentPage = 1;
        _users.clear();
        _hasMore = true;
      }

      final response = await http.get(
        Uri.parse(
            'https://reqres.in/api/users?page=$_currentPage&per_page=$_perPage'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<User> fetchedUsers =
            (data['data'] as List).map((user) => User.fromJson(user)).toList();

        _users.addAll(fetchedUsers);
        _hasMore = data['page'] < data['total_pages']; // Update hasMore
        _currentPage++;
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching users: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectUser(User user) {
    _selectedUser = user;
    notifyListeners();
  }
}
