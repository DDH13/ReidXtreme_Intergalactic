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

    public Destination Get(string id) =>
        _destinations.Find(destination => destination.Id == id).FirstOrDefault();

    public List<String> GetDocks(string id) =>
        _destinations.Find(destination => destination.Id == id).FirstOrDefault()?.Docks ?? new List<string>();
}