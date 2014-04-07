using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newsadmin : System.Web.UI.Page
{

    linqClassA objLinq = new linqClassA();  //new instance of the class
    private void _subRebind()
    {
        txt_filterI.Text = string.Empty;
        txt_filterafterI.Text = string.Empty;
        txt_departmentI.Text = string.Empty;
        txt_dateI.Text = string.Empty;
        dlt_all.DataSource = objLinq.getNew();
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

    protected void subAdmin(object sender, CommandEventArgs e) // Admin inserts or cancels products into the database using linq 
    {
        switch (e.CommandName)
        {
            case "Insert":
                string PublishBefore = (Convert.ToDateTime(txt_filterI.Text)).ToShortDateString();
                string PublishAfter = (Convert.ToDateTime(txt_filterafterI.Text)).ToShortDateString();
                string Date = (Convert.ToDateTime(txt_dateI.Text)).ToShortDateString();
                _strMessage(objLinq.commitInsert(PublishBefore, PublishAfter,txt_departmentI.Text, Date), "insert");
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

        switch (e.CommandName) // allows  Updates or deletes data using the textboxes  from the interface which is bounded to the database
        {
            case "Update":
                TextBox txtFirst = (TextBox)e.Item.FindControl("txt_filterE");
                TextBox txtAfter = (TextBox)e.Item.FindControl("txt_filterafterE");
                TextBox txtDep = (TextBox)e.Item.FindControl("txt_departmentE");
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int newsID = int.Parse(hdfID.Value.ToString());
                _strMessage(objLinq.commitUpdate(newsID, txtFirst.Text, txtAfter.Text, txtDep.Text, txtDate.Text), "update");
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