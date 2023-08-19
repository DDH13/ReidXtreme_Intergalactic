using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace intergalactica.Models;

public class Shuttle
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string Id { get; set; } = string.Empty;

    [BsonElement("name")] public string Name { get; set; } = string.Empty;
    [BsonElement("type")] public string Type { get; set; } = string.Empty;
    [BsonElement("capacity")] public int Capacity { get; set; } = 0;
}
