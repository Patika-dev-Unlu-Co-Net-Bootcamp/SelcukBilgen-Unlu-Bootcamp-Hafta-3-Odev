namespace PatikaDev.Models
{
    public class UserCourse
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public User USer { get; set; }
        public byte CourseId { get; set; }
        public Course Course { get; set; }
    }
}