using APIProyecto.Models;
using APIProyecto.Service;
using Microsoft.AspNetCore.Mvc;

namespace APIProyecto.Controllers
{
    [ApiController]
    [Route("proyecto/[controller]")]
    public class UsuarioControler : Controller
    {
        private readonly UsuarioService _usuarioService;

        public UsuarioControler(UsuarioService usuarioService)
        {
            _usuarioService = usuarioService ;
        }
        [HttpGet]
        public async Task<ActionResult<Usuario>> GetUsuarios(string nombreUsuario, string contrasenna)
        {
            var usuarios = await _usuarioService.Login(nombreUsuario,contrasenna);
            if (usuarios == null)
            {
                return NotFound("Usuario no encontrado");
            }
            return Ok(usuarios);
        }
    }
}
