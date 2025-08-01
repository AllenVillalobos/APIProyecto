namespace APIProyecto.Service
{
    public class ContratoService
    {
        private readonly string _connectionString;

        public ContratoService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }
    }
}
