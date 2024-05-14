using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using E_Trading_System.Models;
using System.Linq.Dynamic;

namespace E_Trading_System.Controllers
{
    public class HomeController : Controller
    {
        private E_Trading_SystemDBEntities4 db = new E_Trading_SystemDBEntities4();

        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }
          
        
        public List<Product> GetProducts(string search, string sort, string sortdir, int skip, int pageSize, out int totalRecord)
        {
           

            var v = (from a in db.Products
                     where
                             a.Product_Name.Contains(search) ||
                             a.Brand.Contains(search) ||
                             a.Vendor.Vendor_Name.Contains(search) 
                             
                     select a
                            );
            totalRecord = v.Count();
            v = v.OrderBy(sort + " " + sortdir);
            if (pageSize > 0)
            {
                v = v.Skip(skip).Take(pageSize);
            }
            return v.ToList();
        }
        public ActionResult Login()
        {
            ViewBag.Title = "Home Page";

            return View();
        }
        public ActionResult ContactUS()
        {
            ViewBag.Title = "Contact Page";
            return View();
        }
    }
}
