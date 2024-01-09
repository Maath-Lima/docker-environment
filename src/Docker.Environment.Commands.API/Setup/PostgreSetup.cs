using Docker.Environment.Data.Database;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Docker.Environment.Commands.API.Setup
{
    public static class PostgreSetup
    {
        private const string CONNECTION_STRING = "DefaultConnection";

        public static void PostgresConfigureDbContext(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<AppDbContext>(options => options.UseNpgsql(configuration.GetConnectionString(CONNECTION_STRING)));
        }
    }
}
