import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/controller/add_jobs_service.dart';
import 'package:skillmaestro/admin/model/add_job_req_model.dart';

import 'package:skillmaestro/common/widgets/bottom_nav_bar.dart';
import 'package:skillmaestro/common/widgets/button.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/common/widgets/textfield.dart';

TextEditingController jobController = TextEditingController();
TextEditingController jobbRateController = TextEditingController();
TextEditingController jobadRateController = TextEditingController();

class AddJobs extends StatelessWidget {
  const AddJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Add Job',
              style: TextStyle(
                fontSize: 24, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Optional: Adjust the font weight
              ),
            ),
            widgets().sizedboxHeight40(),
            /* Stack(
              children: [
                const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                        'assets/3d-casual-life-cleaning-service.png'),
                    backgroundColor: Colors.transparent),
                Positioned(
                    //right: 100,
                    left: 120,
                    top: 120,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.edit)))
              ],
            ), */
            const SizedBox(
              height: 50,
            ),
            textfield(
              textFieldName: 'Jobname',
              controllerName: jobController,
              context: context,
            ),
            const SizedBox(
              height: 50,
            ),
            textfield(
              textFieldName: 'JobBasicRate',
              controllerName: jobbRateController,
              context: context,
            ),
            const SizedBox(
              height: 50,
            ),
            textfield(
              textFieldName: 'JobAdDitionalRate',
              controllerName: jobadRateController,
              context: context,
            ),
            const SizedBox(
              height: 50,
            ),
            loginSignupButton(
              buttonName: 'Add',
              functionName: AddButtonClicked,
              pageroute: const BottomNavBar(),
            )
          ],
        ),
      )),
    );
  }

  AddButtonClicked() {
    final job = jobController.text.trim();
    final bRate = int.parse(jobbRateController.text.trim());
    final adRate = int.parse(jobadRateController.text.trim());

    final jobData =
        AddJobReqModel(job: job, bRate: bRate, adRate: adRate, image: null);
    AddJobService().addJob(jobData);
  }
}
