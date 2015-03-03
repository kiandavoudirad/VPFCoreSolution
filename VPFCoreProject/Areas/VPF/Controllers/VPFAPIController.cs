using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using VPFCoreProject.Areas.VPF.Models;

namespace VPFCoreProject.Areas.VPF.Controllers
{
    public class VPFAPIController : ApiController
    {
        private CoreVPFSQLEntities db = new CoreVPFSQLEntities();

        // GET: api/VPFAPI
        public IQueryable<VPFCore> GetVPFCores()
        {
            return db.VPFCores;
        }

        // GET: api/VPFAPI/5
        [ResponseType(typeof(VPFCore))]
        public IHttpActionResult GetVPFCore(int id)
        {
            VPFCore vPFCore = db.VPFCores.Find(id);
            if (vPFCore == null)
            {
                return NotFound();
            }

            return Ok(vPFCore);
        }

        // PUT: api/VPFAPI/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutVPFCore(int id, VPFCore vPFCore)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != vPFCore.MenuID)
            {
                return BadRequest();
            }

            db.Entry(vPFCore).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VPFCoreExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/VPFAPI
        [ResponseType(typeof(VPFCore))]
        public IHttpActionResult PostVPFCore(VPFCore vPFCore)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.VPFCores.Add(vPFCore);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = vPFCore.MenuID }, vPFCore);
        }

        // DELETE: api/VPFAPI/5
        [ResponseType(typeof(VPFCore))]
        public IHttpActionResult DeleteVPFCore(int id)
        {
            VPFCore vPFCore = db.VPFCores.Find(id);
            if (vPFCore == null)
            {
                return NotFound();
            }

            db.VPFCores.Remove(vPFCore);
            db.SaveChanges();

            return Ok(vPFCore);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool VPFCoreExists(int id)
        {
            return db.VPFCores.Count(e => e.MenuID == id) > 0;
        }
    }
}