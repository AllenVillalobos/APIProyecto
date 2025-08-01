namespace APIProyecto.Service
{
    public class EmpleadoService
    {
        private readonly string _connectionString;

        public EmpleadoService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }
    }
}
