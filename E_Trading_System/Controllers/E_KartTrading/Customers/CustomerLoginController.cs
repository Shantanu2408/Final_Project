﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using E_Trading_System.Models;
namespace E_Trading_System.Controllers.E_KartTrading.Customers
{
    
        public class CustomerLoginController : Controller
        {
            // GET: Customer
            public ActionResult Login()
            {
                return View();
            }


            private readonly E_Trading_SystemDBEntities3 db;

            public CustomerLoginController()
            {
                db = new E_Trading_SystemDBEntities3();
            }
           
            [HttpPost]
            public ActionResult Login(string email, string password)
            {

                if (IsValidCustomer(email, password))
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.InvalidLogin = "Invalid Customer Email or password.";
                    return View();
                }
            }

            private bool IsValidCustomer(string email, string password)
            {
                string Email = db.Customers.Where(x => x.Customer_Email == email).Select(x => x.Customer_Email).FirstOrDefault();
                string Password = db.Customers.Where(x => x.Customer_Email == email).Select(x => x.Password).FirstOrDefault();
                if (email == Email && password == Password)
                {
                    return true;
                }
                return false;
            }
        }
    }