using intergalactica.Models;
using MongoDB.Bson;
using MongoDB.Driver;

namespace intergalactica.Services;

public class BookingService
{
    private readonly IMongoCollection<Booking> _bookings;

    public BookingService(IAtlasDbSettings settings, IMongoClient client)
    {
        var database = client.GetDatabase(settings.DatabaseName);
        _bookings = database.GetCollection<Booking>("bookings");
    }

    public List<Booking> Get() =>
        _bookings.Find(booking => true).ToList();

    public Booking Get(string id)
    {
        var booking = _bookings.Find(booking => booking.Id == id).FirstOrDefault();
        if (booking == null)
        {
            throw new Exception("Booking not found");
        }

        return booking;
    }

    public List<Booking> GetByUser(string userId)
    {
        var bookings = _bookings.Find(booking => booking.User == userId).ToList();
        if (bookings.Count == 0)
        {
            throw new Exception("No bookings found");
        }

        return bookings;
    }

    public Booking Create(Booking booking)
    {
        _bookings.InsertOne(booking);
        return booking;
    }

    public void Update(string id, Booking bookingIn) =>
        _bookings.ReplaceOne(booking => booking.Id == id, bookingIn);

    public void Remove(string id) =>
        _bookings.DeleteOne(booking => booking.Id == id);
}