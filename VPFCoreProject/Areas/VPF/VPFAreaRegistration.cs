using System.Web.Mvc;
using System.Web.Optimization;

namespace VPFCoreProject.Areas.VPF
{

        public class VPFAreaRegistration : AreaRegistration
        {
            public override string AreaName
            {
                get
                {
                    return "VPF";
                }
            }

            public override void RegisterArea(AreaRegistrationContext context)
            {

                RegisterRoutes(context);
                RegisterBundles();
            }

            public void RegisterRoutes(AreaRegistrationContext context)
            {
                context.MapRoute("Core_VPF", "VPF/{controller}/{action}/{id}",
                    new { area = "VPF", controller = "VPFCores", action = "Home", id = UrlParameter.Optional },
                    namespaces: new[] { "VPFCoreProject.Areas.VPF.Controllers" });

            }

            private void RegisterBundles()
            {
                VPFBundleRegisteration.RegisterBundles(BundleTable.Bundles);
            }

        }
    
}
