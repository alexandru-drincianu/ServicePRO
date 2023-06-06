using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ServicePro.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class AddConsumablesAndLaboursTableAndModifyWorkorderItems : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Description",
                table: "WorkorderItems");

            migrationBuilder.DropColumn(
                name: "Price",
                table: "WorkorderItems");

            migrationBuilder.DropColumn(
                name: "Quantity",
                table: "WorkorderItems");

            migrationBuilder.AddColumn<int>(
                name: "ConsumableId",
                table: "WorkorderItems",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ItemType",
                table: "WorkorderItems",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "LabourId",
                table: "WorkorderItems",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Consumables",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Price = table.Column<decimal>(type: "decimal(18,4)", nullable: false),
                    Quantity = table.Column<decimal>(type: "decimal(18,4)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Consumables", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Labours",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    HourlyWage = table.Column<decimal>(type: "decimal(18,4)", nullable: false),
                    Minutes = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Labours", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_WorkorderItems_ConsumableId",
                table: "WorkorderItems",
                column: "ConsumableId");

            migrationBuilder.CreateIndex(
                name: "IX_WorkorderItems_LabourId",
                table: "WorkorderItems",
                column: "LabourId");

            migrationBuilder.AddForeignKey(
                name: "FK_WorkorderItems_Consumables_ConsumableId",
                table: "WorkorderItems",
                column: "ConsumableId",
                principalTable: "Consumables",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_WorkorderItems_Labours_LabourId",
                table: "WorkorderItems",
                column: "LabourId",
                principalTable: "Labours",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_WorkorderItems_Consumables_ConsumableId",
                table: "WorkorderItems");

            migrationBuilder.DropForeignKey(
                name: "FK_WorkorderItems_Labours_LabourId",
                table: "WorkorderItems");

            migrationBuilder.DropTable(
                name: "Consumables");

            migrationBuilder.DropTable(
                name: "Labours");

            migrationBuilder.DropIndex(
                name: "IX_WorkorderItems_ConsumableId",
                table: "WorkorderItems");

            migrationBuilder.DropIndex(
                name: "IX_WorkorderItems_LabourId",
                table: "WorkorderItems");

            migrationBuilder.DropColumn(
                name: "ConsumableId",
                table: "WorkorderItems");

            migrationBuilder.DropColumn(
                name: "ItemType",
                table: "WorkorderItems");

            migrationBuilder.DropColumn(
                name: "LabourId",
                table: "WorkorderItems");

            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "WorkorderItems",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "Price",
                table: "WorkorderItems",
                type: "decimal(18,4)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<decimal>(
                name: "Quantity",
                table: "WorkorderItems",
                type: "decimal(18,4)",
                nullable: false,
                defaultValue: 0m);
        }
    }
}
