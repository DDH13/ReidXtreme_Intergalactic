using intergalactica.Models;
using intergalactica.Services;
using Microsoft.AspNetCore.Mvc;

namespace intergalactica.Controllers;

[Route("api/[controller]")]
[ApiController]
public class TripController : ControllerBase
{
    private readonly TripService _tripService;
    private readonly DistanceService _distanceService;
    private readonly DestinationService _destinationService;

    public TripController(TripService tripService, DistanceService distanceService,
        DestinationService destinationService)
    {
        _tripService = tripService;
        _distanceService = distanceService;
        _destinationService = destinationService;
    }

    [HttpGet("id/{id}")]
    public ActionResult<Trip> Get(string id)
    {
        var trip = _tripService.Get(id);

        if (trip == null)
        {
            return NotFound();
        }

        return trip;
    }

    [HttpGet("source/{source}")]
    public ActionResult<List<Trip>> GetBySource(string source)
    {
        var trips = _tripService.GetBySource(source);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }

    [HttpGet("destination/{destination}")]
    public ActionResult<List<Trip>> GetByDestination(string destination)
    {
        var trips = _tripService.GetByDestination(destination);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }

    [HttpGet("source/{source}/destination/{destination}")]
    public ActionResult<List<Trip>> GetBySourceAndDestination(string source, string destination)
    {
        var trips = _tripService.GetBySourceAndDestination(source, destination);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }

    [HttpGet("departure/{departure1}/{departure2}")]
    public ActionResult<List<Trip>> GetByDepartureDate(DateTime departure1, DateTime departure2)
    {
        var trips = _tripService.GetByDepartureDate(departure1, departure2);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }

    [HttpGet("arrival/{arrival1}/{arrival2}")]
    public ActionResult<List<Trip>> GetByArrivalDate(DateTime arrival1, DateTime arrival2)
    {
        var trips = _tripService.GetByArrivalDate(arrival1, arrival2);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }

    [HttpGet("departure/{departure1}/{departure2}/arrival/{arrival1}/{arrival2}")]
    public ActionResult<List<Trip>> GetByDepartureAndArrival(DateTime arrival1, DateTime arrival2, DateTime departure1,
        DateTime departure2)
    {
        var trips = _tripService.GetByDepartureAndArrival(arrival1, arrival2, departure1, departure2);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }

    [HttpGet("cost/{id}")]
    public ActionResult<float> GetCost(string id, int adults, int children)
    {
        var cost = _tripService.GetCost(id, adults, children);

        if (cost == 0)
        {
            return NotFound();
        }

        return cost;
    }

    [HttpGet("distance/{source}/{destination}")]
    public ActionResult<float> GetDistance(string source, string destination)
    {
        var distance = _distanceService.GetDistanceBetween(source, destination);
        return distance.DistanceLm;
    }

    [HttpGet("destination")]
    public ActionResult<List<Destination>> GetDestinations()
    {
        var destinations = _destinationService.Get();
        return destinations;
    }

    [HttpGet("destination/{id}")]
    public ActionResult<Destination> GetDestination(string id)
    {
        var destination = _destinationService.Get(id);
        return destination;
    }

    [HttpGet("destination/docks/{id}")]
    public ActionResult<List<string>> GetDestinationDocks(string id)
    {
        var docks = _destinationService.GetDocks(id);
        return docks;
    }
}