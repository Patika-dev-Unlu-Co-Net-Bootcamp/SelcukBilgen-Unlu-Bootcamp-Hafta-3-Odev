using System;
using System.ComponentModel.DataAnnotations;

namespace PatikaDev.Models
{
    public class Attendance
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
        public byte CourseId { get; set; }
        public Course Course { get; set; }
        [DataType(DataType.Date)] public DateTime EducationDay { get; set; }
        public bool Status { get; set; }
    }
}