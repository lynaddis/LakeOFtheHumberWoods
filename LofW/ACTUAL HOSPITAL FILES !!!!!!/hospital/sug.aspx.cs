using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class admin : System.Web.UI.Page
{

    suggestionClass objLinq = new suggestionClass();  //new instance of the class
    private void _subRebind()
    {
        ddl_suggestionType.DataTextField = "suggestionType";
        ddl_suggestionType.DataValueField = "Id";
        ddl_suggestionType.DataBind();
        txt_firstI.Text = string.Empty;
        txt_lastI.Text = string.Empty;
        txt_phoneI.Text = string.Empty;
        rb_hours.DataTextField = "hours";
        rb_hours.DataValueField = "Id";
        rb_hours.DataBind();
        txt_emailI.Text = string.Empty;
        txt_commentI.Text = string.Empty;
        objLinq.getSuggestion();
        DataBind();
        // Binds the data from the database and allows it to be manipulated through the textboxes
    }
    protected void Page_Load(object sender, EventArgs e) // loads page 
    {
        if (!Page.IsPostBack) // Shows if the page is visited for the first time
        {
            _subRebind();
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e) // Admin inserts or cancels products into the database using linq 
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objLinq.commitInsert(ddl_suggestionType.Text, txt_firstI.Text, txt_lastI.Text, txt_phoneI.Text,rb_hours.Text, txt_emailI.Text, txt_commentI.Text), "insert"); 
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }

    }

    private void _strMessage(bool flag, string str) // Error handling / mesage handling
    {
        if (flag)
        {
            string name = txt_firstI.Text.ToString();
            lbl_message.Text = "Thank You!  user "+ name + " ,  Suggestion"   +   str  + " was successful ";

        }

        else
        {
            lbl_message.Text = "Sorry, unable to  " + str + "suggestion";

        }
    }

  

    protected void SendMail()
    {
        // Gmail Address from where you send the mail
        var fromAddress = txt_emailI.Text.ToString();
        // any address where the email will be sending
        var toAddress = "lynaddis@addizwebdevelopment.com";
        //Password of your gmail address
        const string fromPassword = "tootsies";
         //Passing the values and make a email formate to display
        string subject = txt_firstI.Text.ToString();
        string body = "From: " + txt_firstI.Text + "\n";
        body += "Email: " + txt_emailI.Text + "\n";
        body += "Subject: " + txt_firstI.Text + "\n";
        body += "Question: \n" + txt_commentI.Text + "\n";
        // smtp settings
        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = "smtp.addizwebdevelopment.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new System.Net.NetworkCredential(fromAddress, fromPassword);
            smtp.Timeout = 20000;
        }
        // Passing values to smtp object
        smtp.Send(fromAddress, toAddress, subject, body);
    }

    protected void btn(object sender, EventArgs e)
    {
        try
        {
            //here on button click what will done 
            SendMail();
            DisplayMessage.Text = "Your Comments after sending the mail";
            DisplayMessage.Visible = true;
            txt_commentI.Text = "";
        }
        catch (Exception) { }
    }





}