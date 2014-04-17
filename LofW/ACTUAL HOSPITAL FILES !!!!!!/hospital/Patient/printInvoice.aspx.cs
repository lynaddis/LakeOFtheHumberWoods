﻿using System;
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
            // reads request string form call to open new window and uses the sent param to display the selected invoce to the user
            if (!string.IsNullOrEmpty(Request.QueryString["param"]))
            {
                dv_print.DataSource = objInvoice.getInvoiceById(Convert.ToInt32(Request.QueryString["param"].ToString()));
                dv_print.DataBind();
            }
           
        }
    }
}