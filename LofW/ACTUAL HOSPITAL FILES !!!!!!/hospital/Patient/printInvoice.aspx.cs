using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class Patient_printInvoice : System.Web.UI.Page
{
    invoiceClass objInvoice = new invoiceClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) 
        {

            if (!string.IsNullOrEmpty(Request.QueryString["param"]))
            {
                lbl.Text = Request.QueryString["param"].ToString();
                dv_print.DataSource = objInvoice.getInvoiceById(Convert.ToInt32(Request.QueryString["param"].ToString()));
                dv_print.DataBind();
            }
           
        }
    }
}