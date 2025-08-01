using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class Usuario
    {
        public int idUsuario { get; set; }
        public string nombreUsuario { get; set; }
        public string contrasenna { get; set; }
        public string adicionadoPor { get; set; }
        public Date fechaAdicion { get; set; }
        public Date? fechaModificacion { get; set; }
        public string? modificadoPor { get; set; }
    }
}
