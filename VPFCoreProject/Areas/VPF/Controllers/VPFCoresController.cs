using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;

using System.Web.Mvc;
using VPFCoreProject.Areas.VPF.Models;


namespace VPFCoreProject.Areas.VPF.Controllers
{
    public class VPFCoresController : Controller
    {
        private CoreVPFSQLEntities db = new CoreVPFSQLEntities();
        private IServiceVPF Service = new IServiceVPF();

        // GET: VPF/VPFCores/GetData
        // GET: 95ff888a-5e80-421b-9d01-105d9ca2d24c/VPF/VPFCores/getData/10814
        [HttpGet]
        public ActionResult GetData(int? id)
        {
            VPFCore vPFCore = new VPFCore();
            if (id != null)
            {
                vPFCore = db.VPFCores.Find(id);
                try
                {
                    if (vPFCore.Data != null)
                        return Json(vPFCore, JsonRequestBehavior.AllowGet);
                }
                catch
                {
                    throw new System.Web.Http.HttpResponseException(HttpStatusCode.NotFound);
                }
                //  return Json(vPFCore, JsonRequestBehavior.AllowGet);
            }

         
                return  new HttpNotFoundResult("The int Id does not exist!");
        }



        [HttpGet]
        public ActionResult PutData()
        {
            return View();
        }

        // Put: VPF/VPFCores/GetData
        // get the object make sure the primary key exists 
        // search for search in the db if it exists 
        // if not add to the data base 
        // retun success 
        // Put: 95ff888a-5e80-421b-9d01-105d9ca2d24c/VPF/VPFCores/PutData
        [HttpPut]
        public ActionResult PutData( int _menuID, string _data)
        {
            if ((_data != null) && (_menuID != null))
            {
                if (db.VPFCores.Find(_menuID) != null)
                    return new HttpNotFoundResult("Data Aready Exists with the same MenueID!");
                else
                {
                    VPFCore testObject = Service.GetItem(_menuID, _data);
                    if (ModelState.IsValid)
                    {
                        try
                        {
                            db.VPFCores.Add(testObject);
                            db.SaveChanges();
                            return new HttpStatusCodeResult(HttpStatusCode.Found);
                        }
                       catch { return Json(testObject, JsonRequestBehavior.AllowGet); }
                    }
                    else return new HttpNotFoundResult("The Object Model is not valid!");
                }

            } 
            return  new  HttpNotFoundResult("MenuId or Data was null!!");
        }




















        public ActionResult LoadSVG(int? id)
        {

           ViewBag.MenuID = id;
           return View();
    }
      


     
        // GET: VPF/VPFCores
        public ActionResult Index()
        {
            return View(db.VPFCores.ToList());
        }

        // GET: VPF/VPFCores/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VPFCore vPFCore = db.VPFCores.Find(id);
            if (vPFCore == null)
            {
                return HttpNotFound();
            }
            return View(vPFCore);
        }

        // GET: VPF/VPFCores/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: VPFCores/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MenuID,CoreId,Data,Privilege,ParentMenuID,ResourceKey")] VPFCore vPFCore)
        {
            if (ModelState.IsValid)
            {
                db.VPFCores.Add(vPFCore);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(vPFCore);
        }

        // GET: VPF/VPFCores/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VPFCore vPFCore = db.VPFCores.Find(id);
            if (vPFCore == null)
            {
                return HttpNotFound();
            }
            return View(vPFCore);
        }

        // POST: VPF/VPFCores/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MenuID,CoreId,Data,Privilege,ParentMenuID,ResourceKey")] VPFCore vPFCore)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vPFCore).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(vPFCore);
        }

        // GET: VPF/VPFCores/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VPFCore vPFCore = db.VPFCores.Find(id);
            if (vPFCore == null)
            {
                return HttpNotFound();
            }
            return View(vPFCore);
        }

        // POST: VPF/VPFCores/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            VPFCore vPFCore = db.VPFCores.Find(id);
            db.VPFCores.Remove(vPFCore);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
