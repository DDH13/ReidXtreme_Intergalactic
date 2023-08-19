using intergalactica.Models;
using intergalactica.Services;
using Microsoft.AspNetCore.Mvc;

namespace intergalactica.Controllers;

[Route("api/[controller]")]
[ApiController]
public class ShuttleController : ControllerBase
{
    private readonly ShuttleService _shuttleService;

    public ShuttleController(ShuttleService shuttleService)
    {
        _shuttleService = shuttleService;
    }

    [HttpGet]
    public ActionResult<IEnumerable<Shuttle>> Get()
    {
        return Ok(_shuttleService.Get());
    }

    [HttpGet("{id}")]
    public ActionResult<Shuttle> Get(string id)
    {
        var shuttle = _shuttleService.Get(id);

        if (shuttle == null)
        {
            return NotFound();
        }

        return shuttle;
    }
}