using System.Data.SqlClient;
using APIProyecto.Models;
namespace APIProyecto.Service
{
    public class UsuarioService
    {
        private readonly string _connectionString;
        public UsuarioService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }

        public async Task<Usuario> Login(string nombreUsuario, string contrasenna)
        {
            Usuario usuario = new Usuario();
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                using (SqlCommand comando = new SqlCommand("spLogin", conexion))
                {
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@pNombreUsuario", nombreUsuario);
                    comando.Parameters.AddWithValue("@pcontrasenna", contrasenna);

                    await conexion.OpenAsync();
                    try
                    {
                        using (var lector = await comando.ExecuteReaderAsync())
                        {
                            while (await lector.ReadAsync())
                            {
                                usuario = new Usuario()
                                {
                                    idUsuario = Convert.ToInt32(lector["idUsuario"]),
                                    nombreUsuario = Convert.ToString(lector["nombreUsuario"]),
                                    idEmpleado = Convert.ToInt32(lector["idEmpleado"]),
                                    nombreEmpleado = Convert.ToString(lector["NombreCompleto"])
                                };
                            }
                        }
                        return usuario;
                    }
                    catch (Exception e)
                    {
                        throw new Exception("Error al intentar ingresar:" + e.Message, e);
                    }
                    finally
                    {
                        await conexion.CloseAsync();
                    }
                }
            }
        }
    }
}
