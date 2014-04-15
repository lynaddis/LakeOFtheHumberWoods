using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cancel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Cancel";
        //string redirectTo = "http://daniellestirling.com/hospital/home.aspx";
        //string script = "<script>";
        //script += "alert('You have chosen to cancel the Paypal Payment process;The Transaction has been stopped and you will be redirected tothe hospital home page!');";
        //script += "window.location='" + redirectTo + "'</script>";


        //ScriptManager.RegisterStartupScript(this, typeof(Page), "test", script, true);

    }
}