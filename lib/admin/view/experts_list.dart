import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/admin/all_experts_list_provider.dart';
import '../../core/constants.dart';

class AllExpertForAdmin extends StatelessWidget {
  const AllExpertForAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AllExpertListForAdmin>().fetchAllExperts();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
              // ignore: prefer_is_empty
              return value.expert.length == 0 || value.expert.isEmpty
                  ? const Text("No Users available")
                  : ListView.builder(
                      itemCount: value.expert['result'].length,
                      itemBuilder: (context, index) {
                        return UserCard(map: value.expert['result'][index]);
                      });
            }),
          ),
        ));
  }
}

// ignore: must_be_immutable
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
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image.network("${map['image']}"),
                Text(
                  'UserName:${map['username']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text('Email: ${map['email']}'),
                Text('Mobile: ${map['mobile']}'),
                //Text('jobRole:  ${map['skills']}'),
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
              child: const Text("true"),
            ),
          ],
        ),
      ),
    );
  }
}
