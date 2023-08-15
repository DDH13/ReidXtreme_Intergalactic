using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace intergalactica.Models;

public class Destination
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string Id { get; set; } = string.Empty;

    [BsonElement("name")] public string Name { get; set; } = string.Empty;
    [BsonElement("description")] public string Description { get; set; } = string.Empty;
    [BsonElement("image")] public string Image { get; set; } = string.Empty;
    [BsonElement("distance")] public int Distance { get; set; } = 0;


}