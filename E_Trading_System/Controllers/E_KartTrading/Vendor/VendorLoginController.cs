using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using E_Trading_System.Controllers;
using E_Trading_System.Models;

namespace E_Trading_System.Controllers.Vendor
{
    public class VendorLoginController : Controller
    {
        private readonly E_Trading_SystemDBEntities3 db; 

        public VendorLoginController()
        {
            db = new E_Trading_SystemDBEntities3(); 
        }
       
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            
            if (IsValidVendor(email, password))
            {
                return RedirectToAction("Index", "Products");
            }
            else
            {
               
                ViewBag.InvalidLogin = "Invalid Admin Email or Password.";
                return View();
            }
        }

        private bool IsValidVendor(string email, string password)
        {
            string Email = db.Vendors.Where(x => x.Vendor_Email == email).Select(x => x.Vendor_Email).FirstOrDefault();
            string Password = db.Vendors.Where(x => x.Vendor_Email == email).Select(x => x.Passowrd).FirstOrDefault();
            if (email == Email && password == Password)
            {
                return true;
            }
            return false;
        }
    }
}