using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class HistorialPuesto
    {
        public int idEmpleado { get; set; }
        public int idPuesto { get; set; }
        public char estado { get; set; }
        public string adicionadoPor { get; set; }
        public Date fechaAdicion { get; set; }
        public Date? fechaModificacion { get; set; }
        public string? modificadoPor { get; set; }
    }
}
