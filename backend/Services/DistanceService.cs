using intergalactica.Models;
using MongoDB.Bson;
using MongoDB.Driver;

namespace intergalactica.Services;

public class DistanceService
{
    private readonly IMongoCollection<Distance> _distances;

    public DistanceService(IAtlasDbSettings settings, IMongoClient client)
    {
        var database = client.GetDatabase(settings.DatabaseName);
        _distances = database.GetCollection<Distance>("distances");
    }

    //get distance between two planets
    public Distance GetDistanceBetween(string source, string destination)
    {
        var distance = _distances.Find(distance => distance.Source == new ObjectId(source) && distance.Destination == new ObjectId(destination)).FirstOrDefault() ??
                       _distances.Find(distance => distance.Source == new ObjectId(destination) && distance.Destination == new ObjectId(source)).FirstOrDefault();
        if (distance == null)
        {
            throw new Exception("Distance not found.");
        }
        return distance;
    }

}