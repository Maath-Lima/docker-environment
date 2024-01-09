using Docker.Environment.Consumer.API.Setup;
using Docker.Environment.Data.Database;
using Docker.Environment.Data.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddEndpointsApiExplorer();

builder.Services.PostgreConfigureDbContext(builder.Configuration);

var app = builder.Build();

app.UseHttpsRedirection();

app.MapGet("api/categorias", async (AppDbContext db) => await db.Categorias
                                                            .Include(p => p.Produtos)
                                                            .ToListAsync());

app.MapGet("api/produtos", async (AppDbContext db) => await db.Produtos.ToListAsync());

app.MapGet("api/produtos/{id:int}", async (int id, AppDbContext db) =>
{
    return await db.Produtos.FindAsync(id)
            is Produto produto
                ? Results.Ok(produto)
                : Results.NotFound();
});

app.Run();
