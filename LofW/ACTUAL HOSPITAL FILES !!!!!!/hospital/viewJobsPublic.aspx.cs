using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    viewJobsUser objUser = new viewJobsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            dtl_main.DataSource = objUser.getJobs();
            dtl_main.DataBind();
        }
    }
}