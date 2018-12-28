using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LTP_Website.Startup))]
namespace LTP_Website
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            //ConfigureAuth(app);
        }
    }
}
