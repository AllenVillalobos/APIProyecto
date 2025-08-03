using System;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace APIProyecto.Models
{
    public class Empleado
    {
        public int idEmpleado { get; set; }
        public string? identificacion { get; set; }
        public string? primerNombre { get; set; }
        public string? segundoNombre { get; set; }
        public string? primerApellido { get; set; }
        public string? segundoApellido { get; set; }
        public DateTime? fechaContratacion { get; set; }
        public float? salarioBruto { get; set; }
        public int? idUsuario { get; set; }
        public char? activo { get; set; }
        public DateTime? fechaAdicion { get; set; }
        public string? adicionadoPor { get; set; }
        public DateTime? fechaModificacion { get; set; }
        public string? usuarioModificacion { get; set; }
        public string? nombreCompleto { get; set; }
        public string? nombreDepartamento { get; set; }
        public string? nombrePuesto { get; set; }
        public string? nombreJornada { get; set; }
    }
}
