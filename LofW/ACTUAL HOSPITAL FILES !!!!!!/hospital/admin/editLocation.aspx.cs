using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_editLocation : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Edit Location";
        if (!Page.IsPostBack)
        {
            subRebind();
        }
    }

    protected void subSelect(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Selectx":
                string selected = e.CommandArgument.ToString();
                showEdit(selected);
                break;
            case "Deletex":
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                hospitalLocationClass deleteLoc = new hospitalLocationClass();
               CommandResult(deleteLoc.deleteLocation(id),"Delete");
                subRebind();
                break;
        }

    }


    protected void subAdmin(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Updatex":
                string Name = ((TextBox)e.Item.FindControl("txt_hName")).Text;
                string Address = ((TextBox)e.Item.FindControl("txt_hAddress")).Text;
                string Description = ((TextBox)e.Item.FindControl("txt_hDes")).Text;

                int id = Convert.ToInt32(e.CommandArgument.ToString());

                hospitalLocationClass updatLoc = new hospitalLocationClass();
               CommandResult( updatLoc.commitUpdate(id, Name, Address, Description),"Update");
               showList();
                break;

            case "Cancelx":
                showList();
                break;

        }
    }



    protected void subRebind()
    {
        hospitalLocationClass locations = new hospitalLocationClass();
        dl_locations.DataSource = locations.getLocations();
        dl_locations.DataBind();
    }

    protected void showEdit(string id)
    {
        pnl_list.Visible = false;
        pnl_edit.Visible = true;

        hospitalLocationClass editlist = new hospitalLocationClass();
        dl_editLoc.DataSource = editlist.getLocationById(Convert.ToInt32(id));
        dl_editLoc.DataBind();
    }

    protected void showList()
    {
        pnl_edit.Visible = false;
        pnl_list.Visible = true;
        subRebind();
    }

    private void CommandResult(bool commandFlag, string action)
    {
        if (commandFlag)
        {
            lbl_Status.Text = action + ": was successfull ";
        }

        else
        {
            lbl_Status.Text = action + ": failed";
        }

    }

}