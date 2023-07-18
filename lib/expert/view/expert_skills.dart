import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/get_jobs_provider.dart';
import 'package:skillmaestro/core/constants.dart';

import '../../application/common/common_provider.dart';

Set<String> skills = {};

class ExpertSkills extends StatelessWidget {
  const ExpertSkills({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExpertAllJobsProvider>().AllJobsForExpert();
    //List<Skill> skills = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text("Jobs Available For you"),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child:
            Consumer<ExpertAllJobsProvider>(builder: (context, value, child) {
          //log('------insideconsumer------${value.usersMap}');
          // ignore: prefer_is_empty
          return value.expertJobs.length == 0 || value.expertJobs.isEmpty
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
                      itemCount: value.expertJobs['result'].length,
                      itemBuilder: (context, index) {
                        return UserCard(map: value.expertJobs['result'][index]);
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
        skills.add("${map['_id']}");

        context.read<ExpertAllJobsProvider>().AddExpertSkill(skills);
        Provider.of<CommonProvider>(context, listen: false)
            .showjobSuccessSnackBar(context);

        Navigator.of(context).pop();
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
