using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using ServicePro.DataAccess.Context;
using Microsoft.Extensions.Configuration;
using ServicePro.API.Middleware;
using System.Reflection;
using System.IO;
using System;
using ServicePro.DataAccess.Repository.Abstraction;
using ServicePro.DataAccess.Repository;
using ServicePro.BusinessLogic.Services.Abstractions;
using ServicePro.BusinessLogic.Services;
using ServicePro.BusinessLogic.Helpers.TokenAuthentication;
using ServcicePro.DataAccess.Repository.Abstraction;
using ServcicePro.DataAccess.Repository;

var builder = WebApplication.CreateBuilder(args);


// Add services to the container.
builder.Services.AddTransient<ITokenManager, TokenManager>();

builder.Services.AddCors(options => options.AddPolicy(name: "AllowAny", builder =>
{
    builder.AllowAnyOrigin();
    builder.AllowAnyMethod();
    builder.AllowAnyHeader();
}));


builder.Services.AddControllers();

builder.Services.AddDbContext<ServiceProDbContext>(options =>
        options.UseSqlServer(builder.Configuration.GetConnectionString("dbConnectionString")));

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
builder.Services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
builder.Services.AddScoped<IAuthenticateService, AuthenticateService>();
builder.Services.AddScoped<IOrderService, OrderService>();
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddDataProtection();

builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new() { Title = "ServicePro.API", Version = "v1" });
});

var app = builder.Build();

app.UseOptions();

app.UseCors("AllowAny");


// Configure the HTTP request pipeline.
if (builder.Environment.IsDevelopment() || builder.Environment.IsProduction())
{
    app.UseDeveloperExceptionPage();
    app.UseSwagger();
    app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "ServicePro.API v1"));
}

app.UseAuthorization();

app.MapControllers();

app.Run();
