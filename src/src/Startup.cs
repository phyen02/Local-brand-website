using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(src.Startup))]
namespace src
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
