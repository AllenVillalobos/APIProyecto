using APIProyecto.Models;
using APIProyecto.Service;
using Microsoft.AspNetCore.Mvc;

namespace APIProyecto.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ConstanciaSalarialController : ControllerBase
    {
        private readonly ConstanciaSalarialService _constanciaSalariaService;
        public ConstanciaSalarialController(ConstanciaSalarialService constanciaSalariaService)
        {
            _constanciaSalariaService = constanciaSalariaService;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ConstanciaSalarial>> CrearSolicitud(int id)
        {
            var constanciaSalarial = await _constanciaSalariaService.CrearSolicitud(id);
            if (constanciaSalarial == null)
            {
                return NotFound("No se encontró la constancia salarial para el empleado con ID: " + id);
            }
            return Ok(constanciaSalarial);
        }
    }
}
