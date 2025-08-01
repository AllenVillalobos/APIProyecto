using System;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class Empleado
    {
        public int idEmpleado { get; set; }
        public string identificacion { get; set; }
        public string primerNombre { get; set; }
        public string? segundoNombre { get; set; }
        public string primerApellido { get; set; }
        public string? segundoApellido { get; set; }
        public Date fechaContratacion { get; set; }
        public float salarioBruto { get; set; }
        public int idUsuario { get; set; }
        public char activo { get; set; }
        public Date fechaAdicion { get; set; }
        public string adicionadoPor { get; set; }
        public Date? fechaModificacion { get; set; }
        public string? usuarioModificacion { get; set; }
    }
}
