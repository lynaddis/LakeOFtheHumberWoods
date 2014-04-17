using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addInvoice : System.Web.UI.Page
{
    invoiceClass objInvoice = new invoiceClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Add Invoice"; // over wirtes master page title 
    }

    // inserts invoice into database 
    protected void subInsert(object sender, EventArgs e)
    {
       CommandResult (objInvoice.commintInsert(Convert.ToDecimal(txt_amount.Text), txt_procedure.Text, Convert.ToInt32(txt_pid.Text)));
    }

    // displays success message to user
    private void CommandResult(bool commandFlag)
    {
        if (commandFlag)
        {
            lbl_status.Text = "Status: Invoice Created";
        }

        else
        {
            lbl_status.Text = "Status: Invoice failed";
        }

    }

}