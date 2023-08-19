using intergalactica.Models;
using intergalactica.Services;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace intergalactica.Controllers;

[Route("api/[controller]")]
[ApiController]
public class BookingController : ControllerBase
{
    private readonly BookingService _bookingService;

    public BookingController(BookingService bookingService)
    {
        _bookingService = bookingService;
    }

    [HttpGet("user/{userId}")]
    public ActionResult<IEnumerable<Booking>> GetUserBookings(string userId)
    {
        return Ok(_bookingService.GetByUser(userId));
    }

    [HttpPost("add")]
    public ActionResult AddBooking(Booking booking)
    {
        _bookingService.Create(booking);
        return NoContent();
    }

    [HttpPatch]
    public ActionResult PatchBooking(string id, [FromBody] JsonPatchDocument<Booking> patchDoc)
    {
        if (patchDoc == null)
        {
            return BadRequest();
        }

        var booking = _bookingService.Get(id);
        if (booking == null)
        {
            return NotFound();
        }

        patchDoc.ApplyTo(booking);

        _bookingService.Update(id, booking);
        return NoContent();
    }

}