using APIProyecto.Models;
using APIProyecto.Service;
using Microsoft.AspNetCore.Mvc;


namespace APIProyecto.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SolicitudVacacionesController : Controller
    {
        private readonly SolicitudVacacionesService _solicitudVacacionesService;

        public SolicitudVacacionesController(SolicitudVacacionesService solicitudVacacionesService)
        {
            _solicitudVacacionesService = solicitudVacacionesService;
        }

        [HttpGet]
        public async Task<ActionResult<List<SolicitudVacaciones>>> OptenerSolicitudVacaciones()
        {
            var solicitudes = await _solicitudVacacionesService.ObtenerSolicitudes();
            if (solicitudes == null || !solicitudes.Any())
            {
                return NotFound("No se encontraron solicitudes de vacaciones");
            }
            return Ok(solicitudes);
        }

        [HttpPost]
        public async Task<ActionResult> CrearSolicitudVacaciones([FromBody] SolicitudVacaciones solicitudVacaciones)
        {
            await _solicitudVacacionesService.CrearSolicitudVacaciones(solicitudVacaciones);
            return Ok("Solicitud de vacaciones creada exitosamente");
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> ActualizarSolicitudVacaciones(int id, [FromBody] SolicitudVacaciones solicitudVacaciones)
        {
            if (id != solicitudVacaciones.idSolicitudVacaciones)
            {
                return BadRequest("El ID de la solicitud no coincide");
            }
            var solicitudExistente = await _solicitudVacacionesService.ModificarSolicitudVacaciones(solicitudVacaciones);
            if (!solicitudExistente)
            {
                return NotFound("Solicitud de vacaciones no encontrada");
            }
            return Ok("Solicitud de vacaciones actualizada exitosamente");
        }

    }
}
