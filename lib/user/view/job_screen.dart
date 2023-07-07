import 'package:flutter/material.dart';
import 'package:skillmaestro/common/widgets/button.dart';
import 'package:skillmaestro/user/view/user_get_slot.dart';
import '../../core/constants.dart';

// ignore: must_be_immutable
class JobDetailScreen extends StatelessWidget {
  JobDetailScreen({
    super.key,
    required this.title,
    required this.id,
    required this.basicRate,
    required this.additionalRate,
  });
  String title;
  String id;
  int basicRate;
  int additionalRate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Center(
              child: Text(
            title.toUpperCase(),
          )),
          //backgroundColor: const Color(0xFF02D1AC),
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
        ),
        /*  bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
          ],
          backgroundColor: Colors.white, // Set your desired background color
          selectedItemColor: mainColor, // Set your desired selected item color
          unselectedItemColor:
              Colors.grey, // Set your desired unselected item color
        ), */
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              /* SizedBox(
                height: 10,
              ),
              Text(
                title.toUpperCase(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ), */
              const SizedBox(
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
                      offset: const Offset(
                          0, 3), // changes the position of the shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "How Can You find expert $title near you?",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                          'SkillMaestro connects you to professional $title services.Connect with SkillMaestro for expert  $title services . Connect with us and get efficient services at the best rates.',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                    )
                    /* Text(
                      "SkillMaestro  Connects you to \n  Proffesional $title Services. ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ), */
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5, // Adjust the value as needed
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the value as needed
                ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Here is the rate information',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 10),
                                //Text('Here is the rate information.'),
                                SizedBox(height: 10),
                                Center(
                                    child: Text(
                                  'Basic Rate: Rs. ${basicRate}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )),
                                SizedBox(height: 8),
                                Center(
                                    child: Text(
                                  'Additional Rate: Rs. ${additionalRate}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )),
                                SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const ListTile(
                    leading: Text(
                      'Rate Chart',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(Icons.add),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5, // Adjust the value as needed
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the value as needed
                ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'SkillMaestro charges for unit of 2 hour of service initially, and every 60 minutes thereon Material charges are additional. Customer can either purchase the material directly or request the service partner to procure it. Time for material procurement will be charged in the final bill.Our service partner will help you with a quotation in case of long hour work schedules. Please confirm the quotation before initiating work to avoid any conflict on service completion.',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: ListTile(
                    leading: Text(
                      'Terms and Conditions',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(Icons.add),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5, // Adjust the value as needed
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the value as needed
                ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'After you book the service,  ${title} in your area will receive a notification coordinated by SkillWhiz customer service. Kindly wait for the confirmation message. Our service partner will call and note the details of the problem, to bring along the necessary tools and other equipment. Make sure all materials for service are kept ready before service starts. In case you want the Skillwhiz partner to purchase the materials, let them know beforehand. The time taken for purchase of materials will be added as part of service charges. Skillwhiz partner will give you a quotation if required for work that requires more than 4 hours. Work will be done only after your approval of the quote When the work is over, our agent will let you know the service charge. Please make the payment accordingly online on our platform or by cash to the service provider',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const ListTile(
                    leading: Text(
                      'How it Works',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(Icons.add),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              loginSignupButton(
                  buttonName: "Book Now",
                  pageroute: UserGetSlot(
                    id: id,
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Customer Review",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 90,
                      width: 150,
                      child: Card(
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the value as needed
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
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
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 90,
                      width: 150,
                      child: Card(
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the value as needed
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
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
