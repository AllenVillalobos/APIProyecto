using APIProyecto.Models;
using APIProyecto.Service;
using Microsoft.AspNetCore.Mvc;
using System.Reflection;

namespace APIProyecto.Controllers
{
    [ApiController]
    [Route("proyecto/[controller]")]
    public class LiquidacionController : Controller
    {
        private readonly LiquidacionService _liquidacionService;
        public LiquidacionController(LiquidacionService liquidacionService)
        {
            _liquidacionService = liquidacionService;
        }
        [HttpGet("{idEmpleado}/{fechaSalida}")]
        public async Task<ActionResult<Liquidacion>> CrearLiquidacion(int idEmpleado, DateOnly fechaSalida)
        {
            DateTime fechaSalidaDateTime = new DateTime(fechaSalida.Year, fechaSalida.Month, fechaSalida.Day, 0, 0, 0, 0);
            var liquidacion = await _liquidacionService.CrearLiquidacion(idEmpleado, fechaSalidaDateTime);
            if (liquidacion == null)
            {
                return NotFound("No se encontró la liquidación para el empleado con ID: " + idEmpleado);
            }
            return Ok(liquidacion);
        }
    }
}
