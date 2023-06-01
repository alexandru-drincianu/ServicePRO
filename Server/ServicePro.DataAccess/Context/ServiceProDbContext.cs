using System;
using System.Reflection;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using ServicePro.DataAccess.Entities;

#nullable disable

namespace ServicePro.DataAccess.Context
{
    public partial class ServiceProDbContext : DbContext
    {
        public ServiceProDbContext()
        {
        }

        public ServiceProDbContext(DbContextOptions<ServiceProDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Workorder> Workorders { get; set; }
        public virtual DbSet<WorkorderItem> WorkorderItems { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<Vehicle> Vehicles { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=WS-172-031;Database=ServicePro;persist security info=True;Trusted_Connection=Yes;MultipleActiveResultSets=True;App=EntityFramework;TrustServerCertificate=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Vehicle>()
                        .Property(p => p.Mileage)
                        .HasColumnType("decimal(18,4)");
            modelBuilder.Entity<Workorder>()
                        .Property(p => p.TotalCost)
                        .HasColumnType("decimal(18,4)");
            modelBuilder.Entity<WorkorderItem>()
                        .Property(p => p.Price)
                        .HasColumnType("decimal(18,4)");
            modelBuilder.Entity<WorkorderItem>()
                        .Property(p => p.Quantity)
                        .HasColumnType("decimal(18,4)");
        }
    }
}
