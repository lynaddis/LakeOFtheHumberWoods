using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class testDonation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void subSubmit(object sender, EventArgs e)
    {
        Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
}