using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addLocation : System.Web.UI.Page
{
    hospitalLocationClass objLocation = new hospitalLocationClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Add Location"; // over wirtes master page titile
    }

    // inserts new location into database 
    protected void subAddLoc(object sender, EventArgs e)
    {
        CommandResult(objLocation.commitInsert(txt_name.Text, txt_address.Text,txt_des.Text));
        txt_address.Text = string.Empty;
        txt_name.Text = string.Empty;
        txt_des.Text = string.Empty;
    }

    // displays status message to user 
    private void CommandResult(bool commandFlag)
    {
        if (commandFlag)
        {
            lbl_Status.Text += "Hospital location was successfully added";
        }

        else
        {
            lbl_Status.Text += "Insert failed";
        }

    }
}