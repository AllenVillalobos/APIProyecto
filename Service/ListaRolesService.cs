using APIProyecto.Models;
using System.Data.SqlClient;

namespace APIProyecto.Service
{
    public class ListaRolesService
    {
        private readonly string _connectionString;

        public ListaRolesService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }

        public async Task<List<ListaRoles>> ObtenerListaRolesPorUsuario(int idUsuario)
        {
            List<ListaRoles> listaRoles = new List<ListaRoles>();
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                using (SqlCommand comando = new SqlCommand("spListarPermisosPorUsuario", conexion))
                {
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@pidUsuario", idUsuario);

                    await conexion.OpenAsync();
                    try
                    {
                        using (var lector = await comando.ExecuteReaderAsync())
                        {
                            while (await lector.ReadAsync())
                            {
                                ListaRoles listaRole = new ListaRoles()
                                {
                                    nombreRol = Convert.ToString(lector["nombreRol"])
                                };
                                listaRoles.Add(listaRole);
                            }
                        }
                        return listaRoles;
                    }
                    catch (Exception e)
                    {
                        throw new Exception("Error al optener los permisos del usuario: " + e.Message, e);
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
