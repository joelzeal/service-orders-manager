using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ServiceOrdersWebApplication.Models;


    public static class Utils
    {
        public static string GetSupplierName(int supplierID)
        {
            using (GLDataContext db = new GLDataContext())
            {
               return db.SUPPLIERs.FirstOrDefault(s => s.SupplierID == supplierID).SupplierName;
            }
        }



        public static ServiceOrder GetServiceOrder(int serviceOrderID)
        {
            using (ServiceOrdersDataContext db = new ServiceOrdersDataContext())
            {
                return db.ServiceOrders.FirstOrDefault(s => s.ServiceOrderID == serviceOrderID);
            }
        }
    }
