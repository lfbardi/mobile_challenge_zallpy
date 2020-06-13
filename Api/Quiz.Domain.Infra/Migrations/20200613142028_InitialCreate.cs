using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Quiz.Domain.Infra.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Questions",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    Title = table.Column<string>(type: "varchar(160)", maxLength: 160, nullable: true),
                    CorrectAnswer = table.Column<string>(type: "varchar(80)", maxLength: 160, nullable: true),
                    AnswerA = table.Column<string>(type: "varchar(80)", maxLength: 160, nullable: true),
                    AnswerB = table.Column<string>(type: "varchar(80)", maxLength: 160, nullable: true),
                    AnswerC = table.Column<string>(type: "varchar(80)", maxLength: 160, nullable: true),
                    AnswerD = table.Column<string>(type: "varchar(80)", maxLength: 160, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Questions", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Questions");
        }
    }
}
