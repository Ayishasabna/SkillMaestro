import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skillmaestro/common/widgets/button.dart';
import 'package:skillmaestro/user/view/user_get_slot.dart';
import 'package:skillmaestro/user/view/user_home.dart';

import '../../core/constants.dart';

class JobDetailScreen extends StatelessWidget {
  JobDetailScreen({super.key, required this.title});
  String title;
  //String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(
          title: Center(child: const Text("Job Details")),
          //backgroundColor: const Color(0xFF02D1AC),
          backgroundColor: mainColor,
        ), */
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
          ],
          backgroundColor: mainColor, // Set your desired background color
          selectedItemColor:
              Colors.white, // Set your desired selected item color
          unselectedItemColor:
              Colors.grey, // Set your desired unselected item color
        ),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text(
                "$title",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius:
                      BorderRadius.circular(20), // Adjust the value as needed
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset:
                          Offset(0, 3), // changes the position of the shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "How Can You find expert $title near you?",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "SkillMaestro connects you to \nproffesional $title services. ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5, // Adjust the value as needed
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the value as needed
                ),
                child: ListTile(
                  leading: Text(
                    'Rate Chart',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Icon(Icons.add),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5, // Adjust the value as needed
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the value as needed
                ),
                child: ListTile(
                  leading: Text(
                    'Terms and Conditions',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Icon(Icons.add),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5, // Adjust the value as needed
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the value as needed
                ),
                child: ListTile(
                  leading: Text(
                    'How it Works',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Icon(Icons.add),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              loginSignupButton(
                  buttonName: "Book Now", pageroute: UserGetSlot()),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Customer Review",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: Card(
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the value as needed
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      child: Card(
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the value as needed
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}

/* import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/admin/add_job_provider.dart';
import 'package:skillmaestro/application/expert/show_all_jobs_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../application/common/common_provider.dart';
import '../../core/constants.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  File? addGalleryImage;
  File? addCameraImage;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      /* fetchDatas();
      Provider.of<VendorConnectionService>(context, listen: false)
          .vendorConnection();
      context.read<NewGIgCreateProvider>().getAllCategory(context);
      Provider.of<VendorProfileProvider>(context, listen: false)
          .getVendorDetails();
      Provider.of<AllBookingProvider>(context, listen: false)
          .fetchAllBookings(context);
      final vendor = await getVendorAccesToken(); */
      //log(vendor.toString(), name: "vendoreeeeeeeeeeeee");
    });

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButton: IconButton(
          style:
              ButtonStyle(backgroundColor: MaterialStatePropertyAll(mainColor)),
          onPressed: () {
            //bottomSheet(context, width);
          },
          icon: const Icon(
            Icons.add_box_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
        appBar: AppBar(
          elevation: 5.0,
          backgroundColor: mainColor,
          title: Text(
            'Jobs',
            //style: GoogleFonts.monoton(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(child: Consumer2<ShowAllJobsProvider, CommonProvider>(
              builder: (context, value, value2, child) {
            return context.watch<ShowAllJobsProvider>().isLoading
                ? LoadingAnimationWidget.fourRotatingDots(
                    color: const Color.fromARGB(255, 113, 113, 113), size: 25.0)
                : value.expertJobs!.isEmpty
                    ? Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                            color: Color.fromARGB(255, 113, 113, 113),
                            size: 10.0))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return Container();
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: 3,
                      );
          }))
        ]));
  }
}
                         // )
                        // : ListView.separated(
                        //     itemBuilder: (context, index) {
                        //       return value2.shimmerLoading
                        //           ? gigScrnShimmer(width)
                        //           : GestureDetector(
                        //               // onTap: () => Navigator.push(
                        //               //   context,
                        //                 /* MaterialPageRoute(
                        //                     builder: (context) =>
                        //                         GigDescripttion(
                        //                       index: index,
                        //                       title: value
                        //                           .vendorGigs![index].title,
                        //                     ),
                        //                   ) */
                        //               );},
                        //               : Column(
                        //                 children: [
                        //                   Container(
                        //                     decoration: BoxDecoration(
                        //                       image: DecorationImage(
                        //                         image: NetworkImage(value
                        //                             .expertJobs![index].job),
                        //                         fit: BoxFit.cover,
                        //                       ),
                        //                     ),
                        //                     width: width,
                        //                     height: width / 1.75,
                        //                     child: Column(
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.end,
                        //                       children: [
                        //                         PopupMenuButton(
                        //                           icon: const Icon(
                        //                             Icons.more_vert_outlined,
                        //                             color: Colors.white,
                        //                           ),
                        //                           itemBuilder: (context) => [
                        //                             const PopupMenuItem(
                        //                               value: 1,
                        //                               child: Text('Edit',
                        //                                   style: TextStyle(
                        //                                       color:
                        //                                           Colors.black,
                        //                                       fontFamily:
                        //                                           'poppins',
                        //                                       fontSize: 15)),
                        //                             ),
                        //                             const PopupMenuItem(
                        //                                 enabled: true,
                        //                                 value: 2,
                        //                                 child: Text(
                        //                                   'Delete',
                        //                                   style: TextStyle(
                        //                                     color: Colors.red,
                        //                                     fontFamily:
                        //                                         'poppins',
                        //                                     fontSize: 15,
                        //                                   ),
                        //                                 ))
                        //                           ],
                        //                           onSelected: (popvalue) {
                        //                             if (popvalue == 1) {
                        //                               // context.read<NewGIgCreateProvider>().getAllCategory(context);
                        //                               Navigator.push(
                        //                                   context,
                        //                                   MaterialPageRoute(
                        //                                     builder: (context) => GigEditScreen(
                        //                                         imagePath: value
                        //                                             .vendorGigs![
                        //                                                 index]
                        //                                             .image,
                        //                                         title: value
                        //                                             .vendorGigs![
                        //                                                 index]
                        //                                             .title,
                        //                                         overView: value
                        //                                             .vendorGigs![
                        //                                                 index]
                        //                                             .overview,
                        //                                         description: value
                        //                                             .vendorGigs![
                        //                                                 index]
                        //                                             .description,
                        //                                         price: value
                        //                                             .vendorGigs![
                        //                                                 index]
                        //                                             .price,
                        //                                         type: value
                        //                                             .vendorGigs![
                        //                                                 index]
                        //                                             .type,
                        //                                         gigId: value
                        //                                             .vendorGigs![
                        //                                                 index]
                        //                                             .id),
                        //                                   ));
                        //                             } else if (popvalue == 2) {
                        //                               showDialog(
                        //                                 context: context,
                        //                                 builder: (context) => Consumer2<
                        //                                     AddJobProvider,
                        //                                     ShowAllJobsProvider>(
                        //                                   builder: (context,
                        //                                           value,
                        //                                           value2,
                        //                                           child) =>
                        //                                       AlertDialog(
                        //                                     title: const Text(
                        //                                         'Are You sure You want to delete this gig?'),
                        //                                     actions: [
                        //                                       ElevatedButton(
                        //                                           onPressed:
                        //                                               () {
                        //                                             Navigator.pop(
                        //                                                 context);
                        //                                           },
                        //                                           child: const Text(
                        //                                               'Cancel')),
                        //                                       ElevatedButton(
                        //                                           onPressed:
                        //                                               () async {
                        //                                             await value.deleteGig(
                        //                                                 value2
                        //                                                     .vendorGigs![index]
                        //                                                     .id,
                        //                                                 context);
                        //                                             // await Provider.of<ShowAllJobsProvider>(
                        //                                             //         context,
                        //                                             //         listen:
                        //                                             //             false)
                        //                                             //     .callApiServiceGigs(
                        //                                             //         context);
                        //                                             Navigator.pop(
                        //                                                 context);
                        //                                           },
                        //                                           child:
                        //                                               const Text(
                        //                                             'Yes',
                        //                                             style: TextStyle(
                        //                                                 color: Colors
                        //                                                     .red),
                        //                                           )),
                        //                                     ],
                        //                                   ),
                        //                                 ),
                        //                               );
                        //                             }
                        //                           },
                        //                           elevation: 2,
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                   Padding(
                        //                     padding: const EdgeInsets.all(8.0),
                        //                     child: Column(
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.start,
                        //                       children: [
                        //                         Row(
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment
                        //                                   .spaceBetween,
                        //                           children: [
                        //                             // Text(
                        //                             //   value.vendorGigs![index]
                        //                             //       .title,
                        //                             //   style: const TextStyle(
                        //                             //       fontSize: 19,
                        //                             //       fontWeight:
                        //                             //           FontWeight.bold),
                        //                             // ),
                        //                             // kHeight10,
                        //                             // Text(
                        //                             //   "\u{20B9}${value.vendorGigs![index].price}",
                        //                               /* style:
                        //                                   GoogleFonts.notoSans(
                        //                                       fontSize: 19,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w600), */
                        //                             // ),
                        //                           ],
                        //                         ),
                        //                         Text(
                        //                           value.expertJobs![index]
                        //                               .job,
                        //                           style: TextStyle(
                        //                             color: Colors.grey.shade800,
                        //                             fontSize: 18,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ],
                                       */
