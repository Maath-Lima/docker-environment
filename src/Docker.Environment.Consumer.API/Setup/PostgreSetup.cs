using Docker.Environment.Data.Database;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Docker.Environment.Consumer.API.Setup
{
    public static class PostgreSetup
    {
        private const string CONNECTION_STRING = "DefaultConnection";

        public static void PostgreConfigureDbContext(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<AppDbContext>(options => options.UseNpgsql(configuration.GetConnectionString(CONNECTION_STRING)));
        }
    }
}
