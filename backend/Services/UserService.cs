using intergalactica.Models;
using MongoDB.Driver;

namespace intergalactica.Services;

public class UserService : IUserService
{
    private readonly IMongoCollection<User> _users;

    public UserService(IAtlasDbSettings settings, IMongoClient client)
    {
        var database = client.GetDatabase(settings.DatabaseName);
        _users = database.GetCollection<User>("users");
    }

    public List<User> Get() =>
        _users.Find(user => true).ToList();

}
