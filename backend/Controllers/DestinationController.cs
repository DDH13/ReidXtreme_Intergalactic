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
        try
        {
            var destination = _destinationService.Get(id);
            return destination;
        } catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpGet("docks/{id}")]
    public ActionResult<List<string>> GetDestinationDocks(string id)
    {
        try
        {
            var docks = _destinationService.GetDocks(id);
            return docks;
        } catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpPost]
    public ActionResult<Destination> CreateDestination(Destination destination)
    {
        _destinationService.Create(destination);
        return NoContent();
    }
}