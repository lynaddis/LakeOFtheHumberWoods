using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_sugAdmin : System.Web.UI.Page
{
   suggestionClass objLinq = new suggestionClass();  //new instance of the class
    private void _subRebind()
    {
        txt_suggestionI.Text = string.Empty;
        txt_firstI.Text = string.Empty;
        txt_lastI.Text = string.Empty;
        txt_phoneI.Text = string.Empty;
        txt_hours.Text = string.Empty;
        txt_emailI.Text = string.Empty;
        txt_commentI.Text = string.Empty;
        dlt_all.DataSource = objLinq.getSuggestion();
        dlt_all.DataBind();
        // Binds the data from the database and allows it to be manipulated through the textboxes
    }
    protected void Page_Load(object sender, EventArgs e) // loads page 
    {
        Master.pp_masterTitle = "Admin - Suggestion Card";
        if (!Page.IsPostBack) // Shows if the page is visited for the first time
        {
            _subRebind();
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e) // Admin inserts or cancels records into the database using linq 
    {
        switch (e.CommandName)
        {
            case "Insert":

                _strMessage(objLinq.commitInsert(txt_suggestionI.Text, txt_firstI.Text, txt_lastI.Text, txt_phoneI.Text, txt_hours.Text, txt_emailI.Text, txt_commentI.Text), "insert"); 
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
            lbl_message.Text = "Suggestion " + str + "was successful";

        }

        else
        {
            lbl_message.Text = "Sorry, unable to  " + str + "suggestion";

        }
    }
    protected void subUpDel(object sender, DataListCommandEventArgs e)
    {

        switch (e.CommandName) // allows  Updates or deletes data using the textboxes  from the interface which is bounded to the database
        {
            case "Update":
                TextBox txtType = (TextBox)e.Item.FindControl("txt_suggestionE");
                TextBox txtFirst = (TextBox)e.Item.FindControl("txt_firstE");
                TextBox txtLast = (TextBox)e.Item.FindControl("txt_lastE");
                TextBox txtPhone = (TextBox)e.Item.FindControl("txt_phoneE");
                TextBox txtHours = (TextBox)e.Item.FindControl("txt_hoursE");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emailE");
                TextBox txtComment = (TextBox)e.Item.FindControl("txt_commentE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int sugID = int.Parse(hdfID.Value.ToString());
                _strMessage(objLinq.commitUpdate(sugID, txtType.Text, txtFirst.Text, txtLast.Text, txtPhone.Text, txtHours.Text, txtEmail.Text, txtComment.Text), "update");
                _subRebind();
                break;
            case "Delete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(objLinq.commmitDelete(_id), "delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;

        }


    }


}