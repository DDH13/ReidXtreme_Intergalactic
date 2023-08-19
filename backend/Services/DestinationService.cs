using intergalactica.Models;
using MongoDB.Driver;

namespace intergalactica.Services;

public class DestinationService
{
    private readonly IMongoCollection<Destination> _destinations;

    public DestinationService(IAtlasDbSettings settings, IMongoClient client)
    {
        var database = client.GetDatabase(settings.DatabaseName);
        _destinations = database.GetCollection<Destination>("destinations");
    }

    public List<Destination> Get() =>
        _destinations.Find(destination => true).ToList();

    public Destination Get(string id)
    {
        var destinations = _destinations.Find(destination => destination.Id == id).FirstOrDefault();
        if (destinations == null)
        {
            throw new Exception("Destination not found");
        }

        return destinations;
    }

    public List<String> GetDocks(string id)
    {
        if (Get(id) == null)
        {
            throw new Exception("Invalid Destination");
        }

        var docks = _destinations.Find(destination => destination.Id == id).FirstOrDefault()?.Docks ??
                    new List<string>();
        if (docks.Count == 0)
        {
            throw new Exception("No docks found");
        }

        return docks;
    }

    public void Create(Destination destination) => _destinations.InsertOne(destination);
}