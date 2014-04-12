using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminspecialists : System.Web.UI.Page
{
    CalenderClass specCal = new CalenderClass();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void _subRebind() //sub routine used to reset fields 
    {
        txt_entryDateI.Text = string.Empty;
        txt_appAvailI.Text = string.Empty;
        txt_snameI.Text = string.Empty;
        txt_fieldI.Text = string.Empty;
        txt_appInfoI.Text = string.Empty;
        txt_timeI.Text = string.Empty;

        ltv_all.DataSource = specCal.getEntry();
        ltv_all.DataBind(); //binds data
    }

}