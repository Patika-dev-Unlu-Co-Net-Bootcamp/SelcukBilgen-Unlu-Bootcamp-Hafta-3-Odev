namespace PatikaDev.Models
{
    public class UserOperationClaim
    {
        public byte Id { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
        public byte OperationClaimId { get; set; }
        public OperationClaim OperationClaim { get; set; }
    }
}