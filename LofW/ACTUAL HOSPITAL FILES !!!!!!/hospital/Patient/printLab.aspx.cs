using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Patient_printLab : System.Web.UI.Page
{
    labClass objLinq = new labClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!string.IsNullOrEmpty(Request.QueryString["param"]))
            {
                dv_print.DataSource = objLinq.getLabsByID(Convert.ToInt32(Request.QueryString["param"].ToString()));
                dv_print.DataBind();
            }

        }
    }
}