using Docker.Environment.Commands.API.Setup;
using Docker.Environment.Data.Database;
using Docker.Environment.Data.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddEndpointsApiExplorer();

builder.Services.PostgresConfigureDbContext(builder.Configuration);

var app = builder.Build();

app.UseHttpsRedirection();

app.MapPost("api/categorias/", async (Categoria categoria, AppDbContext db) =>
{
    db.Categorias.Add(categoria);
    await db.SaveChangesAsync();

    return Results.NoContent();
});

app.MapPost("api/produtos/", async (Produto produto, AppDbContext db) =>
{
    db.Produtos.Add(produto);
    await db.SaveChangesAsync();

    return Results.NoContent();
});

app.MapDelete("api/produtos/{id:int}", async (int id, AppDbContext db) =>
{

    var produto = await db.Produtos.FindAsync(id);

    if (produto is not null)
    {
        db.Produtos.Remove(produto);
        await db.SaveChangesAsync();
    }

    return Results.NoContent();
});

app.Run();
