using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.OpenApi.Models;
using ModernApiApp.DataAccess;
using ModernApiApp.Services;
using Microsoft.ApplicationInsights.Extensibility;

namespace ModernApiApp {
	
    public class Startup {
    
		public Startup(IConfiguration configuration) {
            Configuration = configuration;
        }
        
		public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services) {
            var connectionString = buildConnectionString();
            services.AddDbContext<ApiContext>(options => options.UseSqlServer(
                connectionString,
                b => b.MigrationsAssembly("ModernApiApp")
            ));
			services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "ModernApiApp", Version = "v1" });
            });
            services.AddTransient<IUnitOfWork<ApiContext>, UnitOfWork<ApiContext>> ();
            services.AddCors();
            services.AddMvc();
            services.AddApplicationInsightsTelemetry();
            services.AddSingleton<ITelemetryInitializer, ModernTelemetryInitializer>();
			string ManagedNetworkingAppContextSwitch = "Switch.Microsoft.Data.SqlClient.UseManagedNetworkingOnWindows";
            AppContext.SetSwitch(ManagedNetworkingAppContextSwitch, true);
        }

        private string buildConnectionString () {
            string apiAppDbConnectionString = Environment.GetEnvironmentVariable("ModernApiDBConnectionString");
            if (String.IsNullOrEmpty(apiAppDbConnectionString))
            {
                string apiAppDbServerName = Environment.GetEnvironmentVariable("ApiAppDatabaseServer");
                if (string.Equals (apiAppDbServerName, "localdb")) {
                    apiAppDbServerName = "(localdb)\\MSSQLLocalDB";
                }
                string apiAppDbName = Environment.GetEnvironmentVariable("ApiAppDatabaseName");
                string apiAppDatabaseUser = Environment.GetEnvironmentVariable("ApiAppDatabaseUser");
                string apiAppDatabasePassword = Environment.GetEnvironmentVariable("ApiAppDatabasePassword");
                if (!String.IsNullOrEmpty (apiAppDatabaseUser)) {
                    apiAppDbConnectionString = $"Server={apiAppDbServerName};Database={apiAppDbName};UID={apiAppDatabaseUser};PASSWORD={apiAppDatabasePassword}; ";
                } else {
                    apiAppDbConnectionString = $"Server={apiAppDbServerName};Database={apiAppDbName};Trusted_Connection=True";
                }
            }
            return apiAppDbConnectionString;
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
			if (env.EnvironmentName == "Development")
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "ModernApiApp v1"));
            }
			
            app.UseRouting();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}