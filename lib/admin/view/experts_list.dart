import 'package:flutter/material.dart';

class ExpertList extends StatefulWidget {
  ExpertList({super.key});

  @override
  State<ExpertList> createState() => _ExpertListState();
}

class _ExpertListState extends State<ExpertList> {
  List<dynamic> experts = [
    Expert('John Doe', 'assets/user.png'),
    Expert('Jane Smith', 'assets/user.png'),
    Expert('Mike Johnson', 'assets/user.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expert List'),
      ),
      body: ListView.builder(
        itemCount: experts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(experts[index].imagePath),
            ),
            title: Text(experts[index].name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Remove the expert from the list when the delete button is pressed
                setState(() {
                  experts.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class Expert {
  final String name;
  final String imagePath;

  Expert(this.name, this.imagePath);
}
