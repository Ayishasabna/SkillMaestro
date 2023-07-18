import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/user/view/rating_review.dart';
import 'package:skillmaestro/user/view/user_get_slot.dart';
import '../../application/user/get_jobs_provider.dart';
import '../../application/user/get_slots_provider.dart';
import '../../common/widgets/common_widget.dart';
import '../../core/constants.dart';

double newRating1 = 1.0;
double newRating2 = 1.0;
late bool showReviews;

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
    context.read<AlljobsListForUser>().fetchJobDetail(title);
    context.read<GetSlotsForUserProvider>().getSlotesForUser(id);

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
        body: Consumer<AlljobsListForUser>(
          builder: (context, value, child) {
            if (value.jobDetail['result'] == null) {
              // If the 'result' key is null, handle the case when there are no reviews.
              const Center(child: CircularProgressIndicator());
              showReviews = false;
            }
            if (value.jobDetail['result']['reviews'] == null ||
                value.jobDetail['result']['reviews'].isEmpty) {
              showReviews = false;

              //return Center(child: CircularProgressIndicator());
              //Text('No Reviews posted yet...');
            } else {
              newRating1 =
                  value.jobDetail['result']['reviews'][0]['rating'].toDouble();
              newRating2 =
                  value.jobDetail['result']['reviews'][1]['rating'].toDouble();
              showReviews = true;
            }
            return SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the value as needed
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
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                              'SkillMaestro connects you to professional $title services.Connect with SkillMaestro for expert  $title services . Connect with us and get efficient services at the best rates.',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5, // Adjust the value as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the value as needed
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
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Here is the rate information',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    //Text('Here is the rate information.'),
                                    const SizedBox(height: 10),
                                    Center(
                                        child: Text(
                                      'Basic Rate: Rs. $basicRate',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    const SizedBox(height: 8),
                                    Center(
                                        child: Text(
                                      'Additional Rate: Rs. $additionalRate',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    const SizedBox(height: 16),
                                    Align(
                                      alignment: Alignment.center,
                                      child: TextButton(
                                        child: const Text('Close'),
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
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
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the value as needed
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
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'SkillMaestro charges for unit of 2 hour of service initially, and every 60 minutes thereon Material charges are additional. Customer can either purchase the material directly or request the service partner to procure it. Time for material procurement will be charged in the final bill.Our service partner will help you with a quotation in case of long hour work schedules. Please confirm the quotation before initiating work to avoid any conflict on service completion.',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        child: const Text('Close'),
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
                          'Terms and Conditions',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
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
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the value as needed
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
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'After you book the service,  $title in your area will receive a notification coordinated by SkillWhiz customer service. Kindly wait for the confirmation message. Our service partner will call and note the details of the problem, to bring along the necessary tools and other equipment. Make sure all materials for service are kept ready before service starts. In case you want the Skillwhiz partner to purchase the materials, let them know beforehand. The time taken for purchase of materials will be added as part of service charges. Skillwhiz partner will give you a quotation if required for work that requires more than 4 hours. Work will be done only after your approval of the quote When the work is over, our agent will let you know the service charge. Please make the payment accordingly online on our platform or by cash to the service provider',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 8),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        child: const Text('Close'),
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        trailing: Icon(Icons.add),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 50,
                    width: 125,
                    child: Consumer<GetSlotsForUserProvider>(
                      builder: (context, value, child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              shadowColor: Colors.black,
                              backgroundColor: Colors.teal[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            //functionName?.call();
                            //functionName;

                            value.userSlots['result'] == null ||
                                    value.userSlots['result'].isEmpty
                                ? showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0), // Adjust the value as needed
                                        ),
                                        content: const Text(
                                          'No Expert Available for this Job',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue),
                                        ),
                                      );
                                    })
                                : Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => UserGetSlot(
                                          id: id,
                                        )));
                          },
                          child: const Text(
                            "Book Now",
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Customer Review",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const WorkReviewScreen()));
                        },
                        child: const Text(
                          "More Reviews",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  showReviews
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ignore: sized_box_for_whitespace
                              Container(
                                height: 90,
                                width: 150,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WorkReviewScreen()));
                                  },
                                  child: Card(
                                    color: Colors.blue.shade300,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15.0), // Adjust the value as needed
                                    ),
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          widgets().sizedboxHeight10(),
                                          Column(
                                            children: [
                                              RatingBar.builder(
                                                ignoreGestures: true,
                                                allowHalfRating: true,
                                                initialRating: newRating1,
                                                itemSize: 20,
                                                itemBuilder: (context, index) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Color.fromARGB(
                                                      255, 230, 209, 23),
                                                ),
                                                onRatingUpdate: (value) {},
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                  "${value.jobDetail['result']['reviews'][1]['message']}",
                                                  style: normalText),
                                            ],
                                          ),
                                          widgets().sizedboxHeight10(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // ignore: sized_box_for_whitespace
                              Container(
                                height: 90,
                                width: 150,
                                child: Card(
                                  color: Colors.blue.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15.0), // Adjust the value as needed
                                  ),
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        widgets().sizedboxHeight10(),
                                        Column(
                                          children: [
                                            RatingBar.builder(
                                              ignoreGestures: true,
                                              allowHalfRating: true,
                                              initialRating: newRating2,
                                              itemSize: 20,
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Color.fromARGB(
                                                    255, 230, 209, 23),
                                              ),
                                              onRatingUpdate: (value) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                "${value.jobDetail['result']['reviews'][1]['message']}",
                                                style: normalText),
                                          ],
                                        ),
                                        widgets().sizedboxHeight10(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Text('No Reviews Posted Yet...')
                ]));
          },
        ));
  }
}
