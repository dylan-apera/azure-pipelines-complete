using Microsoft.ApplicationInsights.Channel;
using Microsoft.ApplicationInsights.Extensibility;

namespace ModernApiApp.Services
{
    public class ModernTelemetryInitializer : ITelemetryInitializer
    {
        public void Initialize(ITelemetry telemetry)
        {

            telemetry.Context.Cloud.RoleName = "Customer API";
        }
    }
}