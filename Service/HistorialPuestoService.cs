namespace APIProyecto.Service
{
    public class HistorialPuestoService
    {
        private readonly string _connectionString;

        public HistorialPuestoService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }
    }
}
