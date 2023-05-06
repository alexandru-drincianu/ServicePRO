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

        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderLine> OrderLines { get; set; }
        public virtual DbSet<User> Users { get; set; }


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
            modelBuilder.Entity<Order>()
                .Property(p => p.Value)
                .HasColumnType("decimal(18,4)");
        }
    }
}
