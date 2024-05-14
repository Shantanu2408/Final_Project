using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using E_Trading_System.Models;

namespace E_Trading_System.Controllers.Admin
{
    public class AdminLoginController : Controller
    {
        
        public ActionResult Index()
        {
            return View();
        }

        private readonly E_Trading_SystemDBEntities4 ES; 
        public AdminLoginController()
        {
            ES = new E_Trading_SystemDBEntities4(); 
        }
       
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            
            if (IsValidAdmin(email, password))
            {
                return RedirectToAction("Index", "ADashboard");
            }
            else
            {
                
                ViewBag.InvalidLogin = "Invalid Admin Email or Password.";
                return View();
            }
        }

        private bool IsValidAdmin(string Email, string Password)
        {
            string Em = ES.Admins.Where(E => E.Admin_Email== Email).Select(E => E.Admin_Email).FirstOrDefault();
            string Pass = ES.Admins.Where(E=> E.Admin_Email == Email).Select(E => E.Password).FirstOrDefault();
            if (Em == Email && Pass == Password)
            {
                return true;
            }
            return false;
        }
    }
}