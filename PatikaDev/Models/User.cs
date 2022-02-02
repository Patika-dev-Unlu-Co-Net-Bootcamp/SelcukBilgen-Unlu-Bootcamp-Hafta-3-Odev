using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PatikaDev.Models
{
    public class User
    {
        public int Id { get; set; }
        [StringLength(50)] public string Email { get; set; }
        [StringLength(50)] public string FirstName { get; set; }
        [StringLength(50)] public string LastName { get; set; }
        [StringLength(10)] public string Password { get; set; }
        public bool Status { get; set; }

        public ICollection<Course> Courses { get; set; }
        public ICollection<Attendance> Attendances { get; set; }
        public ICollection<SuccessSituation> SuccessSituations { get; set; }
        public ICollection<OperationClaim> OperationClaims { get; set; }
    }
}