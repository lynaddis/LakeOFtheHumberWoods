using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newsadmin : System.Web.UI.Page
{

    newsClass objLinq = new newsClass();  //new instance of the class
    private void _subRebind()
    {
        txt_dateI.Text = string.Empty;
        txt_departmentI.Text = string.Empty;
        txt_detailsI.Text = string.Empty;
        txt_urlI.Text = string.Empty;
        dlt_all.DataSource = objLinq.getNews();
        dlt_all.DataBind();
        // Binds the data from the database and allows it to be manipulated through the textboxes
    }
    protected void Page_Load(object sender, EventArgs e) // loads page 
    {
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
                 string Date = (Convert.ToDateTime(txt_dateI.Text)).ToShortDateString(); //converts string to date/time without the time 

                _strMessage(objLinq.commitInsert(txt_departmentI.Text, txt_detailsI.Text, txt_urlI.Text, Date), "insert");
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
            lbl_message.Text = "News " + str + "" + "was successful";

        }

        else
        {
            lbl_message.Text = "Sorry, unable to  " + str + "News";

        }
    }
    protected void subUpDel(object sender, DataListCommandEventArgs e)
    {

        switch (e.CommandName) // allows Updates or deletes data using the textboxes  from the interface which is bounded to the database
        {
            case "Update":
                TextBox txtDep = (TextBox)e.Item.FindControl("txt_departmentE");
                TextBox txtDetails = (TextBox)e.Item.FindControl("txt_detailsE");
                TextBox txtUrl = (TextBox)e.Item.FindControl("txt_urlE");
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int newsID = int.Parse(hdfID.Value.ToString());
                string Date = (Convert.ToDateTime(txtDate.Text)).ToString("dd/mm/yyyy");
                _strMessage(objLinq.commitUpdate(newsID, txtDep.Text,txtDetails.Text,txtUrl.Text, Date), "update");
                _subRebind();
                break;
            case "Delete": //delete record from the database by the ID
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