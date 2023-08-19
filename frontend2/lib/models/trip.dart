class Trip {
  String? id;
  String? source;
  String? destination;
  String? sourceDock;
  String? destinationDock;
  DateTime? departure;
  DateTime? arrival;
  String? shuttle;
  double? ticketPrice;

  Trip({
    this.id,
    this.source,
    this.destination,
    this.sourceDock,
    this.destinationDock,
    this.departure,
    this.arrival,
    this.shuttle,
    this.ticketPrice,
  });

  static Trip fromJson(jsonDecode) {
    return Trip(
      id: jsonDecode['id'],
      source: jsonDecode['source'],
      destination: jsonDecode['destination'],
      sourceDock: jsonDecode['sourceDock'],
      destinationDock: jsonDecode['destinationDock'],
      departure: DateTime.parse(jsonDecode['departure']),
      arrival: DateTime.parse(jsonDecode['arrival']),
      shuttle: jsonDecode['shuttle'],
      ticketPrice: jsonDecode['ticketPrice'],
    );
  }

  static Map<String, dynamic> toJson(Trip trip) {
    return {
      'id': trip.id,
      'source': trip.source,
      'destination': trip.destination,
      'sourceDock': trip.sourceDock,
      'destinationDock': trip.destinationDock,
      'departure': trip.departure?.toIso8601String(),
      'arrival': trip.arrival?.toIso8601String(),
      'shuttle': trip.shuttle,
      'ticketPrice': trip.ticketPrice,
    };
  }

  @override
  String toString() {
    return 'Trip{id: $id, source: $source, destination: $destination, sourceDock: $sourceDock, destinationDock: $destinationDock, departure: $departure, arrival: $arrival, shuttle: $shuttle, ticketPrice: $ticketPrice}';
  }
}
