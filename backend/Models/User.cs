using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace intergalactica.Models;

public class User
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string Id { get; set; } = string.Empty;

    [BsonElement("username")] public string Username { get; set; } = string.Empty;
    [BsonElement("password")] public string Password { get; set; } = string.Empty;

    [BsonElement("fname")] public string FirstName { get; set; } = string.Empty;
    [BsonElement("lname")] public string LastName { get; set; } = string.Empty;

}