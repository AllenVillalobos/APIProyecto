using APIProyecto.Models;
using System.Data.SqlClient;

namespace APIProyecto.Service
{
    public class LiquidacionService
    {
        private readonly string _connectionString;
        public LiquidacionService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Conexion");
        }
        public async Task<Liquidacion> CrearLiquidacion(int idEmplado, DateTime FechaSalida)
        {
            Liquidacion liquidacion = null;
            using (SqlConnection conexion = new SqlConnection(_connectionString))
            {
                using (SqlCommand comando = new SqlCommand("spGenerarLiquidacionEmpleado", conexion))
                {
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@pIdEmpleado", idEmplado);
                    comando.Parameters.AddWithValue("@pFechaSalida", FechaSalida);
                    await conexion.OpenAsync();
                    try
                    {
                        using (var lector = await comando.ExecuteReaderAsync())
                        {
                            while (await lector.ReadAsync())
                            {
                                liquidacion = new Liquidacion
                                {
                                    idEmpleado = Convert.ToInt32(lector["idEmpleado"]),
                                    salarioMensual = lector["salarioMensual"] != DBNull.Value ? Convert.ToSingle(lector["SalarioMensual"]) : (float?)null,
                                    salarioDiario = lector["salarioDiario"] != DBNull.Value ? Convert.ToSingle(lector["SalarioDiario"]) : (float?)null,
                                    aniosTrabajados = lector["aniosTrabajados"] != DBNull.Value ? Convert.ToSingle(lector["AniosTrabajados"]) : (float?)null,
                                    vacacionesProporcionales = lector["vacacionesProporcionales"] != DBNull.Value ? Convert.ToSingle(lector["VacacionesProporcionales"]) : (float?)null,
                                    aguinaldoProporcional = lector["aguinaldoProporcional"] != DBNull.Value ? Convert.ToSingle(lector["AguinaldoProporcional"]) : (float?)null,
                                    montoPreaviso = lector["montoPreaviso"] != DBNull.Value ? Convert.ToSingle(lector["MontoPreaviso"]) : (float?)null,
                                    montoCesantia = lector["montoCesantia"] != DBNull.Value ? Convert.ToSingle(lector["MontoCesantia"]) : (float?)null,
                                    totalLiquidacion = lector["totalLiquidacion"] != DBNull.Value ? Convert.ToSingle(lector["TotalLiquidacion"]) : (float?)null
                                };
                            }
                        }
                        return liquidacion;
                    }
                    catch (Exception e)
                    {
                        throw new Exception("Error al crear la liquidación: " + e.Message, e);
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
