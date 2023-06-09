using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ServicePro.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class AddMinutesToLabour : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Minutes",
                table: "Labours",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Minutes",
                table: "Labours");
        }
    }
}
