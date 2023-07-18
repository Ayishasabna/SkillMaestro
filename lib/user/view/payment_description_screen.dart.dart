import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skillmaestro/application/expert/show_all_jobs_provider.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/common/widgets/textfield.dart';
import 'package:skillmaestro/core/widgets/expert_list_tile_widget.dart';
import 'package:skillmaestro/user/model/review_model.dart';
//import 'package:skillmaestro/user/model/single_booking_details_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../application/user/get_jobs_provider.dart';
import '../../application/user/single_job_details_provider.dart';
import '../../core/constants.dart';
import '../../core/theme/access_token/token.dart';

TextEditingController reviewController = TextEditingController();
TextEditingController ratingController = TextEditingController();
//Map<String, dynamic> newMap = {};
int newRating = 1;

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key, required this.map

      //this.isBooked,
      });
  Map<String, dynamic> map;

  //final isBooked;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    //log("_____________________map of status______________${widget.map['status']}");
    /* if (widget.map['status'] == "closed") {
      showIsBooked();
      //log("_____________________");
    } */

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Code that depends on inherited widget or element goes here
      if (widget.map['status'] == "completed" ||
          widget.map['status'] == "closed") {
        //log('________new log________________________${Provider.of<SingleBookingDetailsProvider>(context, listen: false).getSingleBooking(widget.map["_id"], context)}');
        showIsBooked(widget.map);
      }
    });
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  final _razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<SingleBookingDetailsProvider>().getSingleBooking(
          widget.map['_id'],
          context,
        );
    return SafeArea(child: Scaffold(bottomNavigationBar: Consumer<
            SingleBookingDetailsProvider>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            confirmClicked(value.singleBooking['bill_amount'],
                value.singleBooking['userId']['username']);
            _openCheckout(value.singleBooking['bill_amount'],
                value.singleBooking['userId']['username']);
            /* confirmClicked(snapshot.data!.price, snapshot.data!.title);
                final prov =
                    Provider.of<BookGigPrvider>(context, listen: false);
                prov.gigId = snapshot.data!.id;
                prov.title = snapshot.data!.title;
                prov.vendorId = snapshot.data!.vendorId.id; */
            // _openCheckout(snapshot.data!.title,snapshot.data!.price);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 123, 230, 219),
            padding: EdgeInsets.symmetric(
                horizontal: width / 5, vertical: width / 27),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
          child: const Text(
            "Pay Now ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      );
    }

        /*  Consumer<AlljobsListForUser>(builder: (context, value, child) {
        log('_____________paymentscreenstate___________${value.userBooking['result'][0]['jobId']['base_rate']}');
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              textfield(
                  textFieldName: 'Enter Your Review',
                  controllerName: reviewController,
                  context: context),
              SizedBox(
                height: 40,
              ),
              textfield(
                  textFieldName: 'Rating',
                  controllerName: ratingController,
                  context: context),
              SizedBox(
                height: 40,
              ),
              // ElevatedButton(onPressed: () {}, child: child),
              ElevatedButton(
                onPressed: () {
                  confirmClicked(
                      value.userBooking['result'][0]['jobId']['base_rate'],
                      value.userBooking['result'][0]['jobId']['job_role']);
                  // final prov =
                  //     Provider.of<BookGigPrvider>(context, listen: false);
                  // prov.gigId = snapshot.data!.id;
                  // prov.title = snapshot.data!.title;
                  // prov.vendorId = snapshot.data!.vendorId.id;
                  _openCheckout(
                      value.userBooking['result'][0]['jobId']['job_role'],
                      value.userBooking['result'][0]['jobId']['base_rate']);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 123, 230, 219),
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 5, vertical: width / 27),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                child: const Text(
                  "Pay Online ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        );
      }), */
        )));
  }

  void _openCheckout(price, title) {
    var options = {
      'key': 'rzp_test_2cg0OeQbAa5nGA',
      'amount': '${price * 100}',
      'name': '$title',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => const BookingStatus()),
    //     (Route<dynamic> route) => false);
    // final prov = Provider.of<BookGigPrvider>(context, listen: false);
    // GigBookingModel bookingModel = GigBookingModel(
    //     vendorId: prov.vendorId.toString(),
    //     title: prov.title.toString(),
    //     requirements: response.paymentId.toString(),
    //     gigId: prov.gigId.toString());
    // prov.booking(bookingModel, context);
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: 'Payment Failed',
      ),
    );
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  Shimmer getjobdescriShimmerLoad(width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: width / 1.1 + 30,
        width: width,
        color: Colors.white,
      ),
    );
  }

  void confirmClicked(price, title) {
    _openCheckout(price, title);
  }

  void showIsBooked(Map<String, dynamic> reviewMap) {
    showDialog(
        context: context,
        builder: (context) {
          return Consumer<SingleBookingDetailsProvider>(
              builder: (context, value, child) {
            log("_____________________review Map______________${value.singleBooking}");
            return SimpleDialog(
              title: Center(
                  child: Text(
                value.singleBooking['expertId']['username'],
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: mainColor!)))),
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            title: const Center(
                              child: Text('Rating'),
                            ),
                            children: [
                              Center(
                                child: RatingBar.builder(
                                  allowHalfRating: true,
                                  glowColor: mainColor,
                                  initialRating: 0,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 230, 209, 23),
                                  ),
                                  onRatingUpdate: (rating) {
                                    value.setRating = rating;
                                    newRating = rating.toInt();

                                    log("____________rating________${newRating}");
                                  },
                                  updateOnDrag: true,
                                  minRating: 1,
                                  glow: true,
                                  itemSize: 30,
                                  itemPadding: const EdgeInsets.all(3),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: TextFormField(
                              //     //controller: value.reviewTitleController,
                              //     maxLines: 1,
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: reviewController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    labelText: 'Review',
                                    hintText: 'Enter your review',
                                  ),
                                ),
                              ),
                              Center(
                                  child: ElevatedButton(
                                onPressed: () {
                                  log("________________id checking__________${value.singleBooking['_id']}");
                                  ReviewModel newModel = ReviewModel(
                                      reviewBy: value.singleBooking['expertId']
                                          ['_id'],
                                      myId: value.singleBooking['userId']
                                          ['_id'],
                                      reviewModel: 'expert',
                                      myIdModel: 'user',
                                      jobId: value.singleBooking['jobId']
                                          ['_id'],
                                      bookId: value.singleBooking['_id'],
                                      message: reviewController.text,
                                      rating: newRating);
                                  submitButtonClicked(context, newModel);
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            side: BorderSide(
                                                color: mainColor!)))),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ))
                            ],
                          ),
                        );
                      },
                      child: const Text(
                        'Add Review',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                )
              ],
            );
          });
        });
  }

  void submitButtonClicked(context, ReviewModel model) {
    final provider =
        Provider.of<SingleBookingDetailsProvider>(context, listen: false);
    provider.postRating(model);
    reviewController.clear();
    Navigator.pop(context);
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(
        message: 'Reveiw Added',
      ),
    );
    /* final provider = Provider.of<ReservedGigs>(context, listen: false);
    ReviewAddingModel reveiw = ReviewAddingModel(
        reviewData: ReviewData(
            gig: gigId,
            rating: provider.rating.toString(),
            title: provider.reviewTitleController.text,
            description: provider.reviewController.text));
    provider.postRating(reveiw);
    provider.reviewController.clear();
    provider.reviewTitleController.clear();
    Navigator.pop(context);
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(
        message: 'Reveiw Added',
      ),
    ); */
  }

  /* void showIsBooked() {
    showDialog(
      context: context,
      builder: (context) {
        return Consumer<SingleBookingDetailsProvider>(
          
          builder: (context, value, child) => SimpleDialog(
            title: Center(
                child: Text(
                    value.reservedGigs![widget.index]!.title,
                     style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.bold), 
                    )),
            children: [
              /* value.reservedGigs![widget.index]?.status == 'Completed'
                  ? */
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: mainColor!)))),
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          title: const Center(
                            child: Text('Rating'),
                          ),
                          children: [
                            Center(
                              child: Text('hai'),
                              /* child: RatingBar.builder(
                                      allowHalfRating: true,
                                      glowColor: mainColor,
                                      initialRating: 3,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color:
                                            Color.fromARGB(255, 230, 209, 23),
                                      ),
                                      onRatingUpdate: (rating) {
                                        value.setRating = rating;
                                      },
                                      updateOnDrag: true,
                                      minRating: 1,
                                      glow: true,
                                      itemSize: 30,
                                      itemPadding: const EdgeInsets.all(3),
                                    ), */
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                //controller: value.reviewTitleController,
                                maxLines: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                //controller: value.reviewController,
                                maxLines: 3,
                              ),
                            ),
                            Center(
                                child: ElevatedButton(
                              onPressed: () {
                                // submitButtonClicked(
                                //     context,
                                //     value.reservedGigs![widget.index]!
                                //         .gigId.id);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          side:
                                              BorderSide(color: mainColor!)))),
                              child: const Text(
                                'Submit',
                                style: TextStyle(color: Colors.black),
                              ),
                            ))
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      'Add Review',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              )
            ],
          ),
        );
      },
    );
  } */
}

class Containerr extends StatelessWidget {
  Containerr({super.key, this.height, this.width, this.color = Colors.white});
  dynamic height;
  dynamic width;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}

class StarIcon extends StatelessWidget {
  const StarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star_rate_rounded,
      size: 23,
      color: Colors.black,
    );
  }
}
