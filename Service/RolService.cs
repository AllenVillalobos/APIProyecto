namespace APIProyecto.Service
{
    public class RolService
    {
        private readonly string _connectionString;

        public RolService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }

    }
}
