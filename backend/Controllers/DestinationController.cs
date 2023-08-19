using intergalactica.Models;
using intergalactica.Services;
using Microsoft.AspNetCore.Mvc;

namespace intergalactica.Controllers;

[Route("api/[controller]")]
[ApiController]
public class DestinationController : ControllerBase
{
    private readonly DestinationService _destinationService;

    public DestinationController(DestinationService destinationService)
    {
        _destinationService = destinationService;
    }

    [HttpGet]
    public ActionResult<List<Destination>> GetDestinations()
    {
        var destinations = _destinationService.Get();
        return destinations;
    }

    [HttpGet("{id}")]
    public ActionResult<Destination> GetDestination(string id)
    {
        var destination = _destinationService.Get(id);
        return destination;
    }

    [HttpGet("docks/{id}")]
    public ActionResult<List<string>> GetDestinationDocks(string id)
    {
        var docks = _destinationService.GetDocks(id);
        return docks;
    }
}