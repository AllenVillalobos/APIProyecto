using APIProyecto.Models;
using APIProyecto.Service;
using Microsoft.AspNetCore.Mvc;

namespace APIProyecto.Controllers
{
    [ApiController]
    [Route("proyecto/[controller]")]
    public class ListaRolesController : Controller
    {
        private readonly ListaRolesService _listaRolesService;

        public ListaRolesController(ListaRolesService listaRolesService)
        {
            _listaRolesService = listaRolesService;
        }
        [HttpGet]
        public async Task<ActionResult<List<ListaRoles>>> OptenerListaRolesPorUsuario(int idUsuario)
        {
            var roles = await _listaRolesService.ObtenerListaRolesPorUsuario(idUsuario);
            if (roles == null || !roles.Any())
            {
                return NotFound("No se encontraron roles");
            }
            return Ok(roles);
        }
    }
}
