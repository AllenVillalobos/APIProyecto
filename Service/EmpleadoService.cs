using APIProyecto.Models;
using System.Data.SqlClient;

namespace APIProyecto.Service
{
    public class EmpleadoService
    {
        private readonly string _connectionString;

        public EmpleadoService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }

        public async Task<List<Empleado>> ObtenerEmpleados()
        {
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                using (SqlCommand comando = new SqlCommand("spListarEmpleados", conexion))
                {
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    await conexion.OpenAsync();
                    try
                    {
                        List<Empleado> empleados = new List<Empleado>();
                        using (var lector = await comando.ExecuteReaderAsync())
                        {
                            while (await lector.ReadAsync())
                            {
                                Empleado empleado = new Empleado
                                {
                                    idEmpleado = Convert.ToInt32(lector["idEmpleado"]),
                                    identificacion = lector["Identificacion"].ToString(),
                                    nombreCompleto = lector["NombreCompleto"].ToString(),
                                    salarioBruto = lector["SalarioBruto"] != DBNull.Value ? Convert.ToSingle(lector["SalarioBruto"]) : (float?)null,
                                    nombreDepartamento = lector["Departamento"].ToString(),
                                    nombreJornada = lector["Jornada"].ToString(),
                                    nombrePuesto = lector["Puesto"].ToString()
                                };
                                empleados.Add(empleado);
                            }
                        }
                        return empleados;
                    }
                    catch (Exception e)
                    {
                        throw new Exception("Error al obtener los empleados: " + e.Message, e);
                    }
                    finally
                    {
                        await conexion.CloseAsync();
                    }

                }
            }
        }

        public async Task<Empleado> ObtenerEmpleadoPorId(int idEmpleado)
        {
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                using (SqlCommand comando = new SqlCommand("spListarEmpleado", conexion))
                {
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@pIdEmpleado", idEmpleado);
                    await conexion.OpenAsync();
                    Empleado empleado = null;
                    try
                    {
                        using (var lector = await comando.ExecuteReaderAsync())
                        {
                            if (await lector.ReadAsync())
                            {
                                empleado = new Empleado
                                {
                                    idEmpleado = Convert.ToInt32(lector["idEmpleado"]),
                                    identificacion = lector["Identificacion"].ToString(),
                                    nombreCompleto = lector["NombreCompleto"].ToString(),
                                    salarioBruto = lector["SalarioBruto"] != DBNull.Value ? Convert.ToSingle(lector["SalarioBruto"]) : (float?)null,
                                    nombreDepartamento = lector["Departamento"].ToString(),
                                    nombreJornada = lector["Jornada"].ToString(),
                                    nombrePuesto = lector["Puesto"].ToString()
                                };
                            }
                        }
                        return empleado;
                    }
                    catch (Exception e)
                    {
                        throw new Exception("Error al obtener el Empleado: " + e.Message, e);
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