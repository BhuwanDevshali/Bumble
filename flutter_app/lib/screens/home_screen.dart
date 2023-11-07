import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/user_card.dart';
import 'package:flutter_app/services/database_service.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  fetchUsers() async {
    DatabaseService databaseService = DatabaseService();
    users = await databaseService.getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bumble Clone'),
      ),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserCard(user: users[index]);
              },
            ),
    );
  }
}