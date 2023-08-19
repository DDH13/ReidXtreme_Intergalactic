using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace intergalactica.Models;

public class Distance
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string Id { get; set; } = string.Empty;

    [BsonElement("source")] public ObjectId Source { get; set; } = new ObjectId(string.Empty);
    [BsonElement("destination")] public ObjectId Destination { get; set; } = new ObjectId(string.Empty);
    //Distance in light minutes
    [BsonElement("distance")] public float DistanceLm { get; set; } = 0;

}