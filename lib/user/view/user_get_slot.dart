import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/user/add_address_provider.dart';
import 'package:skillmaestro/application/user/user_add_job_provider.dart';
import 'package:skillmaestro/common/widgets/bottom_nav_bar.dart';
import 'package:skillmaestro/user/model/add_adress_model.dart';
import 'package:skillmaestro/user/model/book_job_request_model.dart';
import 'package:skillmaestro/user/view/user_home.dart';
import '../../application/user/get_slots_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    context.read<GetSlotsForUserProvider>().getSlotesForUser(widget.id);
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
                                      //selectedValue = slots.userSlots['result'];
                                      log('kkkkkkk======================${slots.userSlots['result']}=====================');
                                      /*   .map<String>(
                                              (item) => item as String)
                                          .toList(); */

                                      return DropdownButtonFormField<String>(
                                        // items: dropdownitems(),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Select slots';
                                          } else {
                                            return null;
                                          }
                                        },

                                        value: selectedTimeSlot,
                                        /* slots.userSlots['result'] !=
                                                    null &&
                                                slots.userSlots['result']
                                                    .isNotEmpty
                                            ? slots.userSlots['result'][0]
                                            : null, */

                                        items: slots.userSlots['result'] !=
                                                    null &&
                                                slots.userSlots['result']
                                                    .isNotEmpty
                                            ? slots.userSlots['result']
                                                .map<DropdownMenuItem<String>>(
                                                    (e) {
                                                return DropdownMenuItem<String>(
                                                  value: e,
                                                  child: Text(
                                                    e.toString(),
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    selectedTimeSlot = e;
                                                    log("======================timeslot++++++++++++$selectedTimeSlot");
                                                    // slots.userJobs['result'] = e;
                                                  },
                                                );
                                              }).toList()
                                            : [],
                                        onChanged: (value) {
                                          //selectedTimeSlot = value;
                                          //slots.userSlots['result'] = value;
                                          selectedTimeSlot = value;
                                          log('addTra******${slots.userSlots['result']}=======================');
                                        },
                                      );
                                    },
                                  )),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                adressdialogue(
                                    context, widget.id, selectedTimeSlot!
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
        title: const Text('Add Address'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: HouseNameController,
              decoration: const InputDecoration(
                labelText: 'HouseName',
              ),
            ),
            TextField(
              controller: streetController,
              decoration: const InputDecoration(
                labelText: 'Street',
              ),
            ),
            TextField(
              controller: pincodeController,
              decoration: const InputDecoration(
                labelText: 'Pincode',
              ),
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
              // Perform submit action
              //Navigator.of(context).pop();
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>))
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

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      context.read<AddAddressProvider>();
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: const Text('Booking Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: timeslot,
              decoration: const InputDecoration(
                labelText: 'Time',
              ),
            ),
            TextField(
              controller: address,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
            ),
            TextField(
              controller: date,
              decoration: const InputDecoration(
                labelText: 'Date',
              ),
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
            onPressed: () {
              final model = BookJobRequestModel(
                  slots: selectedslot,
                  address: address1,
                  date: date.text,
                  jobId: jobId.text);
              Provider.of<UserAddJobProvider>(context, listen: false)
                  .AddJob(model, context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BottomNavBar()));
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
