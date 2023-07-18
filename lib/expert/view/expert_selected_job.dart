import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/get_jobs_provider.dart';
import 'package:skillmaestro/core/constants.dart';
import 'package:skillmaestro/expert/view/expert_bottom_nav_bar.dart';


//Set<String> removeskills = {};
String remove = '';

class ExpertSelectedJobs extends StatelessWidget {
  const ExpertSelectedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExpertAllJobsProvider>().selectedJobsByExpert();
    //List<Skill> skills = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text("Jobs"),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child:
            Consumer<ExpertAllJobsProvider>(builder: (context, value, child) {
          
          // ignore: prefer_is_empty
          return value.expertSelectedJobs.length == 0 ||
                  value.expertSelectedJobs.isEmpty
              ? const Text(
                  "No Jobs available for you...\n  update Your Skill",
                  style: TextStyle(fontSize: 16),
                )
              : Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                      ),
                      itemCount: value.expertSelectedJobs['result'].length,
                      itemBuilder: (context, index) {
                        return UserCard(
                            map: value.expertSelectedJobs['result'][index]);
                      }),
                );
        }),
      ),
    );
  }
}

// ignore: must_be_immutable
class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String job = map['job_role'];
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Remove job'),
              content:
                  Text("Are You Sure You Want To Remove ${job.toUpperCase()}"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                    onPressed: () async {
                      // BlockUserService().blockUserId("${map['_id']}");
                      remove = map['_id'];
                      log('============removeskillid=====$remove');
                      context
                          .read<ExpertAllJobsProvider>()
                          .removeExpertSkill(remove);

                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const expertBottomNavBar()));
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green)),
                    child: const Text(
                      "Remove",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(100.0), // Adjust the value as needed
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network("${map['image']}"),
                    
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${map['job_role']}',
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
