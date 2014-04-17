using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    // redirects to about page
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("http://daniellestirling.com/hospital/about.aspx");
    }
}