using Microsoft.EntityFrameworkCore;
using Quiz.Domain.Entities;

namespace Quiz.Domain.Infra.Contexts
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
        }

        public DbSet<Question> Questions { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Question>().Property(question => question.Id);
            modelBuilder.Entity<Question>().Property(question => question.Title).HasMaxLength(160).HasColumnType("varchar(160)");
            modelBuilder.Entity<Question>().Property(question => question.CorrectAnswer).HasMaxLength(80).HasColumnType("varchar(80)");
            modelBuilder.Entity<Question>().Property(question => question.Company).HasMaxLength(80).HasColumnType("varchar(80)");
            modelBuilder.Entity<Question>().Property(question => question.AnswerA).HasMaxLength(80).HasColumnType("varchar(80)");
            modelBuilder.Entity<Question>().Property(question => question.AnswerB).HasMaxLength(80).HasColumnType("varchar(80)");
            modelBuilder.Entity<Question>().Property(question => question.AnswerC).HasMaxLength(80).HasColumnType("varchar(80)");
            modelBuilder.Entity<Question>().Property(question => question.AnswerD).HasMaxLength(80).HasColumnType("varchar(80)");
        }
    }
}