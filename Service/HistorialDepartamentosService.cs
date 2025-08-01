namespace APIProyecto.Service
{
    public class HistorialDepartamentosService
    {
        private readonly string _connectionString;

        public HistorialDepartamentosService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }
    }
}
