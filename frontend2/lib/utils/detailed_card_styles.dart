import 'package:flutter/material.dart';
import '../../utils/card_styles.dart';
import '../../utils/text_styles.dart';

class DetailedCardTheme extends CustomCardTheme {
  static CardTheme get detailedCardTheme {
    return CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      margin: const EdgeInsets.all(10),
      color: const Color(0xff1F2933).withOpacity(0.6),
    );
  }

// method to create trip details card for billing
  static Card createTripDetailsCard(
      String outboundDepartureTime,
      String outboundDepartureDate,
      String outboundArrivalTime,
      String outboundArrivalDate,
      String inboundDepartureTime,
      String inboundDepartureDate,
      String inboundArrivalTime,
      String inboundArrivalDate,
      String departure,
      String arrival,

      double imageWidth,
      double imageHeight,
      double spaceWidth,
      double buttonSize
      ) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white, width: 0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // outbound trip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$outboundDepartureTime\n$outboundDepartureDate',
                  style: ThemeText.bodySmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox.fromSize(
                  size: Size(imageWidth, imageHeight),
                  child: Image.asset(
                    'assets/images/depart.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  '$outboundArrivalTime\n$outboundArrivalDate',
                  style: ThemeText.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            // arrival and departure stations
            Row(
              children: [
                SizedBox(width: spaceWidth),
                SizedBox.fromSize(
                  size: Size(buttonSize, 32),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(
                      '$departure         -         $arrival',
                      style: ThemeText.bodySmall,
                    ),
                  ),
                ),
              ],
            ),

            // inbound trip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$inboundDepartureTime\n$inboundDepartureDate',
                  style: ThemeText.bodySmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox.fromSize(
                  size: Size(imageWidth, imageHeight),
                  // rotate image
                  child: Transform.rotate(
                    angle: 3.14,
                    child: Image.asset(
                      'assets/images/depart.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Text(
                  '$inboundArrivalTime\n$inboundArrivalDate',
                  style: ThemeText.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//   method to create billing details card for billing
  static Card createBillingDetailsCard(
      String departure,
      String arrival,
      String totalFare,
      String adultPassengerCount,
      String adultPassengerFare,
      String tourerOffer,
      String subTotal,
      ) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white, width: 0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Billing Details',
              style: ThemeText.bodyMedium,
              textAlign: TextAlign.left,
            ),

            // outbound trip
            Card(
              color: const Color(0xff323F4B),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 0, right: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'FLIGHT $departure - $arrival',
                          style: ThemeText.bodySmall,
                        ),
                        const Text(
                          '',
                          style: ThemeText.bodySmall,
                        ),
                        Text(
                          '\$$totalFare',
                          style: ThemeText.bodySmall,
                        ),
                      ],
                    ),
                    // fare breakdown
                    // adult
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          '',
                          style: ThemeText.bodySmall,
                        ),
                        Text(
                          'ADULT X $adultPassengerCount',
                          style: ThemeText.bodySmall,
                        ),
                        Text(
                          '$adultPassengerFare X$adultPassengerCount',
                          style: ThemeText.bodySmall,
                        ),
                      ],
                    ),

                    // tourer offer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          '',
                          style: ThemeText.bodySmall,
                        ),
                        const Text(
                          'TOURER OFFER',
                          style: ThemeText.bodySmall,
                        ),
                        Text(
                          tourerOffer,
                          style: ThemeText.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // inbound trip card
            Card(
              color: const Color(0xff323F4B),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 0, right: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'FLIGHT $arrival - $departure',
                          style: ThemeText.bodySmall,
                        ),
                        const Text(
                          '',
                          style: ThemeText.bodySmall,
                        ),
                        Text(
                          '\$$totalFare',
                          style: ThemeText.bodySmall,
                        ),
                      ],
                    ),
                    // fare breakdown
                    // adult
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          '',
                          style: ThemeText.bodySmall,
                        ),
                        Text(
                          'ADULT X $adultPassengerCount',
                          style: ThemeText.bodySmall,
                        ),
                        Text(
                          '$adultPassengerFare X$adultPassengerCount',
                          style: ThemeText.bodySmall,
                        ),
                      ],
                    ),
                    // tourer offer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          '',
                          style: ThemeText.bodySmall,
                        ),
                        const Text(
                          'TOURER OFFER',
                          style: ThemeText.bodySmall,
                        ),
                        Text(
                          tourerOffer,
                          style: ThemeText.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // sub total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'TOTAL',
                  style: ThemeText.bodySmall,
                ),
                const Text(
                  '',
                  style: ThemeText.bodySmall,
                ),
                Text(
                  '\$$subTotal',
                  style: ThemeText.bodySmall,
                ),
              ],
            ),
          ],
        )
      )
    );
  }

//   method to create available shuttle card
  static Card createAvailableShuttleCard(
      String shuttleName,
      String shuttleClass,
      String outboundDepartureTime,
      String outboundDepartureDate,
      String outboundArrivalTime,
      String outboundArrivalDate,
      String inboundDepartureTime,
      String inboundDepartureDate,
      String inboundArrivalTime,
      String inboundArrivalDate,
      String duration,
      String departure,
      String arrival,
      String transitCount,
      String adultPassengerCount,
      String fare,
      ) {
    return Card(
      color: const Color(0xff2A1F33).withOpacity(0.6),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white, width: 0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  shuttleName,
                  style: ThemeText.bodyLarge,
                ),
                Text(
                  duration,
                  style: ThemeText.bodySmall,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  shuttleClass,
                  style: ThemeText.bodySmall,
                ),
                Text(
                  '$transitCount TRANSIT(S)',
                  style: ThemeText.bodySmall,
                ),
              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  createTripDetailsCard(
                    outboundDepartureTime,
                    outboundDepartureDate,
                    outboundArrivalTime,
                    outboundArrivalDate,
                    inboundDepartureTime,
                    inboundDepartureDate,
                    inboundArrivalTime,
                    inboundArrivalDate,
                    departure,
                    arrival,
                    100,
                    50,
                    5,
                    150
                  ),
                Column(
                  children: [
                    Text('\n\n\n'),
                    Text(
                      '\$ $fare',
                      style: ThemeText.bodyLarge,
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      '$adultPassengerCount ADULTS',
                      style: ThemeText.bodySmall,
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ],
            ),

          ],
        )
      ),
    );
  }
}
