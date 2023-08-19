using intergalactica.Models;
using MongoDB.Driver;

namespace intergalactica.Services;

public class ShuttleService
{
    private readonly IMongoCollection<Shuttle> _shuttles;

    public ShuttleService(IMongoClient client, IAtlasDbSettings settings)
    {
        var database = client.GetDatabase(settings.DatabaseName);
        _shuttles = database.GetCollection<Shuttle>("shuttles");
    }

    public List<Shuttle> Get() =>
        _shuttles.Find(shuttle => true).ToList();

    public Shuttle Get(string id)
    {
        var shuttle = _shuttles.Find(shuttle => shuttle.Id == id).FirstOrDefault();
        if (shuttle == null)
        {
            throw new Exception("Shuttle not found.");
        }
        return shuttle;
    }
}