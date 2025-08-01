using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class Departamento
    {
        public int idDepartamento { get; set; }
        public string nombre { get; set; }
        public string? descripcion { get; set; }
        public char estado { get; set; }
        public string adicionadoPor { get; set; }
        public Date fechaAdicion { get; set; }
        public Date? fechaModificacion { get; set; }
        public string? usuarioModificacion { get; set; }
    }
}
