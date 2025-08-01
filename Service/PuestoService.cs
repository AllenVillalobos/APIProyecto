namespace APIProyecto.Service
{
    public class PuestoService
    {
        private readonly string _connectionString;
        public PuestoService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }

    }
}
