using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(pharm.Startup))]
namespace pharm
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
