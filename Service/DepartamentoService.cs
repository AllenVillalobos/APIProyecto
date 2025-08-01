namespace APIProyecto.Service
{
    public class DepartamentoService
    {
        private readonly string _connectionString;

        public DepartamentoService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }
    }
}
