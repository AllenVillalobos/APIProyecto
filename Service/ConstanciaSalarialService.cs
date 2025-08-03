using APIProyecto.Models;
using System.Data.SqlClient;

namespace APIProyecto.Service
{
    public class ConstanciaSalarialService
    {
        public readonly string _connectionString;
        public ConstanciaSalarialService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }

        public async Task<ConstanciaSalarial> CrearSolicitud(int id)
        {
            ConstanciaSalarial constanciaSalarial = null;
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                using (SqlCommand comando = new SqlCommand("spConstanciaSalarial", conexion))
                {
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@pIdEmpleado", id);
                    await conexion.OpenAsync();
                    try
                    {
                        using (var lector = await comando.ExecuteReaderAsync())
                        {
                            while(await lector.ReadAsync())
                            {
                                constanciaSalarial = new ConstanciaSalarial
                                {
                                    idEmpleado = Convert.ToInt32(lector["idEmpleado"]),
                                    salarioBruto = lector["SalarioBruto"] != DBNull.Value ? Convert.ToSingle(lector["SalarioBruto"]) : (float?)null,
                                    nombreCompleto = lector["NombreCompleto"].ToString(),
                                    identificacion = lector["Identificacion"].ToString(),
                                    puesto = lector["Puesto"].ToString(),
                                    departamento = lector["Departamento"].ToString(),
                                    fechaContratacion = lector["FechaContratacion"] != DBNull.Value ? Convert.ToDateTime(lector["FechaContratacion"]) : (DateTime?)null,
                                    activo = lector["Activo"] != DBNull.Value ? Convert.ToChar(lector["Activo"]) : (char?)null,
                                    tipoContrato = lector["TipoContrato"].ToString()
                                };
                            }
                        }
                        return constanciaSalarial;
                    }
                    catch (Exception e)
                    {
                        throw new Exception("Error al crear la solicitud de constancia salarial: " + e.Message, e);
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
