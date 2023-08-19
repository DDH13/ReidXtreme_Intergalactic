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
        try
        {
            var shuttle = _shuttleService.Get(id);
            return shuttle;
        } catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpPost]
    public ActionResult<Shuttle> Create(Shuttle shuttle)
    {
        _shuttleService.Create(shuttle);
        return NoContent();
    }
}