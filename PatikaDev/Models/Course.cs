using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PatikaDev.Models
{
    public class Course
    {
        [Key] public byte Id { get; set; }
        [StringLength(60)] public string Name { get; set; }
        public string Description { get; set; }
        public byte HowManyWeeks { get; set; }
        [DataType(DataType.Date)] public DateTime StartingDate { get; set; }
        [DataType(DataType.Date)] public DateTime EndingDate { get; set; }

        public ICollection<UserCourse> UserCourses { get; set; }
        public ICollection<Attendance> Attendances { get; set; }
    }
}