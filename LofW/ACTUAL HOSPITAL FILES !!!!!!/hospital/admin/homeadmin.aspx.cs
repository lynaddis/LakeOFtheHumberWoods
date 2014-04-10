using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class homeadmin : System.Web.UI.Page
{
    illnessClass objIllHome = new illnessClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        grd_health.DataSource = objIllHome.getIllnesses();
        grd_health.DataBind();
    }
}