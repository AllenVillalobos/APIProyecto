using APIProyecto.Models;
using System.Data.SqlClient;

namespace APIProyecto.Service
{
    public class SolicitudVacacionesService
    {
        private readonly string _connectionString;

        public SolicitudVacacionesService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }

        public async Task<List<SolicitudVacaciones>> ObtenerSolicitudes()
        {
            List<SolicitudVacaciones> solicitudes = new List<SolicitudVacaciones>();
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                using (SqlCommand comando = new SqlCommand("spListarSolicitudVacaciones", conexion))
                {
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    await conexion.OpenAsync();
                    try
                    {
                        using (var lector = await comando.ExecuteReaderAsync())
                        {
                            while (await lector.ReadAsync())
                            {
                                SolicitudVacaciones solicitudVacaciones = new SolicitudVacaciones
                                {
                                    idSolicitudVacaciones = Convert.ToInt32(lector["idSolicitudVacaciones"]),
                                    detalle = lector["detalle"].ToString(),
                                    estado = lector["estado"].ToString(),
                                    fechaAdicion = Convert.ToDateTime(lector["FechaCreacion"]),
                                    empleadoNombre = Convert.ToString(lector["NombreCompleto"]),
                                    revisadoPor = lector["revisadoPor"] != DBNull.Value ? lector["revisadoPor"].ToString() : null,
                                    fechaRevision = lector["fechaRevision"] != DBNull.Value ? Convert.ToDateTime(lector["fechaRevision"]) : (DateTime?)null
                                };
                                solicitudes.Add(solicitudVacaciones);
                            }
                        }
                        return solicitudes;
                    }
                    catch (Exception e)
                    {
                        throw new Exception("Error al obtener las solicitudes de vacaciones: " + e.Message, e);
                    }
                    finally
                    {
                        await conexion.CloseAsync();
                    }
                }
            }
        }

        public async Task CrearSolicitudVacaciones(SolicitudVacaciones solicitudVacaciones)
        {
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                using (SqlCommand comando = new SqlCommand("spCrearSolicitudVacaciones", conexion))
                {
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@pDetalle", solicitudVacaciones.detalle);
                    comando.Parameters.AddWithValue("@pIdEmpleado", solicitudVacaciones.idEmpleado);
                    comando.Parameters.AddWithValue("@pAdicionadoPor", solicitudVacaciones.adicionadoPor);

                    await conexion.OpenAsync();
                    try
                    {
                        await comando.ExecuteNonQueryAsync();
                    }
                    catch (Exception e)
                    {
                        throw new Exception("Error al crear la solicitud de vacaciones: " + e.Message, e);
                    }
                    finally
                    {
                        await conexion.CloseAsync();
                    }
                }
            }
        }

        public async Task<bool> ModificarSolicitudVacaciones(SolicitudVacaciones solicitudVacaciones)
        {
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                using (SqlCommand comando = new SqlCommand("spModificarSolicitudVacaciones",conexion))
                {
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@pidSolicitudVacaciones",solicitudVacaciones.idSolicitudVacaciones);
                    comando.Parameters.AddWithValue("@pResolucion",solicitudVacaciones.estado);
                    comando.Parameters.AddWithValue("@pRevisadoPor", solicitudVacaciones.revisadoPor);
                    await conexion.OpenAsync();
                    try
                    {

                        int cambios = await comando.ExecuteNonQueryAsync();

                        return cambios > 0;

                    }catch (Exception e)
                    {
                        throw new Exception("Error al modificar la solicitud de vacaciones: " + e.Message, e);
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
