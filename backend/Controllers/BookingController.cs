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

    [HttpGet("{id}", Name = "GetBooking")]
    public ActionResult<IEnumerable<Booking>> Get()
    {
        try
        {
            return Ok(_bookingService.Get());
        } catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpGet("user/{userId}")]
    public ActionResult<IEnumerable<Booking>> GetUserBookings(string userId)
    {
        try
        {
            return Ok(_bookingService.GetByUser(userId));
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpPost("add")]
    public ActionResult AddBooking(Booking booking)
    {
        _bookingService.Create(booking);
        return NoContent();
    }

    [HttpDelete("{id}")]
    public ActionResult DeleteBooking(string id)
    {
        _bookingService.Remove(id);
        return NoContent();
    }

    [HttpPatch("{id}", Name = "PatchBooking")]
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

        patchDoc.ApplyTo(booking, ModelState);

        _bookingService.Update(id, booking);
        if (!ModelState.IsValid)
        {
            return BadRequest(ModelState);
        }

        return Ok();
    }
}