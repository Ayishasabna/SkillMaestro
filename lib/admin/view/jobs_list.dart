import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/admin/all_jobs_list_provider.dart';

class JobsList extends StatelessWidget {
  const JobsList({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    context.read<AllJobsListForAdmin>().fetchAllJobs();
    
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Jobs"),
          backgroundColor: const Color(0xFF02D1AC),
          //backgroundColor: mainColor,
        ),
        body: Consumer<AllJobsListForAdmin>(builder: (context, value, child) {
          //log('------insideconsumer------${value.usersMap}');
          // ignore: prefer_is_empty
          return value.JobsMap.length == 0 || value.JobsMap.isEmpty
              ? const Text("No Users available")
              : ListView.builder(
                  itemCount: value.JobsMap['result'].length,
                  itemBuilder: (context, index) {
                    return UserCard(map: value.JobsMap['result'][index]);
                  });
        }));
  }
}

// ignore: must_be_immutable
class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};

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
                Image.network("${map['image']}"),
                Text(
                  'Title:${map['job_role']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text('Base Rate: ${map['base_rate']}'),
                Text('Additional Rate: ${map['ad_rate']}'),
                Text('createdAt:  ${map['createdAt']}'),
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
              child: const Text("Listed"),
            ),
          ],
        ),
      ),
    );
  }
}
