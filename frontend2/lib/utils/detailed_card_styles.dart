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
  static Card createDetailedCard(
      String outboundDepartureTime,
      String outboundDepartureDate,
      String outboundArrivalTime,
      String outboundArrivalDate,
      String inboundDepartureTime,
      String inboundDepartureDate,
      String inboundArrivalTime,
      String inboundArrivalDate,
      String departure,
      String arrival) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white, width: 0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
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
                  size: const Size(200, 50),
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
                const SizedBox(width: 86),
                SizedBox.fromSize(
                  size: const Size(200, 32),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(
                      '$departure                -                $arrival',
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
                  size: const Size(200, 50),
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
}
