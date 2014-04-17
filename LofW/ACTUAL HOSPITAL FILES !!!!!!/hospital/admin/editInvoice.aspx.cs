using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_editInvoice : System.Web.UI.Page
{
    invoiceClass objInvoice = new invoiceClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Edit Invoice";
        if (!Page.IsPostBack)
        {
            subRebind();

            btn_bypatient.Enabled = false;
            txt_byPatient.Enabled = false;

            txt_byInvoice.Enabled = false;
            btn_byInvoice.Enabled = false;
        }

    }

    // logic for selection a search option button 
    protected void Checked(object sender, EventArgs e)
    {
        if (rbl_invoiceid.Checked)
        {
            txt_byInvoice.Enabled = true;
            btn_byInvoice.Enabled = true;

            btn_bypatient.Enabled = false;
            txt_byPatient.Enabled = false;
        }


        if (rbl_patientid.Checked)
        {

            btn_bypatient.Enabled = true;
            txt_byPatient.Enabled = true;

            txt_byInvoice.Enabled = false;
            btn_byInvoice.Enabled = false;
        }
    }

    // binds selected invoice to edit 
    protected void subRebind()
    {
       
        rp_editInvoice.DataSource = objInvoice.getInvoices();
        rp_editInvoice.DataBind();
    
        pnl_edit.Visible = false;
        pnl_display.Visible = true;
    }

    // search by invoice 
    protected void subByInvoice(object sender, EventArgs e)
    {
        if (rbl_invoiceid.Checked == true && txt_byInvoice.Text != "")
        {
            List<Invoice> test = objInvoice.getInvoiceById(Convert.ToInt32(txt_byInvoice.Text));
            if (test != null)
            {
                lbl_invoicelist.Text = "Search Results: By Invoice ID";
                rp_editInvoice.DataSource = test;
                rp_editInvoice.DataBind();
            }
            else
            {
                lbl_invoicelist.Text = "Status: No Invoices Found";
            }
        }
    }

    // search by patient
    protected void subByPatient(object sender, EventArgs e)
    {
        if (rbl_patientid.Checked == true && txt_byPatient.Text != "")
        {
            List<Invoice> test = objInvoice.getInvoiceById(Convert.ToInt32(txt_byPatient.Text));
            if (test != null)
            {
                lbl_invoicelist.Text = "Search Results: By Patient ID";
                rp_editInvoice.DataSource = test;
                rp_editInvoice.DataBind();
            }
            else
            {
                lbl_invoicelist.Text = "Status: No Invoices Found";
            }
        }
    }

    // repeater item selection 
    protected void subAdmin(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Editx": // sends selected invoce to the edite repeater

                int Id = Convert.ToInt32(e.CommandArgument.ToString());
                rp_updateInvoice.DataSource = objInvoice.getInvoiceById(Id);
                rp_updateInvoice.DataBind();
                
                pnl_display.Visible = false;
                pnl_edit.Visible = true;
                break;

            case "Updatex": //updates selected invoice 
                
                decimal Amount = (Convert.ToDecimal(((TextBox)e.Item.FindControl("txt_amount")).Text));
                string Status = ((TextBox)e.Item.FindControl("txt_status")).Text;
                string Proc = ((TextBox)e.Item.FindControl("txt_procedure")).Text;
                string Method = ((TextBox)e.Item.FindControl("txt_payment")).Text;
                int Pid = (Convert.ToInt32(((TextBox)e.Item.FindControl("txt_pid")).Text));

                int ID = Convert.ToInt32(e.CommandArgument.ToString());

                // updates invoice in database  and displays success message to user
                bool update = objInvoice.commitUpdate(ID, Amount, Status, Proc, Method, Pid);
                if (update)
                {
                    lbl_status.Text = "Status: Patient Updated";
                    subRebind();

                }
                else
                {
                    lbl_status.Text = "Status: Update failed";
                }
                break;

            case "Cancelx": // cancels 
                subRebind();
                break;
    
        }
    }

}