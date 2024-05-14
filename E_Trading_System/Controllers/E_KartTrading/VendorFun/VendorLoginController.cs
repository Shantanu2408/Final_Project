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
        public decimal vendor_id;
        private readonly E_Trading_SystemDBEntities4 db; 

        public VendorLoginController()
        {
            db = new E_Trading_SystemDBEntities4(); 
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
                vendor_id = db.Vendors.Where(v => v.Vendor_Email == email).Select(v => v.Vendor_Id).FirstOrDefault();
                return RedirectToAction("Index/"+vendor_id, "Products");
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