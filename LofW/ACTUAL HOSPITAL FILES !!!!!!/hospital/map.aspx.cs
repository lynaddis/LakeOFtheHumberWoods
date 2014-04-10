using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public partial class map : System.Web.UI.Page
{

    hospitalLocationClass objLocations = new hospitalLocationClass();

    protected void Page_Load(object sender, EventArgs e)
    {
       JavaScriptSerializer testJs = new JavaScriptSerializer();
       Array locations = objLocations.getLocs().ToArray();

       // foreach(string xloc in locations)
       // {

       //lbl_test.Text += xloc + " /n ";
       // }

        string loc = testJs.Serialize(locations);

       // lbl_test.Text = loc;
        ScriptManager.RegisterStartupScript(this, typeof(Page), "test", "calc('" + loc + "')", true);
    }
}