using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class ListaRoles
    {
        public int idRol { get; set; }
        public int? idUsuario { get; set; }
        public char? estado { get; set; }
        public string? adicionadoPor { get; set; }
        public DateTime? fechaAdicion { get; set; }
        public DateTime? fechaModificacion { get; set; }
        public string? modificadoPor { get; set; }
        public string? nombreRol { get; set; }
    }
}
