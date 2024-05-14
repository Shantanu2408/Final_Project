using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using E_Trading_System.Models;

namespace E_Trading_System.Controllers.E_KartTrading.Customers
{
    public class CustomersController : Controller
    {
        private E_Trading_SystemDBEntities4 db = new E_Trading_SystemDBEntities4();

        public ActionResult Details(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        public ActionResult Create()
        {
            ViewBag.Hint_Id = new SelectList(db.Hints, "Hint_Id", "Questions");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Customer_Id,Customer_Name,Customer_Email,Address,Balance,Mobile_Number,Password,Hint_Id,Hint_Answers,Status")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                customer.Status = "Active";
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Hint_Id = new SelectList(db.Hints, "Hint_Id", "Questions", customer.Hint_Id);
            return View(customer);
        }

        public ActionResult Edit(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            ViewBag.Hint_Id = new SelectList(db.Hints, "Hint_Id", "Questions", customer.Hint_Id);
            return View(customer);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Customer_Id,Customer_Name,Customer_Email,Address,Balance,Mobile_Number,Password,Hint_Id,Hint_Answers,Status")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Hint_Id = new SelectList(db.Hints, "Hint_Id", "Questions", customer.Hint_Id);
            return View(customer);
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
