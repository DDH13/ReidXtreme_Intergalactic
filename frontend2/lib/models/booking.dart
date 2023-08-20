class Booking {
  String? id;
  String? source;
  String? destination;
  String? sourceDock;
  String? destinationDock;
  DateTime? departure;
  DateTime? arrival;
  bool? returnTrip;
  DateTime? departureReturn;
  DateTime? arrivalReturn;
  String? user;
  String? shuttle;
  int? adults;
  int? children;
  double? price;
  double? discount;
  double? total;
  bool? paid;

  Booking({
    this.id,
    this.source,
    this.destination,
    this.sourceDock,
    this.destinationDock,
    this.departure,
    this.arrival,
    this.returnTrip,
    this.departureReturn,
    this.arrivalReturn,
    this.user,
    this.shuttle,
    this.adults,
    this.children,
    this.price,
    this.discount,
    this.total,
    this.paid,
  });

  static Booking fromJson(jsonDecode) {
    return Booking(
      id: jsonDecode['id'],
      source: jsonDecode['source'],
      destination: jsonDecode['destination'],
      sourceDock: jsonDecode['sourceDock'],
      destinationDock: jsonDecode['destinationDock'],
      departure: DateTime.parse(jsonDecode['departure']),
      arrival: DateTime.parse(jsonDecode['arrival']),
      returnTrip: jsonDecode['returnTrip'],
      departureReturn: DateTime.parse(jsonDecode['departureReturn']),
      arrivalReturn: DateTime.parse(jsonDecode['arrivalReturn']),
      user: jsonDecode['user'],
      shuttle: jsonDecode['shuttle'],
      adults: jsonDecode['adults'],
      children: jsonDecode['children'],
      price: jsonDecode['price'],
      discount: jsonDecode['discount'],
      total: jsonDecode['total'],
      paid: jsonDecode['paid'],
    );
  }

  static Map<String, dynamic> toJson(Booking booking) {
    return {
      'source': booking.source,
      'destination': booking.destination,
      'sourceDock': booking.sourceDock,
      'destinationDock': booking.destinationDock,
      'departure': booking.departure?.toIso8601String(),
      'arrival': booking.arrival?.toIso8601String(),
      'returnTrip': booking.returnTrip,
      'departureReturn': booking.departureReturn?.toIso8601String(),
      'arrivalReturn': booking.arrivalReturn?.toIso8601String(),
      'user': booking.user,
      'shuttle': booking.shuttle,
      'adults': booking.adults,
      'children': booking.children,
      'price': booking.price,
      'discount': booking.discount,
      'total': booking.total,
      'paid': booking.paid,
    };
  }

  @override
  String toString() {
    return '\nBooking{id: $id, source: $source, destination: $destination, sourceDock: $sourceDock, destinationDock: $destinationDock, departure: $departure, arrival: $arrival, returnTrip: $returnTrip, departureReturn: $departureReturn, arrivalReturn: $arrivalReturn, user: $user, shuttle: $shuttle, adults: $adults, children: $children, price: $price, discount: $discount, total: $total, paid: $paid}\n';
  }
}
