using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    illnessClass objIllHome = new illnessClass();

    public List<illnessAdmin> illness;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Location"]))
            {
                grd_health.DataSource = illness.Where(x => x.Location == "Kenora").Select(x => x); 
                grd_health.DataBind();
            }
            string Location = Request.QueryString["Location"];

            grd_health.DataSource = objIllHome.getIllnessesK(Location);
            grd_health.DataBind();
        }

    }
}