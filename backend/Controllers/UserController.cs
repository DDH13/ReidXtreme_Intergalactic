using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using intergalactica.Models;
using intergalactica.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace intergalactica.Controllers;

[Route("api/[controller]")]
[ApiController]
public class UserController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private readonly UserService _userService;

    public UserController(UserService userService, IConfiguration configuration)
    {
        _configuration = configuration;
        _userService = userService;
    }

    [HttpGet, Authorize]
    public ActionResult<string> GetMyName()
    {
        return Ok(_userService.GetMyName());
    }

    [HttpPost("register")]
    public ActionResult<User> Register(User request)
    {
        var passwordHash = BCrypt.Net.BCrypt.HashPassword(request.Password);
        var user = new User
        {
            Username = request.Username,
            Password = passwordHash,
            FirstName = request.FirstName,
            LastName = request.LastName
        };
        _userService.Create(user);
        return Ok(user);
    }

    [HttpPost("login")]
    public ActionResult<User> Login(User request)
    {
        var users = _userService.Get();
        var user = users.FirstOrDefault(u => u.Username == request.Username);
        if (user == null)
        {
            return BadRequest("User not found.");
        }

        if (!BCrypt.Net.BCrypt.Verify(request.Password, user.Password))
        {
            return BadRequest("Wrong password.");
        }

        string token = CreateToken(user);
        return Ok(token);
    }

    private string CreateToken(User user)
    {
        var claims = new List<Claim>
        {
            new Claim(ClaimTypes.Name, user.Username),
            new Claim(ClaimTypes.NameIdentifier, user.Id),
            new Claim(ClaimTypes.Role, "User"),
        };

        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(
            _configuration.GetSection("AppSettings:Token").Value!));

        var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

        var token = new JwtSecurityToken(
            claims: claims,
            expires: DateTime.Now.AddDays(1),
            signingCredentials: creds
        );

        var jwt = new JwtSecurityTokenHandler().WriteToken(token);
        return jwt;
    }
}