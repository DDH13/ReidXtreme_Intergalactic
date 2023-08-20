namespace intergalactica.Models;

public class AtlasDbSettings: IAtlasDbSettings
{
    public string ConnectionString { get; set; }
    public string DatabaseName { get; set; }
}