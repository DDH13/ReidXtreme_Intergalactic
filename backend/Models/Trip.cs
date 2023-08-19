using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace intergalactica.Models;

public class Trip
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string Id { get; set; } = string.Empty;

    [BsonElement("source")]
    public ObjectId Source { get; set; } = new ObjectId(string.Empty);
    [BsonElement("destination")]
    public ObjectId Destination { get; set; } = new ObjectId(string.Empty);
    [BsonElement("source_dock")]
    public String SourceDock { get; set; } = string.Empty;
    [BsonElement("destination_dock")]
    public String DestinationDock { get; set; } = string.Empty;
    [BsonElement("shuttle")]
    public ObjectId Shuttle { get; set; } = new ObjectId(string.Empty);
    [BsonElement("ticket_price")]
    public float TicketPrice { get; set; } = 0;

    //year is irrelevant, storing as a DateTime for ease of use
    //recurring trips will have the same date and time every year

    [BsonElement("departure")]
    public DateTime Departure { get; set; } = DateTime.MinValue;
    [BsonElement("arrival")]
    public DateTime Arrival { get; set; } = DateTime.MinValue;


}