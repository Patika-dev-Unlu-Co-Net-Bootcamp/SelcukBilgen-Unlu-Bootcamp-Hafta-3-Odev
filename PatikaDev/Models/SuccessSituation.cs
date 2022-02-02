using System.ComponentModel.DataAnnotations.Schema;

namespace PatikaDev.Models
{
    public class SuccessSituation
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
        public byte CourseId { get; set; }
        public Course Course { get; set; }
        [Column(TypeName = "decimal(18,2)")] public decimal Percent { get; set; }
    }
}