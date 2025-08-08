using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class Contrato
    {
        public int idContrato { get; set; }
        public string? tipoContrato { get; set; }
        public char? estadoContrato { get; set; }
        public string? adicionadoPor { get; set; }
        public DateTime? fechaAdicion { get; set; }
        public DateTime? fechaModificacion { get; set; }
        public string? usuarioModificacion { get; set; }
        public int? idEmpleado { get; set; }
    }
}
