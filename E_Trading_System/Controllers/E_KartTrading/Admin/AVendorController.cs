using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using E_Trading_System.Models;

namespace E_Trading_System.Controllers.E_KartTrading.Admin
{

    public class AVendorController : Controller
    {
        private readonly E_Trading_SystemDBEntities4 db;
        public AVendorController()
        {
            db = new E_Trading_SystemDBEntities4();
        }
        public ActionResult Index()
        {
            var vendors = db.Vendors.Include(v => v.Hint);
            return View(vendors.ToList());
        }

        public ActionResult Details(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            E_Trading_System.Models.Vendor vendor = db.Vendors.Find(id);
            if (vendor == null)
            {
                return HttpNotFound();
            }
            return View(vendor);
        }

        public ActionResult Delete(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            E_Trading_System.Models.Vendor vendor = db.Vendors.Find(id);
            if (vendor == null)
            {
                return HttpNotFound();
            }
            return View(vendor);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(decimal id)
        {
            E_Trading_System.Models.Vendor vendor = db.Vendors.Find(id);
            if (vendor != null)
            {
                if (vendor.Status == "Active")
                {
                    vendor.Status = "InActive";
                    db.SaveChanges();
                }
                else
                {
                    vendor.Status = "Active";
                    db.SaveChanges();
                }
            }
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