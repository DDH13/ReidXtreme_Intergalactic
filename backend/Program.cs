using intergalactica.Models;
using intergalactica.Services;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddScoped<IUserService, UserService>();

builder.Services.Configure<AtlasDbSettings>(
    builder.Configuration.GetSection(nameof(AtlasDbSettings)));
builder.Services.AddSingleton<IAtlasDbSettings>(sp =>
    sp.GetRequiredService<IOptions<AtlasDbSettings>>().Value);
builder.Services.AddSingleton<IMongoClient>(_ =>
    new MongoClient(builder.Configuration.GetValue<string>("AtlasDbSettings:ConnectionString")));

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();