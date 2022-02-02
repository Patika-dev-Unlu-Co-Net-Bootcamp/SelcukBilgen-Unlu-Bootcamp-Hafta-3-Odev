using Microsoft.EntityFrameworkCore;
using PatikaDev.Models;

namespace PatikaDev.Data
{
    public class PatikaDevContext : DbContext
    {
        public PatikaDevContext(DbContextOptions<PatikaDevContext> options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<OperationClaim> OperationClaims { get; set; }
        public DbSet<UserOperationClaim> UserOperationClaims { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<UserCourse> UserCourses { get; set; }
        public DbSet<SuccessSituation> SuccessSituations { get; set; }
        public DbSet<Attendance> Attendances { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserOperationClaim>()
                .HasKey(uoc=>new {uoc.UserId,uoc.OperationClaimId});
            
            modelBuilder.Entity<UserOperationClaim>()
                .HasOne(uoc => uoc.User)
                .WithMany(u => u.OperationClaims)
                .HasForeignKey(uoc => uoc.UserId);

            modelBuilder.Entity<UserOperationClaim>()
                .HasOne(uoc => uoc.OperationClaim)
                .WithMany(oc => oc.UserOperationClaims)
                .HasForeignKey(uoc => uoc.OperationClaimId);
        }
    }
}