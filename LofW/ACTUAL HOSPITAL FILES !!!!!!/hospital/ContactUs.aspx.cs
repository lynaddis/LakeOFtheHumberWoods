using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    ContactClass objContact = new ContactClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Contact Us";
    }
    //Message will be displayed on successful or unsuccessful submission of form
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            
            lbl_msg.Text = "Thank you for contacting us! we will get back to you soon";
        }
        else
        {
            lbl_msg.Text = "Please fill in the required fields !";
        }
    }

    protected void subInsert(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objContact.commitInsert(txt_fname.Text, txt_lname.Text, ulong.Parse(txt_tel.Text.ToString()),txt_email.Text.ToString(),txt_subject.Text.ToString(),txt_message.Text.ToString()), "insert");
                 break;
            case "Cancel":
                break;
        }
    }
}