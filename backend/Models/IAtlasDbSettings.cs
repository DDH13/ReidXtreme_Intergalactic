namespace intergalactica.Models;

public interface IAtlasDbSettings
{
    string ConnectionString { get; set; }
    string DatabaseName { get; set; }
}