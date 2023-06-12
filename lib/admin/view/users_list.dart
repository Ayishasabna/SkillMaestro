import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<dynamic> Users = [
    User('John Doe', 'assets/user.png'),
    User('Jane Smith', 'assets/user.png'),
    User('Mike Johnson', 'assets/user.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: Users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(Users[index].imagePath),
            ),
            title: Text(Users[index].name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Remove the expert from the list when the delete button is pressed
                setState(() {
                  Users.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class User {
  final String name;
  final String imagePath;

  User(this.name, this.imagePath);
}
