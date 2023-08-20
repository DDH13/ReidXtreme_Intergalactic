import 'package:flutter/material.dart';
import 'package:frontend2/services/shuttle_service.dart';
import 'package:frontend2/utils/detailed_card_styles.dart';
import 'package:frontend2/views/booking_view/billing.dart';
import 'package:intl/intl.dart';
import '../../models/shuttle.dart';
import '../../models/trip.dart';
import '../../services/trip_service.dart';
import '../../utils/background_image.dart';
import '../../utils/appbar_styles.dart';

class AvailableShuttles extends StatefulWidget {
  final String destination;
  final String destDock;
  final String source;
  final String sourceDock;
  final DateTime departureDate;
  final DateTime arrivalDate;
  final int adults;
  final int children;

  const AvailableShuttles(
      {Key? key,
      required this.destination,
      required this.destDock,
      required this.source,
      required this.sourceDock,
      required this.departureDate,
      required this.arrivalDate,
      required this.adults,
      required this.children})
      : super(key: key);

  @override
  _AvailableShuttlesState createState() => _AvailableShuttlesState();
}

class _AvailableShuttlesState extends State<AvailableShuttles>
    with SingleTickerProviderStateMixin {
  late Future<List<Trip>> _trips;
  late Map<String, double> cost_of_trips;
  late Future<List<Shuttle>> _shuttles;

  @override
  void initState() {
    _shuttles = ShuttleService.getShuttles();
    super.initState();
    _trips = TripService.findTrip(
        widget.source, widget.destination, widget.departureDate);
    //a list of cost of each trip
    cost_of_trips = {};
    void GetTripCosts() async {
      _trips.then(
        (value) async => {
          for (var trip in value)
            {
              cost_of_trips[trip.id ?? ""] = await TripService.getCost(
                  trip.id ?? "", widget.adults, widget.children)
            }
        },
      );
    }

    GetTripCosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          _trips,
          _shuttles,
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final results = snapshot.data!;
            final trips = results[0] as List<Trip>;
            final shuttles = results[1] as List<Shuttle>;

            return Scaffold(
              appBar: const CustomAppBar(title: 'Available Shuttles'),
              body: Stack(
                children: [
                  const BackgroundImage(),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerRight,
                        ),
                        //create multiple gesture detectors for each Trip in trips
                        for (var trip in trips)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Billing(
                                          adults: widget.adults,
                                          destination: widget.destination,
                                          destDock: widget.destDock,
                                          source: widget.source,
                                          sourceDock: widget.sourceDock,
                                          departureDate: widget.departureDate,
                                          arrivalDate: widget.arrivalDate,
                                          // shuttle: "64e21eeee17e886fe178c9a0",
                                          shuttle: trip.shuttle ?? "",
                                          total: 0,
                                          children: widget.children,
                                        )),
                              );
                            },
                            child: DetailedCardTheme.createAvailableShuttleCard(
                              // 'SPACEX MK1',
                              shuttles
                                      .firstWhere((element) =>
                                          element.id == trip.shuttle)
                                      .name ??
                                  "",
                              shuttles
                                      .firstWhere((element) =>
                                          element.id == trip.shuttle)
                                      .type ??
                                  "",
                              DateFormat('MM/dd').format(trip.departure!),
                              DateFormat('HH:mm').format(trip.departure!),
                              DateFormat('HH:mm').format(trip.arrival!),
                              DateFormat('MM/dd').format(trip.arrival!),
                              '12:30',
                              '00:30',
                              '12/12',
                              '12:30',
                              // '2 DAYS 12 HOURS', subtract arrival and departure
                              trip.arrival!
                                  .difference(trip.departure!)
                                  .toString(),
                              trip.sourceDock ?? "",
                              // 'MD1',
                              trip.destinationDock ?? "",
                              '1',
                              '2',
                              // '50,000',
                              cost_of_trips[trip.id ?? ""]?.toString() ?? "",
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text('No data');
          }
        });
  }
}
