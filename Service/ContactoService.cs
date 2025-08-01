namespace APIProyecto.Service
{
    public class ContactoService
    {
        private readonly string _connectionString;

        public ContactoService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }
    }
}
