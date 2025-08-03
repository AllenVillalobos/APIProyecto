using APIProyecto.Models;
using APIProyecto.Service;
using Microsoft.AspNetCore.Mvc;

namespace APIProyecto.Controllers
{
    [ApiController]
    [Route("proyecto/[controller]")]
    public class EmpleadoController : Controller
    {
        private readonly EmpleadoService _empleadoService;

        public EmpleadoController(EmpleadoService empleadoService)
        {
            _empleadoService = empleadoService;
        }

        [HttpGet]
        public async Task<ActionResult<List<Empleado>>> ListarEmpleados()
        {
            var empleados = await _empleadoService.ObtenerEmpleados();
            if (empleados == null || !empleados.Any())
            {
                return NotFound("No se encontraron empleados");
            }
            return Ok(empleados);
        }
        [HttpGet("{idEmpleado}")]
        public async Task<ActionResult<Empleado>> ObtenerEmpleadoPorId(int idEmpleado)
        {
            var empleado = await _empleadoService.ObtenerEmpleadoPorId(idEmpleado);
            if (empleado == null)
            {
                return NotFound("Empleado no encontrado");
            }
            return Ok(empleado);
        }
    }
}
