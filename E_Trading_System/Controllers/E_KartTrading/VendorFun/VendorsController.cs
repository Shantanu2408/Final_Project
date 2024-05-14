using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using E_Trading_System.Models;

namespace E_Trading_System.Controllers.E_KartTrading.VendorFun
{
    public class VendorsController : Controller
    {
        private E_Trading_SystemDBEntities4 db = new E_Trading_SystemDBEntities4();
        public decimal vender_ID;
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

        public ActionResult Create()
        {
            ViewBag.Hint_Id = new SelectList(db.Hints, "Hint_Id", "Questions");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Vendor_Id,Vendor_Name,Vendor_Email,Mobile_Number,Address,Category,Vendor_Age,Hint_Id,Hint_Answers,Passowrd,Status")] E_Trading_System.Models.Vendor vendor)
        {
            if (ModelState.IsValid)
            {
                db.Vendors.Add(vendor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Hint_Id = new SelectList(db.Hints, "Hint_Id", "Questions", vendor.Hint_Id);
            return View(vendor);
        }

        public ActionResult Edit(decimal id)
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
            ViewBag.Hint_Id = new SelectList(db.Hints, "Hint_Id", "Questions", vendor.Hint_Id);
            return View(vendor);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Vendor_Id,Vendor_Name,Vendor_Email,Mobile_Number,Address,Category,Vendor_Age,Hint_Id,Hint_Answers,Passowrd,Status")] E_Trading_System.Models.Vendor vendor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vendor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Hint_Id = new SelectList(db.Hints, "Hint_Id", "Questions", vendor.Hint_Id);
            return View(vendor);
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
