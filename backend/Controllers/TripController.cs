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

    public TripController(TripService tripService, DistanceService distanceService)
    {
        _tripService = tripService;
        _distanceService = distanceService;
    }


    [HttpGet("{id}")]
    public ActionResult<Trip> Get(string id)
    {
        var trip = _tripService.Get(id);

        if (trip == null)
        {
            return NotFound();
        }

        return trip;
    }

    [HttpGet("findtrip")]
    public ActionResult<List<Trip>> Get(string source, string destination, DateTime departure)
    {
        var trips = _tripService.GetByDepartureSourceDestination(departure, source, destination);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }


    [HttpGet("findreturntrip")]
    public ActionResult<List<Trip>> GetReturnTrip(string source, string destination, DateTime arrival)
    {
        var trips = _tripService.GetByArrivalSourceDestination(arrival, source, destination);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }


    [HttpGet("source")]
    public ActionResult<List<Trip>> GetBySource(string source)
    {
        var trips = _tripService.GetBySource(source);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }

    [HttpGet("destination")]
    public ActionResult<List<Trip>> GetByDestination(string destination)
    {
        var trips = _tripService.GetByDestination(destination);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }

    [HttpGet("sourcetodest")]
    public ActionResult<List<Trip>> GetBySourceAndDestination(string source, string destination)
    {
        var trips = _tripService.GetBySourceAndDestination(source, destination);

        if (trips == null)
        {
            return NotFound();
        }

        return trips;
    }

    [HttpGet("departure")]
    public ActionResult<List<Trip>> GetByDepartureDate(DateTime departure1, DateTime departure2)
    {
        var trips = _tripService.GetByDepartureDate(departure1, departure2);

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

    [HttpPost]
    public ActionResult<Trip> Create(Trip trip)
    {
        _tripService.Create(trip);
        return NoContent();
    }
}