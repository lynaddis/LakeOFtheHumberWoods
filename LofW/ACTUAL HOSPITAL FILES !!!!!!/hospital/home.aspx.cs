using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    illnessClass objIllHome = new illnessClass();
    CalenderClass objCalHome = new CalenderClass();

    public List<Entry> Entries;
    public List<illnessAdmin> illness;

    protected void Page_Load(object sender, EventArgs e)
    {
        //home_cal.DataSource =
        grd_health.DataSource = objIllHome.getIllnesses();
        grd_health.DataBind();
    }
}