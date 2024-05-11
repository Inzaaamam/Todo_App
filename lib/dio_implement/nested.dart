import 'package:flutter/material.dart';
import 'package:myapp/dio_implement/model_nested.dart';
// Import your ApiService class

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ApiSer _apiService = ApiSer();
  late Future<List<User>> _userListFuture;

  @override
  void initState() {
    super.initState();
    _userListFuture = _apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder<List<User>>(
        future: _userListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const  Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  onTap: () {
                    _showUserDetails(context, user);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  void _showUserDetails(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(user.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Username: ${user.username}'),
              Text('Email: ${user.email}'),
              Text('Phone: ${user.phone}'),
              Text('Website: ${user.website}'),
              SizedBox(height: 16),
              Text('Address:'),
              Text('Street: ${user.address.street}'),
              Text('Suite: ${user.address.suite}'),
              Text('City: ${user.address.city}'),
              Text('Zipcode: ${user.address.zipcode}'),
              SizedBox(height: 16),
              Text('Company:'),
              Text('Name: ${user.company.name}'),
              Text('Catch Phrase: ${user.company.catchPhrase}'),
              Text('Bs: ${user.company.bs}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
