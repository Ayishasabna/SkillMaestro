import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/expert_profile_provider.dart';
import 'package:skillmaestro/expert/view/add_skill.dart';
import 'package:skillmaestro/expert/view/edit_expert_profile.dart';
import 'package:skillmaestro/expert/view/expert_signin.dart';
import 'package:skillmaestro/user/view/user_home.dart';

class ExpertProfile extends StatefulWidget {
  const ExpertProfile({super.key});

  @override
  State<ExpertProfile> createState() => _ExpertProfileState();
}

class _ExpertProfileState extends State<ExpertProfile> {
  String selectedJobRole = '';
  // Variable to store the selected job role
  List<String> jobRoles = [
    'Job Role 1',
    'Job Role 2',
    'Job Role 3',
    // Add more job roles as needed
  ];

  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ExpertProfileProvider>(context, listen: false)
          .getExpertDetails();
    });
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Consumer<ExpertProfileProvider>(
          builder: (context, value, child) => FutureBuilder(
            future: value.expertDetails,
            builder: (context, snapshot) => SingleChildScrollView(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back)),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        /* decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/splash/bgImage.jpeg'),
                              fit: BoxFit.fill),
                        ), */
                        width: double.infinity,
                        height: height / 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: snapshot.data?.image != null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    snapshot.data!.image!,
                                  ),
                                  radius: 30,
                                )
                              : const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
                                  radius: 30,
                                ),
                        ),
                      ),
                      ColoredBox(
                        color: const Color.fromARGB(255, 243, 241, 241),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17),
                              child: Text(
                                'Account',
                                //style: normalText.copyWith(color: Colors.blue),
                              ),
                            ),
                            /*   Tile(
                              storage: storage,
                              /* subtitle: Text(
                                snapshot.data!.verified ?? "",
                                style: TextStyle(
                                    color: snapshot.data?.status == 'Approved'
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.w700),
                              ), */
                              title: Text(
                                "Status",
                                //style: normalText,
                              ),
                              subtitle: Text(
                                snapshot.data?.verified ?? "dkd",
                              ),
                            ), */
                            Tile(
                              title: Text(
                                "Username",
                                //style: normalText,
                              ),
                              subtitle: Text(
                                snapshot.data?.username ?? "dkd",
                              ),
                            ),
                            Tile(
                              storage: storage,
                              subtitle: Text("${snapshot.data?.mobile ?? ""} "),
                              title: Text(
                                "Phone",
                                //style: normalText,
                              ),
                            ),
                            Tile(
                              storage: storage,
                              subtitle: Text(snapshot.data?.email ?? ""),
                              title: Text(
                                "Email",
                                //style: normalText,
                              ),
                            ),
                            /* DropdownButton<String>(
                              value: selectedJobRole,
                              items: jobRoles.map((String jobRole) {
                                return DropdownMenuItem<String>(
                                  value: jobRole,
                                  child: Text(jobRole),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedJobRole = newValue!;
                                });
                              },
                            ), */

                            /*                  Consumer2<ExpertProvider, JobService>(
                      builder: (context, value, value2, child) {
                    return DropdownButtonFormField<JobRoleModel>(
                      value:value.
                      items: value2.jobs
                          .map((category) => DropdownMenuItem<JobRoleModel>(
                                value: category,
                                child: Text(category!.name),
                              ))
                          .toList(),
                      onChanged: (JobRoleModel? category) {
                        value2.setjob(category, category!.id,context);
                      },
                      validator: (value) {
                        if (value2.selectedJob == null) {
                          return 'Category is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: const Icon(Icons.category),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 123, 230, 219))),
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 111, 111, 111),
                        ),
                      ),
                    );
                  }), */

                            Tile(
                              storage: storage,
                              subtitle: Text("Skills"),
                              /* title: Text(
                                "DOB",
                                style: normalText,
                              ), */
                            ),
                            /*  Tile(
                              storage: storage,
                              subtitle: Text(snapshot.data?.gender ?? ""),
                              title: Text(
                                "Gender",
                                style: normalText,
                              ),
                            ), */
                            /*  Tile(
                              storage: storage,
                              subtitle: Text(snapshot.data?.about ?? ""),
                              title: Text(
                                "About",
                                style: normalText,
                              ),
                            ), */
                            /* Tile(
                              storage: storage,
                              subtitle: Text(snapshot.data?.github ?? ""),
                              title: Text(
                                "Github",
                                style: normalText,
                              ),
                            ),
                            Tile(
                              storage: storage,
                              subtitle: Text(snapshot.data?.googleDrive ?? ""),
                              title: Text(
                                "GoogleDrive",
                                style: normalText,
                              ),
                            ),
                            Tile(
                              storage: storage,
                              subtitle: Text(snapshot.data?.linkedIn ?? ""),
                              title: Text(
                                "LinkedIn",
                                style: normalText,
                              ),
                            ),
                            Tile(
                              storage: storage,
                              subtitle: Text(snapshot.data?.skill ?? ""),
                              title: Text(
                                "Skills",
                                style: normalText,
                              ),
                            ),
                            Tile(
                              storage: storage,
                              subtitle: Text(
                                "${snapshot.data?.address?.pincode ?? ""}",
                              ),
                              title: Text(
                                "Pincode",
                                style: normalText,
                              ),
                            ),
                            Tile(
                              storage: storage,
                              subtitle: Text(
                                  snapshot.data?.address?.currentAddress ?? ""),
                              title: Text(
                                "CurrentAddress",
                                style: normalText,
                              ),
                            ),
                            Tile(
                              storage: storage,
                              subtitle: Text(snapshot.data?.address?.country ?? ""),
                              title: Text(
                                "Country",
                                style: normalText,
                              ),
                            ),
                            Tile(
                              storage: storage,
                              subtitle: Text(snapshot.data?.address?.state ?? ""),
                              title: Text(
                                "State",
                                style: normalText,
                              ),
                            ),
                            Tile(
                              storage: storage,
                              subtitle: Text(snapshot.data?.address?.city ?? ""),
                              title: Text(
                                "City",
                                style: normalText,
                              ),
                            ), */
                            Tile(
                              title: const Text(
                                'Edit Profile',
                              ),
                              leading:
                                  const CircleAvatar(child: Icon(Icons.edit)),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 17,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExpertProfileEdit(
                                        image: snapshot.data?.image,
                                        userName: snapshot.data?.username,
                                        mobile: "${snapshot.data?.mobile}",
                                        email: snapshot.data?.email,
                                      ),
                                    ));
                              },
                            ),
                          ],
                        ),
                      ),
                      ColoredBox(
                        color: const Color.fromARGB(255, 243, 241, 241),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //kHeight10,
                            Padding(
                              padding: const EdgeInsets.only(left: 17),
                              child: Text(
                                'System',
                                //style: normalText.copyWith(color: Colors.blue),
                              ),
                            ),
                            Tile(
                              storage: storage,
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 17,
                              ),
                              leading: const CircleAvatar(
                                child: Icon(
                                  Icons.settings,
                                  size: 17,
                                ),
                              ),
                              title: const Text('Settings'),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => jobAddScreen(
                                        imagePath: File('assets/user.png'),
                                      ),
                                    ));
                              },
                            ),
                            Tile(
                              storage: storage,
                              leading: CircleAvatar(
                                child: Icon(Icons.restart_alt_rounded),
                              ),
                              title: Text("Swich User"),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Switch User"),
                                    content: const Text(
                                        'Are You Sure You Want To Switch To User'),
                                    actions: [
                                      ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.grey)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('No',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                      ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.red)),
                                        onPressed: () async {
                                          FlutterSecureStorage storage =
                                              const FlutterSecureStorage();
                                          String? user = await storage.read(
                                              key: 'user_access_token');
                                          if (context.mounted) {}
                                          if (user != null) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserHome(),
                                                ),
                                                (route) => false);
                                          } else {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ExpertLogin(),
                                                ),
                                                (route) => false);
                                          }
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Tile(
                              storage: storage,
                              leading: const CircleAvatar(
                                child: Icon(
                                  Icons.logout_outlined,
                                ),
                              ),
                              title: const Text('Sign Out'),
                              onTap: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Sign Out'),
                                    content: const Text(
                                        'Are You Sure You Want To Sign Out From This Account?'),
                                    actions: [
                                      ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.grey)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                      ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.red)),
                                        onPressed: () async {
                                          yesClicked(context);
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void yesClicked(context) async {
    await storage.delete(key: 'expert_access_token');
    await storage.delete(key: 'expertId');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ExpertLogin(),
        ),
        (route) => false);
  }
}

class Tile extends StatelessWidget {
  Tile(
      {super.key,
      this.storage,
      this.onTap,
      this.trailing,
      this.leading,
      this.subtitle,
      this.title});

  final FlutterSecureStorage? storage;
  void Function()? onTap;
  Widget? trailing;
  Widget? leading;
  Widget? title;
  Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Card(
        child: ListTile(
          trailing: trailing,
          onTap: onTap,
          leading: leading,
          title: title,
          subtitle: subtitle,
        ),
      ),
    );
  }
}
