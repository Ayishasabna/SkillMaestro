import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/user/add_address_provider.dart';
import 'package:skillmaestro/application/user/user_add_job_provider.dart';
import 'package:skillmaestro/user/model/add_adress_model.dart';
import 'package:skillmaestro/user/model/book_job_request_model.dart';
import 'package:skillmaestro/user/view/confirm_booking.dart';
import 'package:skillmaestro/user/view/user_home.dart';
import '../../application/user/get_slots_provider.dart';
import 'package:intl/intl.dart';

List<String>? selectedValue;
String? selectedTimeSlot;

List<String> dropdownItems = [];
TextEditingController nameController = TextEditingController();
// ignore: non_constant_identifier_names
TextEditingController HouseNameController = TextEditingController();
TextEditingController streetController = TextEditingController();
TextEditingController pincodeController = TextEditingController();
TextEditingController timeslot = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController date = TextEditingController();
TextEditingController jobId = TextEditingController();

// ignore: must_be_immutable
class UserGetSlot extends StatefulWidget {
  UserGetSlot({super.key, required this.id});

  @override
  State<UserGetSlot> createState() => _UserGetSlotState();
  String id;
}

class _UserGetSlotState extends State<UserGetSlot> {
  //final String id;
  final field1 = TextEditingController();

  List result = [];
  late String availableDate;
  String? initialDateTimeString;
  @override
  @override
  Widget build(BuildContext context) {
    //Map<String, dynamic> userSlots =
    context.read<GetSlotsForUserProvider>().getSlotesForUser(widget.id);
    //log("______________________slots____________${userSlots}");
    //context.read<AddJobProvider>().
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 3.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 390,
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Available Slotes',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 121, 216, 206))),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                                'Please Select the available slotes\n              registered by Experts ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 81, 81, 81))),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 15),
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Consumer<GetSlotsForUserProvider>(
                                    builder: (context, slots, child) {
                                      int n = slots.userSlots['result'].length;
                                      bool isLoading =
                                          slots.userSlots['result'] == null ||
                                              slots.userSlots['result'].isEmpty;
                                      if (isLoading) {
                                        Text('kkkkk');
                                        return Text('No Expert Available');
                                      } else {
                                        List<DropdownMenuItem<String>>
                                            dropdownItems = [];
                                        Map<String, String> dateFormats = {};

                                        for (int i = 0; i < n; i++) {
                                          String dateTimeString =
                                              slots.userSlots['result'][i];
                                          DateTime dateTime =
                                              DateTime.parse(dateTimeString);
                                          String formattedDate =
                                              DateFormat.yMd().format(dateTime);
                                          //availableDate = formattedDate;
                                          // Store the formatted date and its corresponding original format string
                                          dateFormats[formattedDate] =
                                              dateTimeString;

                                          DropdownMenuItem<String>
                                              dropdownItem =
                                              DropdownMenuItem<String>(
                                            value: formattedDate,
                                            child: Text(
                                              formattedDate,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                          );

                                          dropdownItems.add(dropdownItem);
                                        }

                                        return DropdownButtonFormField<String>(
                                          value: selectedTimeSlot,
                                          items: dropdownItems,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Select slots';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedTimeSlot = newValue;
                                              // Retrieve the original format string based on the selected formatted date
                                              initialDateTimeString =
                                                  dateFormats[
                                                          selectedTimeSlot] ??
                                                      '';
                                            });
                                          },
                                        );
                                      }
                                      //slots.userSlots['result'].isEmpty
                                      //? CircularProgressIndicator()
                                    },
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                adressdialogue(
                                    context, widget.id, initialDateTimeString!
                                    //selectedValue!
                                    );
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(5.0),
                                fixedSize: MaterialStateProperty.all(
                                  const Size(185, 45),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 123, 230, 219),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Confirm',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future adressdialogue(context, String id, String selectedslots) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      context.read<AddAddressProvider>();
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: const Center(
          child: Text(
            'Add Address',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: HouseNameController,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'HouseName',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: streetController,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'Street',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: pincodeController,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'Pincode',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              final address1 = addAddress(context, id);
              AddressModel view = AddressModel(
                  house: address1.house,
                  name: address1.name,
                  street: address1.street,
                  pincode: address1.pincode);
              bookNow(context, view, id, selectedslots);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      UserHome(), // Replace UserHome with the actual screen you want to navigate back to
                ),
              );

              //Navigator.of(context).pop();
            },
            child: Text('Submit'),
          ),
        ],
      );
    },
  );
}

AddAddressModel addAddress(context, String id) {
  final name = nameController.text;
  final house = HouseNameController.text;
  final street = streetController.text;
  final pincode = pincodeController.text;
  final model = AddAddressModel(
      name: name, house: house, street: street, pincode: pincode);
  Provider.of<AddAddressProvider>(context, listen: false)
      .AddAddress(model, context);

  //bookNow(context, model, id);
  return model;
}

Future bookNow(
  context,
  AddressModel address1,
  String id,
  String selectedslot,
) async {
  timeslot.text = selectedslot.toString();
  address.text = address1.house.toString();
  date = TextEditingController(text: DateTime.now().toString());
  jobId = TextEditingController(text: id.toString());

  String dateTimeString = date.text;
  DateTime dateTime = DateTime.parse(dateTimeString);

  String newdate = DateFormat.yMd().format(dateTime);
  TextEditingController dateController = TextEditingController(text: newdate);

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      context.read<AddAddressProvider>();
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: const Center(
          child: Text(
            'Booking Details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: timeslot,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'Time',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: address,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: dateController,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'Date',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: jobId,
              decoration: const InputDecoration(
                labelText: 'JobId',
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              final model = BookJobRequestModel(
                  slots: selectedslot,
                  address: address1,
                  date: date.text,
                  jobId: jobId.text);
              await Provider.of<UserAddJobProvider>(context, listen: false)
                  .AddJob(model, context);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
              // ignore: use_build_context_synchronously
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BookingStatus()));
              //addAddress(context, id);
              // Perform submit action
            },
            child: const Text('Confirm'),
          ),
        ],
      );
    },
  );
}
