namespace APIProyecto.Service
{
    public class HistorialJornadaService
    {
        private readonly string _connectionString;

        public HistorialJornadaService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }
    }
}
