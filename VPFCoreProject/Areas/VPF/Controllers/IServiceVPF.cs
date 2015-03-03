using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using VPFCoreProject.Areas.VPF.Models;

namespace VPFCoreProject.Areas.VPF.Controllers
{
    class IServiceVPF 
    {
        internal Models.VPFCore GetItem(int? _menuID, string _data)
        {
            // get the values from xml sheet

            VPFCore testObject = new VPFCore();
            testObject.CoreId = (int)_menuID;
            testObject.Data = _data;
            testObject.Privilege = "Admi ";  
            testObject.MenuID = (int)_menuID;
            testObject.ParentMenuID= (int)108;
            testObject.ResourceKey= "ResourceKey ";
           return testObject;
        }
        // There are services that need to be inplace
     

    }
}
