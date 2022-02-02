using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PatikaDev.Models
{
    public class OperationClaim
    {
        public byte Id { get; set; }
        [StringLength(50)] public string Name { get; set; }

        public ICollection<User> Users { get; set; }
    }
}