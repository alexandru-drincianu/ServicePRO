using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ServicePro.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class RemoveQuantityFromConsumablesAndAddToWorkorderItems : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Quantity",
                table: "Consumables");

            migrationBuilder.AddColumn<decimal>(
                name: "Quantity",
                table: "WorkorderItems",
                type: "decimal(18,4)",
                nullable: false,
                defaultValue: 0m);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Quantity",
                table: "WorkorderItems");

            migrationBuilder.AddColumn<decimal>(
                name: "Quantity",
                table: "Consumables",
                type: "decimal(18,4)",
                nullable: false,
                defaultValue: 0m);
        }
    }
}
