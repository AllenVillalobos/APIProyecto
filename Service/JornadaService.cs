namespace APIProyecto.Service
{
    public class JornadaService
    {
        private readonly string _connectionString;

        public JornadaService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }
    }
}
