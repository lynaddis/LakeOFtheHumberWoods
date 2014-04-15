using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    AdminEmployeeClass objApp = new AdminEmployeeClass(); //instance of class
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            subRebind();
        }
    }

    private void subRebind()
    {
        dtl_main.DataSource = objApp.getAllApplicants();
        dtl_main.DataBind(); //binds data
    }

    protected void subAdmin(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Select":
                 int rowIndex = Convert.ToInt32(e.CommandArgument);
                 grd_main.DataSource = objApp.getApplicantsByID(rowIndex);
                 grd_main.DataBind();
                 subRebind();
                 break;
            case "Delete":
                int _Id = int.Parse(((HiddenField)e.Item.FindControl("hdf_Id")).Value);//use Id numbers to delete rows.
                _strMessage(objApp.commitDelete(_Id), "delete");
                subRebind();
                grd_main.Visible = false;
                break;
            case "Cancel":
                subRebind();
                break;
        }
    }
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Employee " + str + " has been successful!";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " Employee";
        } 
    }
}