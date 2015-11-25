using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceOrdersWebApplication.Models;

namespace ServiceOrdersWebApplication.Admin
{
    public partial class InsertEditServiceOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["sID"] != null)
            {
                ServiceOrder so = Utils.GetServiceOrder(Convert.ToInt32(Request.QueryString["sID"]));
                litServiceOrderNumber.Text = " - #:" + so.ServiceOrderNumber;
            }
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            ImageButton1_ModalPopupExtender.Hide();
            ServiceOrderDetailsSqlDataSource.DataBind();
        }

        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            termsAndConditions_ModalPopupExtender.Hide();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            litTermsAndConditions.Text = Editor1.InnerText;
            termsAndConditions_ModalPopupExtender.Hide();
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
 ImageButton1_ModalPopupExtender.Hide();
        }
    }
}