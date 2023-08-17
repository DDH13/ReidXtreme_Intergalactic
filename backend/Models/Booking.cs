using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace intergalactica.Models;

public class Booking
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string Id { get; set; } = string.Empty;

    [BsonElement("source")] public ObjectId Source { get; set; } = new ObjectId(string.Empty);
    [BsonElement("destination")] public ObjectId Destination { get; set; } = new ObjectId(string.Empty);
    [BsonElement("source_dock")] public String SourceDock { get; set; } = string.Empty;
    [BsonElement("destination_dock")] public String DestinationDock { get; set; } = string.Empty;

    [BsonElement("departure")] public DateTime Departure { get; set; } = DateTime.MinValue;
    [BsonElement("arrival")] public DateTime Arrival { get; set; } = DateTime.MinValue;
    [BsonElement("return")] public bool Return { get; set; } = false;
    [BsonElement("departure_return")] public DateTime DepartureReturn { get; set; } = DateTime.MinValue;
    [BsonElement("arrival_return")] public DateTime ArrivalReturn { get; set; } = DateTime.MinValue;

    [BsonElement("user")] public ObjectId User { get; set; } = new ObjectId(string.Empty);
    [BsonElement("shuttle")] public ObjectId Shuttle { get; set; } = new ObjectId(string.Empty);
    [BsonElement("adults")] public int Adults { get; set; } = 0;
    [BsonElement("children")] public int Children { get; set; } = 0;

    [BsonElement("price")] public float Price { get; set; } = 0;
    [BsonElement("discount")] public float Discount { get; set; } = 0;
    [BsonElement("total")] public float Total { get; set; } = 0;
    [BsonElement("paid")] public bool Paid { get; set; } = false;


}