using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class SolicitudVacaciones
    {
        public int idSolicitudVacaciones { get; set; }
        public string? detalle { get; set; }
        public string? estado { get; set; }
        public string? revisadoPor { get; set; }
        public DateTime? fechaRevision { get; set; }
        public DateTime? fechaAdicion { get; set; }
        public string? adicionadoPor { get; set; }
        public DateTime? fechaModificacion { get; set; }
        public string? usuarioModificacion { get; set; }
        public int? idEmpleado { get; set; }
        public string? empleadoNombre { get; set; }
    }
}
