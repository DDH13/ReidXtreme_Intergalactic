using System.Security.Claims;
using intergalactica.Models;
using MongoDB.Driver;

namespace intergalactica.Services;

public class UserService
{
    private readonly IMongoCollection<User> _users;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public UserService(IAtlasDbSettings settings, IMongoClient client, IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
        var database = client.GetDatabase(settings.DatabaseName);
        _users = database.GetCollection<User>("users");
    }

    public List<User> Get() =>
        _users.Find(user => true).ToList();

    public User Create(User user)
    {
        _users.InsertOne(user);
        return user;
    }

    public string GetMyName()
    {
        if (_httpContextAccessor.HttpContext is null) return "No user found";
        var result = _httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.Name);
        return result ?? "No user found";
    }

    public void Remove(User userIn) =>
        _users.DeleteOne(user => user.Id == userIn.Id);

    public User Get(string id)
    {
        var user = _users.Find(user => user.Id == id).FirstOrDefault();
        if (user == null)
        {
            throw new Exception("User not found.");
        }
        return user;
    }

}