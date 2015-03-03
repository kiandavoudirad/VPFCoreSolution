using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace VPFCoreProject.Areas
{
    /// <summary>
    /// Bndle Registeratin
    /// </summary>
    public class VPFBundleRegisteration
    {
        /// <summary>
        /// Bundle Registeration
        /// </summary>
        /// <param name="bundles"></param>
        internal static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/VPFCore").Include(
               "~/Areas/VPF/Scripts/svg-edit/KSage/Controller.js",
                "~/Areas/VPF/Scripts/svg-edit/embedapi.js",               
                "~/Areas/VPF/Scripts/svg-edit/jquery-1.11.2.min.js"
              ));


              bundles.Add(new ScriptBundle("~/bundles/VPFPut").Include(
                "~/Areas/VPF/Scripts/svg-edit/embedapi.js",               
                "~/Areas/VPF/Scripts/svg-edit/jquery-1.11.2.min.js",
                "~/Areas/VPF/Scripts/svg-edit/KSage/PutVPF.js"
              ));

              bundles.Add(new StyleBundle("~/Style/VPFPut").Include(
              "~/Areas/VPF/Scripts/svg-edit/Style/VPF.css"));




        }
    }
}