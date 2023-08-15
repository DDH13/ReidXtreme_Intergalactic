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
    [BsonElement("departure")] public DateTime Departure { get; set; } = DateTime.Now;
    [BsonElement("arrival")] public DateTime Arrival { get; set; } = DateTime.Now;
}