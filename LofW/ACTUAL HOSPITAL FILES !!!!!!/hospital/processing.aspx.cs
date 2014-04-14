using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

public partial class Patient_processing : System.Web.UI.Page
{

    string auth;
    string token;
    string query;
    string url;
    string strResponse;

    invoiceClass objInvoice = new invoiceClass();
    paypalTransactionClass objPaypal = new paypalTransactionClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!Page.IsPostBack)
        {
             auth = "5T2QrRnweGCR_yQXw33fOd0-xj06vSobMwwfa-cT16-YcCOmS7Cs1nL0D0O";

             token = Request.QueryString.Get("tx");

             query = string.Format("cmd=_notify-synch&tx={0}&at={1}", token, auth);

             url = "https://www.sandbox.paypal.com/cgi-bin/webscr";
             HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);

             req.Method = "POST";
             req.ContentType = "application/x-www-form-urlencoded";
             req.ContentLength = query.Length;

             StreamWriter sysOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
             sysOut.Write(query);
             sysOut.Close();

             StreamReader sysIn = new StreamReader(req.GetResponse().GetResponseStream());
             strResponse = sysIn.ReadToEnd();
             sysIn.Close();

            //lbl.Text = strResponse;

             if (strResponse.StartsWith("SUCCESS"))
             {
                // lbl.Text += "   myStatus: " + "Success";

                 PDTHolder pdt = PDTHolder.Parse(strResponse);
                 lbl.Text = string.Format("Thank you {0} {1} for your payment of {2} {3}! A conformation e-mail of this transaction has been sent to {4}. please click the link below to return to the home page",
                  pdt.PayerFirstName, pdt.PayerLastName, pdt.GrossTotal, pdt.Currency,pdt.PayerEmail);

                 int patient_id = objInvoice.getPatientIdByInvoice(Convert.ToInt32(pdt.ItemNumber));
                 int invoice_id = Convert.ToInt32(pdt.ItemNumber);
                 string pp_account = pdt.PayerEmail;
                 string date = DateTime.Now.ToShortDateString();


                 objInvoice.commitUpdatePaid(invoice_id, "Paid", "PayPal");

                 objPaypal.commitInsert(invoice_id, patient_id, pp_account, date);


             }

             else
             {
                 lbl.Text = "An unexpected error has occured, Paypal payment has failed please contact paypal for customer support";
             }
            
        }
    }
}