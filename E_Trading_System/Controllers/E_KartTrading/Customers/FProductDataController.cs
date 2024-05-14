using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using E_Trading_System.Models;

namespace E_Trading_System.Controllers.E_KartTrading.Customers
{
    public class FProductDataController : Controller
    {
        private readonly E_Trading_SystemDBEntities4 _dbContext;
        public FProductDataController()
        {
            _dbContext = new E_Trading_SystemDBEntities4();
        }


        public ActionResult Index()
        {

            var products = _dbContext.Products.ToList();


            return View(products);
        }

        protected override void Dispose(bool disposing)
        {
            _dbContext.Dispose();
            base.Dispose(disposing);
        }
    }
}