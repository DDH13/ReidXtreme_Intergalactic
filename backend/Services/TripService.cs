﻿using intergalactica.Models;
using MongoDB.Bson;
using MongoDB.Driver;

namespace intergalactica.Services;

public class TripService
{
    private readonly IMongoCollection<Trip> _trips;

    public TripService(IMongoClient client, IAtlasDbSettings settings)
    {
        var database = client.GetDatabase(settings.DatabaseName);
        _trips = database.GetCollection<Trip>("trips");
    }

    //get all trips
    public List<Trip> Get() => _trips.Find(trip => true).ToList();

    //get trip by id
    public Trip Get(string id) => _trips.Find(trip => trip.Id == id).FirstOrDefault();

    //get trips by source
    public List<Trip> GetBySource(string source) => _trips.Find(trip => trip.Source == source).ToList();

    //get trips by destination
    public List<Trip> GetByDestination(string destination) =>
        _trips.Find(trip => trip.Destination == destination).ToList();

    //get trips by source and destination
    public List<Trip> GetBySourceAndDestination(string source, string destination) => _trips
        .Find(trip => trip.Source == source && trip.Destination == destination).ToList();

    //get trip based on departure date range
    public List<Trip> GetByDepartureDate(DateTime departure1, DateTime departure2)
    {
        //ignore year and compare only month and day
        var filter = Builders<Trip>.Filter.Where(trip =>
            trip.Departure.Month >= departure1.Month && trip.Departure.Month <= departure2.Month &&
            trip.Departure.Day >= departure1.Day && trip.Departure.Day <= departure2.Day);
        return _trips.Find(filter).ToList();
    }

    //get trip for a given arrival,source and destination
    public List<Trip> GetByArrivalSourceDestination(DateTime arrival, string source, string destination)
    {
        //ignore year and compare only month and day
        var filter = Builders<Trip>.Filter.Where(trip =>
            trip.Arrival.Month == arrival.Month && trip.Arrival.Day == arrival.Day &&
            trip.Source == source && trip.Destination == destination);
        return _trips.Find(filter).ToList();
    }

    public float GetCost(string id, int adults, int children)
    {
        var trip = _trips.Find(trip => trip.Id == id).FirstOrDefault();
        if (trip == null)
        {
            throw new Exception("Trip not found.");
        }

        var ticketPrice = trip.TicketPrice;
        return adults * ticketPrice + children * ticketPrice * 0.5f;
    }

    //get trip for a given departure,source and destination\
    public List<Trip> GetByDepartureSourceDestination(DateTime departure, string source, string destination)
    {
        //ignore year and compare only month and day
        var filter = Builders<Trip>.Filter.Where(trip =>
            trip.Departure.Month == departure.Month && trip.Departure.Day == departure.Day &&
            trip.Source == source && trip.Destination == destination);
        return _trips.Find(filter).ToList();
    }

    public void Create(Trip trip) => _trips.InsertOne(trip);

}