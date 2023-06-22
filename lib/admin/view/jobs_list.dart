import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/admin/model/all_jobs_response_model.dart';

import '../../application/admin/all_jobs_list_provider.dart';

class JobsList extends StatelessWidget {
  const JobsList({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    context.read<AllJobsListForAdmin>().fetchAllJobs();
    //List<jobProfile> allJobProfiles = [];
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AllJobsListForAdmin>(context, listen: false).fetchAllJobs();
    }); */
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Jobs"),
          backgroundColor: const Color(0xFF02D1AC),
          //backgroundColor: mainColor,
        ),
        body: Consumer<AllJobsListForAdmin>(builder: (context, value, child) {
          //log('------insideconsumer------${value.usersMap}');
          return value.JobsMap.length == 0 || value.JobsMap.isEmpty
              ? const Text("No Users available")
              : ListView.builder(
                  itemCount: value.JobsMap['result'].length,
                  itemBuilder: (context, index) {
                    return UserCard(map: value.JobsMap['result'][index]);
                  });
        })

        /* Consumer<AllJobsListForAdmin>(builder: (context, value, child) {
        if (value.allJobs == null || value.allJobs!.isEmpty) {
          return const Text("No jobs available");
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              //final job = value.allJobProfiles?[index].jobRole;

// Extract result from each JobListModel and add it to allJobProfiles list

              //final job = value.allJobs![index].result[index];
              return ListTile(
                onTap: () {},
                //title: Text(job.jobRole),
                title: Text(value.allJobProfiles![index].jobRole),
                trailing: ElevatedButton(
                  onPressed: () {
                    if (value.allJobs![index].result[index].isListed == false) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Approve Expert'),
                            content: Text(
                                "Are You Sure You Want To Approve ${value.allJobs![index].result[index].jobRole}"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel")),
                              ElevatedButton(
                                  onPressed: () {
                                    /*  value.approveExpert(value.allExperts![index]
                                      .result[index].isBanned);
 */
                                    Navigator.pop(context);
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.green)),
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
                            title: const Text('Block Vendor'),
                            content: Text(
                                "Are You Sure You Want To Block ${value.allJobs![index].result[index].jobRole}"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel")),
                              ElevatedButton(
                                  onPressed: () {
                                    /*  Navigator.pop(context);
                                  ExpertManagementService().blockExpert(
                                      context,
                                      value.allExperts![index].result[index]
                                          .username); */
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
                          value.allJobs![index].result[index].isListed == true
                              ? Colors.red
                              : Colors.green)),
                  child: Text(
                    value.allJobs![index].result[index].isListed.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                //leading: value.allExperts![index].result[index].image != null
                /*  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        value.allExperts![index]!.image!,
                      ),
                    )
                  : const CircleAvatar(), */
              );
            },
            //itemCount: value.allJobs?.length,
            itemCount: value.allJobs!.length,
          );
        }
      }), */
        );
  }
}

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
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network("${map['image']}"),
                Text(
                  'Title:${map['job_role']}',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
              child: Text("true"),
            ),
          ],
        ),
      ),
    );
  }
}
