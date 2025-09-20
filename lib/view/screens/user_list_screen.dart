import 'package:appscrip_test/controller/providers/user_provider.dart';
import 'package:appscrip_test/view/screens/user_details_screen.dart';
import 'package:appscrip_test/view/widgets/custom_error_widget.dart';
import 'package:appscrip_test/view/widgets/custom_loading_widget.dart';
import 'package:appscrip_test/view/widgets/text_form_field_widget.dart';
import 'package:appscrip_test/view/widgets/user_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().fetchUsers();
      context.read<UserProvider>().loadFavorites();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Consumer<UserProvider>(
        builder: (context, controller, _) {
          return Column(
            children: [
              if (controller.hasData || controller.searchQuery.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormFieldWidget(
                    controller: _searchController,
                    onChanged: controller.searchUsers,
                    onClear: () {
                      _searchController.clear();
                      controller.clearSearch();
                    },
                  ),
                ),
              Expanded(
                child: () {
                  if (controller.isLoading) {
                    return const CustomLoadingWidget(
                      message: 'Loading users...',
                    );
                  }

                  if (controller.hasError) {
                    return CustomErrorWidget(
                      message: controller.errorMessage,
                      onRetry: controller.retry,
                    );
                  }

                  if (!controller.hasData) {
                    return const Center(
                      child: Text(
                        'No users found',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    );
                  }

                  if (controller.users.isEmpty &&
                      controller.searchQuery.isNotEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No users found for "${controller.searchQuery}"',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              _searchController.clear();
                              controller.clearSearch();
                            },
                            child: const Text('Clear search'),
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: controller.refreshUsers,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        final user = controller.users[index];
                        return UserListItemWidget(
                          user: user,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserDetailScreen(user: user),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }(),
              ),
            ],
          );
        },
      ),
    );
  }
}
