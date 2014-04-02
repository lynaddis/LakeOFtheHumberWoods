using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{

    linqClass objLinq = new linqClass();  //new instance of the class
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
            lbl_message.Text = "Thank You,  Suggestion" + str + "was successful";

        }

        else
        {
            lbl_message.Text = "Sorry, unable to  " + str + "suggestion";

        }
    }
    

    


}