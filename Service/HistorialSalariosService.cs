namespace APIProyecto.Service
{
    public class HistorialSalariosService
    {
        private readonly string _connectionString;

        public HistorialSalariosService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }
    }
}
