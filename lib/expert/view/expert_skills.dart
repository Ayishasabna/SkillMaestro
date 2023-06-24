import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/get_jobs_provider.dart';
import 'package:skillmaestro/core/constants.dart';
import 'package:skillmaestro/expert/controller/expert_add_job_service.dart';
import 'package:skillmaestro/expert/model/all_booking_model.dart';
import 'package:skillmaestro/expert/model/expert_add_job_model.dart';
import 'package:skillmaestro/expert/model/expert_add_job_model.dart'
    as ExpertAddJobModel;

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
        title: Center(child: Text("All Jobs")),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child:
            Consumer<ExpertAllJobsProvider>(builder: (context, value, child) {
          //log('------insideconsumer------${value.usersMap}');
          return value.expertJobs.length == 0 || value.expertJobs.isEmpty
              ? const Text("No Users available")
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

class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        skills.add("${map['_id']}");
        log('+++++++++++++skills.add++++++++++++++++$skills');
        // skills.add("${map}");
        //Skill skill = Skill.fromJson(map);
        //ExpertAddJobModel.Skill expertAddJobSkill = ExpertAddJobModel.Skill();

        // context.read<ExpertAddJobService>().ExpertAddSkill(skills);
        context.read<ExpertAllJobsProvider>().AddExpertSkill(skills);

        /* Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => JobDetailScreen(title: map['job_role']))); */
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
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network("${map['image']}"),
                    /* */
                    // Text('Base Rate: ${map['base_rate']}'),
                    //Text('Additional Rate: ${map['ad_rate']}'),
                    //Text('createdAt:  ${map['createdAt']}'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${map['job_role']}',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
