using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ServicePro.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class AddNumberToWorkorders : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Number",
                table: "Workorders",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Number",
                table: "Workorders");
        }
    }
}
