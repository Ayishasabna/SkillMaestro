import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/admin/controller/experts_managing_service.dart';
import 'package:skillmaestro/admin/model/all_experts_model.dart';
import '../../application/admin/all_experts_list_provider.dart';
import '../../core/constants.dart';

class AllExpertForAdmin extends StatelessWidget {
  const AllExpertForAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AllExpertListForAdmin>().fetchAllExperts();
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AllExpertListForAdmin>(context, listen: false)
          .fetchAllExperts();
    }); */
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Experts"),
          //backgroundColor: const Color(0xFF02D1AC),
          backgroundColor: mainColor,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await context.read<AllExpertListForAdmin>().fetchAllExperts();
          },
          child: Center(
            child: Consumer<AllExpertListForAdmin>(
                builder: (context, value, child) {
              //log('------insideconsumer------${value.usersMap}');
              return value.expert.length == 0 || value.expert.isEmpty
                  ? const Text("No Users available")
                  : ListView.builder(
                      itemCount: value.expert['result'].length,
                      itemBuilder: (context, index) {
                        return UserCard(map: value.expert['result'][index]);
                      });
            }),
          ),
        )

        /* Consumer<AllExpertListForAdmin>(builder: (context, value, child) {
        if (value.allExperts == null || value.allExperts!.isEmpty) {
          return const Text("No experts available");
        } else {
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {},
              title: Text(value.allExperts![index].result[index].username),
              trailing: ElevatedButton(
                onPressed: () {
                  if (value.allExperts![index].result[index].isVerified ==
                      false) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Approve Expert'),
                          content: Text(
                              "Are You Sure You Want To Approve ${value.allExperts![index].result[index].username}"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            ElevatedButton(
                                onPressed: () {
                                  value.approveExpert(value.allExperts![index]
                                      .result[index].isVerified);

                                  Navigator.pop(context);
                                },
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green)),
                                child: const Text(
                                  "Approve",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Block Expert'),
                          content: Text(
                              "Are You Sure You Want To Block ${value.allExperts![index].result[index].username}"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  ExpertManagementService().blockExpert(
                                      context,
                                      value.allExperts![index].result[index]
                                          .username);
                                },
                                child: const Text("Block")),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        value.allExperts![index].result[index].isBanned == true
                            ? Colors.red
                            : Colors.green)),
                child: Text(
                  value.allExperts![index].result[index].isVerified.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              //leading: value.allExperts![index].result[index].image != null
              /*    ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        value.allExperts![index]!.image!,
                      ),
                    )
                  : const CircleAvatar(),  */
            ),
            itemCount: value.allExperts?.length,
          );
        }
      }), */
        );
  }
}

class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};
  //String jobrole =

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Adjust the value as needed
      ),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image.network("${map['image']}"),
                Text(
                  'UserName:${map['username']}',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text('Email: ${map['email']}'),
                Text('Mobile: ${map['mobile']}'),
                Text('jobRole:  ${map['skills']}'),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber // Set the desired color here
                  ),
              onPressed: () {
                if (map['isBanned'] == true) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Approve User'),
                        content: Text(
                            "Are You Sure You Want To Approve ${map['isBanned']}}"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          ElevatedButton(
                              onPressed: () {
                                /* value.approveExpert(
                                    value.allExperts![index]!.id); */

                                Navigator.pop(context);
                              },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.green)),
                              child: const Text(
                                "Approve",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text("true"),
            ),
          ],
        ),
      ),
    );
  }
}





/* class ExpertList extends StatefulWidget {
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
 */