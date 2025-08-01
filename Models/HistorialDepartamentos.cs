using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class HistorialDepartamentos
    {
        public int idEmpleado { get; set; }
        public int idDepartamento { get; set; }
        public char estado { get; set; }
        public string adicionadoPor { get; set; }
        public Date fechaAdicion { get; set; }
        public Date fechaModificacion { get; set; }
        public string modificadoPor { get; set; }
    }
}
