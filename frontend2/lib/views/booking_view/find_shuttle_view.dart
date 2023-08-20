import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend2/views/booking_view/available_shuttles.dart';
import '../../models/destination.dart';
import '../../services/destination_service.dart';
import '../../utils/appbar_styles.dart';
import '../../utils/datepicker_styles.dart';
import '../../utils/dropdown_button_styles.dart';
import '../../utils/textbox_increment_styles.dart';

class FindShuttleView extends StatefulWidget {
  FindShuttleView({Key? key}) : super(key: key);

  @override
  _FindShuttleViewState createState() => _FindShuttleViewState();
}

class _FindShuttleViewState extends State<FindShuttleView>
    with SingleTickerProviderStateMixin {
  bool value = false;

  late Future<List<Destination>> _destinations;

  @override
  void initState() {
    super.initState();
    _destinations = DestinationService.getDestinations();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Destination>>(
        future: _destinations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('waiting');
            return const SizedBox(
              height: 10.0,
              width: 10.0,
              child: Center(
                  child: CircularProgressIndicator(
                    //   color
                    color: Color.fromARGB(255, 220, 104, 145),
                  )),
            );
          } else if (snapshot.hasError) {
            print('error');
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            print('data');
            final destinations = snapshot.data!;
            return Scaffold(
                appBar: CustomAppBar(title: 'Find Shuttle'),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('From',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            CustomDropdownButtonFormField(
                                dropdownValue: destinations[0].name ?? "",
                                dropdownItems: destinations
                                    .map(
                                        (destination) => destination.name ?? "")
                                    .toList()),
                            CustomDropdownButtonFormField(
                                dropdownValue: destinations[0].docks?[0] ?? "",
                                dropdownItems: destinations
                                    .firstWhere((destination) =>
                                destination.name == 'Saturn')
                                    .docks ??
                                    ['']),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text('To',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            CustomDropdownButtonFormField(
                                dropdownValue: destinations[0].name ?? "",
                                dropdownItems: destinations
                                    .map(
                                        (destination) => destination.name ?? "")
                                    .toList()),
                            CustomDropdownButtonFormField(
                                dropdownValue: destinations[0].docks?[0] ?? "",
                                dropdownItems: destinations
                                    .firstWhere((destination) =>
                                destination.name == 'Saturn')
                                    .docks ??
                                    ['']),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Return Trip',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Checkbox(
                              value: this.value,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Departure',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                CustomTextFormField()
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Return',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                CustomTextFormField()
                              ],
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Adults',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: TextFieldTapRegionExample(),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Children',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: TextFieldTapRegionExample(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 200, 15, 0),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.normal),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AvailableShuttles(
                                          destination:"64df749e7bbda70fb14fc712",
                                          destDock:"dock1",
                                          sourceDock:"dock2",
                                          arrivalDate: DateTime.now(),
                                          departureDate: DateTime.parse("2023-08-19"),
                                          adults:3,
                                          source: '64df74577bbda70fb14e401c',
                                          children:4,
                                        ),
                                  ),
                                );
                              },
                              child: const Text('FIND A SHUTTLE  >'),
                            )),
                      ),
                    ],
                  ),
                ));
          } else {
            return const Text("No data");
          }
        });
  }
}
