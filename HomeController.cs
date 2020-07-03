using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Technical_Task.Bl;
using Technical_Task.Models;
using Technical_Task.ViewModel;

namespace Technical_Task.Controllers
{
    public class HomeController : Controller
    {
        Technical_TaskEntities db = new Technical_TaskEntities();
        //For Log Exception 
        private ILog _ILog;
        public HomeController()
        {
            _ILog = Log.GetInstance;
        }
        
        // GET: Home
        [HttpGet]
        public ActionResult Index()
        {
            // selectedlist to load intial values of store and items from database 
            SelectList stores = new SelectList(db.Stores.ToList(), "StoreId", "Name");
            SelectList Items = new SelectList(db.Items.ToList(), "ID", "Item_Name");
            SelectList Units = new SelectList(db.Items.ToList(), "ID", "Brice");
            ViewBag.Stores = stores;
            int? max = db.Invoices.Select(x=>x.Id).Max();
            if (max==null)
            {
                ViewBag.Invoice = 1;
            }
            ViewBag.Invoice =max+1;

            ViewBag.Items = Items;
            ViewBag.Units = Units;

            return View();
        }
        
        public ActionResult Create(FormCollection data)
        {


            //create invoice object to put selected data from client
            Invoice Invoiceobj = new Invoice();
            //selected items name
            List<string> Items = new List<string>();

            //read array of data from formcollection and split it to inserted in to database

            string url = data["Items"].ToString();
            var test = url.Split(',');
            for (int i = 0; i < test.Length; i++)
            {
                if (test[i]=="")
                {
                    continue;
                }
                Items.Add(test[i]);
                int temp =Convert.ToInt32(test[i]);
                Invoiceobj.Itemsinvoices.Add(new Itemsinvoice() { itemId = temp, InvoiceId = Invoiceobj.Id });
            }


            DateTime date = Convert.ToDateTime(data["Invoice_Date"]);
            decimal TotalMoney = Convert.ToDecimal(data["total_amount"]);
            decimal tax = Convert.ToDecimal(data["tax_amount"]);
            int Store_Id = Convert.ToInt32((data["storage"]));


            //put inserted data from user to invoice 
            Invoiceobj.storeId = Store_Id;
            Invoiceobj.Taxtotal = tax;
            Invoiceobj.Totalmoney = TotalMoney;
            Invoiceobj.Date = date;

            
           

            db.Invoices.Add(Invoiceobj);
            db.SaveChanges();

            //redirect to complete after success of insertion
            return View("Complete", db.Invoices.ToList());
        }
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);    
        }

        protected override void OnException(ExceptionContext filterContext)
        {
            _ILog.LogException(filterContext.Exception.ToString());
            filterContext.ExceptionHandled = true;
            this.View("Error").ExecuteResult(this.ControllerContext);
        }
        public ActionResult Complete()
        {
            return View();
        }
    }
}