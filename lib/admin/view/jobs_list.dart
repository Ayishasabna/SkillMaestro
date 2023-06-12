import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class JobsList extends StatefulWidget {
  const JobsList({super.key});

  @override
  State<JobsList> createState() => _JobsListState();
}

class _JobsListState extends State<JobsList> {
  List<dynamic> Jobs = [
    User('Cleaning', 'assets/3d-casual-life-cleaning-service.png'),
    User('Painter', 'assets/3d-casual-life-young-man-with-floor-cleaning.png'),
    User('Driver', 'assets/lagom-seated-man-driving.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: Jobs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage(Jobs[index].imagePath),
                backgroundColor: Colors.transparent),
            title: Text(Jobs[index].name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Remove the expert from the list when the delete button is pressed
                setState(() {
                  Jobs.removeAt(index);
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
