using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class HistorialSalarios
    {
        public int idHistorialSalario { get; set; }
        public float salarioAnterior { get; set; }
        public float salarioNuevo { get; set; }
        public string adicionadoPor { get; set; }
        public Date fechaAdicion { get; set; }
        public Date? fechaModificacion { get; set; }
        public string? usuarioModificacion { get; set; }
        public int idEmpleado { get; set; }
    }
}
