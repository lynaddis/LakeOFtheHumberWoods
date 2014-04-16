using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

public partial class Patient_payBills : System.Web.UI.Page
{
    invoiceClass objInvoice = new invoiceClass();
    patientClass objPatient = new patientClass(); // patientclass object
    creditTransactionClass objCredit = new creditTransactionClass();

    // gets user name from login name control
    string user = HttpContext.Current.User.Identity.Name.ToString();
    int invoiceID;
    private int ID;

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Pay Bills";
        if (!Page.IsPostBack)
        {
            //test.Text = objPatient.getPatientIdByUsername(user).ToString();

            subBindlist(user);

            pnl_form.Visible = false;

            pnl_credit.Enabled = false;
            pnl_credit.Visible = false;

            pnl_paypal.Visible = false;
            pnl_paypal.Enabled = false;
        }
    }


    protected void Checked(object sender, EventArgs e)
    {
        if (rbl_credit.Checked == true)
        {
            pnl_credit.Visible = true;
            pnl_credit.Enabled = true;

            pnl_paypal.Visible = false;
            pnl_paypal.Enabled = false;
        }

        if (rbl_paypal.Checked == true)
        {
            pnl_paypal.Visible = true;
            pnl_paypal.Enabled = true;

            pnl_credit.Visible = false;
            pnl_credit.Enabled = false;
        }

    }


    protected void subBindlist(string user)
    {
        ID = objPatient.getPatientIdByUsername(user); // stores id of user to global variable for id 
        hdf_pid.Value = ID.ToString();
        gv_bills_list.DataSource = objInvoice.getInvoiceByPatientId(ID); // takes global id and uses it to get associated record
        gv_bills_list.DataBind();
    }

    protected void subSelect(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Selectx":
                int invoiceID = Convert.ToInt32(e.CommandArgument.ToString());
                dv_bills.DataSource = objInvoice.getInvoiceById(invoiceID);
                dv_bills.DataBind();
                pnl_list.Visible = false;
                pnl_info.Visible = true;
                break;

        }
    }

    protected void subPayform(object sender, DetailsViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Payx":
                if (e.CommandArgument.ToString() == "Unpaid")
                {
                    Label id = (Label)dv_bills.FindControl("lbl_num");
                    Label amount = (Label)dv_bills.FindControl("lbl_amount");
                    Label proc = (Label)dv_bills.FindControl("lbl_procedure");

                    invoiceID = Convert.ToInt32(id.Text.ToString());
                    hdf_amount.Value = amount.Text.ToString();
                    hdf_proc.Value = proc.Text.ToString();

                    pnl_form.Visible = true;
                }

                break;

            case "Printx": // new window code here

                string url = "printInvoice.aspx?param=" + e.CommandArgument.ToString();

                string s = "window.open('" + url + "', 'popup_window', 'width=300,height=400,left=400,top=100,resizable=yes,menubar=yes');";


                ScriptManager.RegisterStartupScript(this, typeof(Page), "script", s, true);

                break;


            case "Cancelx":
                pnl_list.Visible = true;
                pnl_info.Visible = false;

                rbl_credit.Checked = false;
                rbl_paypal.Checked = false;
                lbl_msg.Text = string.Empty;
                break;

        }

    }

    // stores payment information to database for credit card transactions 
    // and updates Patient invoice to paided 
    protected void subPay(object sender, EventArgs e)
    {
        invoiceID = Convert.ToInt32(hdf_id.Value.ToString());
        ID = Convert.ToInt32(hdf_pid.Value.ToString());
        lbl_msg.Text = hdf_pid.Value;
        objInvoice.commitUpdatePaid(invoiceID, "Paid", "Creditcard");
        CommandResult(objCredit.commitInsert(invoiceID, ID, txt_cardNum.ToString(), txt_cardName.ToString(), txt_expireDate.ToString(), DateTime.Now.ToShortDateString()));
        clearForm();
    }


    protected void clearForm()
    {
        txt_cardName.Text = string.Empty;
        txt_cardNum.Text = string.Empty;
        txt_expireDate.Text = string.Empty;

        pnl_form.Visible = false;
    }

    private void CommandResult(bool commandFlag)
    {
        if (commandFlag)
        {
            lbl_msg.Text = "Invoice payment was recieved";
        }

        else
        {
            lbl_msg.Text = "Payment failed";
        }

    }

    protected void subPaypal(object sender, EventArgs e)
    {
        string url = "https://www.sandbox.paypal.com/cgi-bin/webscr";
        string query = "?cmd=_xclick&business=dev-facilitator@j-lacroix.net&lc=CA&item_name=" + hdf_proc.Value.ToString() +
            "&item_number=" + hdf_id.Value.ToString() + "&amount=" + hdf_amount.Value.ToString() + "&currency_code=CAD"+
            "&button_subtype=services&return=http://daniellestirling.com/hospital/processing.aspx" +"&cancel_return="+
            "http://daniellestirling.com/hospital/cancel.aspx" + "&bn=PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted";

        Response.Redirect(url + query);

        //HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);

        //req.Method = "POST";
        //req.ContentType = "application/x-www-form-urlencoded";
        //req.ContentLength = query.Length;

        //StreamWriter sysOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
        //sysOut.Write(query);
        //sysOut.Close();
    }


}