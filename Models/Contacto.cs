using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class Contacto
    {
        public int idContacto { get; set; }
        public string tipoContacto { get; set; }
        public string infoContacto { get; set; }
        public string adicionadoPor { get; set; }
        public Date fechaAdicion { get; set; }
        public Date? fechaModificacion { get; set; }
        public string? usuarioModificacion { get; set; }
        public int idEmpleado { get; set; }
    }
