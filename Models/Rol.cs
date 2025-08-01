using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class Rol
    {
        public int idRol { get; set; }
        public string nombreRol { get; set; }
        public string? descripcionRol { get; set; }
        public string adicionadoPor { get; set; }
        public Date fechaAdicion { get; set; }
        public Date? fechaModificacion { get; set; }
        public string? modificadoPor { get; set; }
    }
}
