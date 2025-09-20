import 'dart:developer';
import 'dart:io';
import 'package:appscrip_test/controller/services/user_services.dart';
import 'package:appscrip_test/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum LoadingState { idle, loading, loaded, error, refreshing }

class UserProvider extends ChangeNotifier {
  List<UserModel> _users = [];
  List<UserModel> _filteredUsers = [];
  LoadingState _loadingState = LoadingState.idle;
  String _errorMessage = '';
  String _searchQuery = '';

  List<UserModel> get users => _filteredUsers;
  LoadingState get loadingState => _loadingState;
  String get errorMessage => _errorMessage;
  String get searchQuery => _searchQuery;
  bool get isLoading => _loadingState == LoadingState.loading;
  bool get isRefreshing => _loadingState == LoadingState.refreshing;
  bool get hasError => _loadingState == LoadingState.error;
  bool get hasData => _users.isNotEmpty;

  UserServices userServices = UserServices();

  Future<void> fetchUsers({bool isRefresh = false}) async {
    try {
      setLoadingState(
          isRefresh ? LoadingState.refreshing : LoadingState.loading);
      clearError();

      _users = await userServices.fetchUsers();
      applySearchFilter();
      setLoadingState(LoadingState.loaded);

      if (kDebugMode) {
        log('Successfully fetched ${_users.length} users');
      }
    } on DioException catch (e) {
      setError(e.message ?? 'Network error occurred');
      if (kDebugMode) {
        log('DioException in fetchUsers: ${e.message}');
        log('Error type: ${e.type}');
      }
    } on SocketException {
      setError(
          'No internet connection. Please check your network and try again.');
    } catch (e) {
      setError('Something went wrong. Please try again later.');
      if (kDebugMode) {
        log('Unexpected error fetching users: $e');
      }
    }
  }

  Future<void> refreshUsers() async {
    await fetchUsers(isRefresh: true);
  }

  void searchUsers(String query) {
    _searchQuery = query.toLowerCase().trim();
    applySearchFilter();
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    applySearchFilter();
    notifyListeners();
  }

  // UserModel? getUserById(int id) {
  //   try {
  //     return _users.firstWhere((user) => user.id == id);
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // Future<UserModel?> fetchUserById(int id) async {
  //   try {
  //     final user = await userServices.fetchUserById(id);
  //     return user;
  //   } on DioException catch (e) {
  //     if (kDebugMode) {
  //       print('DioException in fetchUserById: ${e.message}');
  //     }
  //     return null;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error fetching user by ID: $e');
  //     }
  //     return null;
  //   }
  // }

  void applySearchFilter() {
    if (_searchQuery.isEmpty) {
      _filteredUsers = List.from(_users);
    } else {
      _filteredUsers = _users
          .where((user) =>
              user.name.toLowerCase().contains(_searchQuery) ||
              user.email.toLowerCase().contains(_searchQuery) ||
              user.username.toLowerCase().contains(_searchQuery))
          .toList();
    }
  }

  void setLoadingState(LoadingState state) {
    _loadingState = state;
    notifyListeners();
  }

  void setError(String message) {
    _errorMessage = message;
    setLoadingState(LoadingState.error);
  }

  void clearError() {
    _errorMessage = '';
  }

  Future<void> retry() async {
    await fetchUsers();
  }
}
