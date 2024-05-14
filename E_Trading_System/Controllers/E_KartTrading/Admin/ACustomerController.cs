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
    public class ACustomerController : Controller
    {
        private readonly E_Trading_SystemDBEntities4 db;
        public ACustomerController()
        {
            db = new E_Trading_SystemDBEntities4();
        }

        public ActionResult Index()
        {
            var customers = db.Customers.Include(c => c.Hint);
            return View(customers.ToList());
        }
        public ActionResult GetCustomerByCustomerName(string customerName)
        {
            var vendors = db.Customers.Where(v => v.Customer_Name == customerName).ToList();

            return View("Index", vendors);
        }
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
        public ActionResult Delete(decimal? id)
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

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(decimal id)
        {
            Customer customer = db.Customers.Find(id);
            if (customer != null)
            {
                if (customer.Status != "deleted")
                {
                    customer.Status = "deleted";
                    db.SaveChanges();
                }
                else
                {
                    customer.Status = "Active";
                    db.SaveChanges();
                }
            }
            return RedirectToAction("Index", "Home");
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult Search(string searchUser)
        {
            // Ensure search string is not null or empty
            if (string.IsNullOrWhiteSpace(searchUser))
            {
                // Redirect to Index if search string is empty
                return RedirectToAction("Index");
            }

            // Retrieve customers based on search criteria
            var customers = db.Customers
                .Include(c => c.Hint)
                .Where(c => c.Customer_Name.Contains(searchUser)); // Modify based on your search criteria

            // Pass the filtered customers to the view
            return View("Index", customers.ToList());
        }

    }
}