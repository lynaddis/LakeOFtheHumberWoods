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

    // gets locations from database and converts it into jason and is then sent to javascript for processing
    // also passes it javascript from codebehind and binds locations to datalist
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Map";
        JavaScriptSerializer testJs = new JavaScriptSerializer(); 
        Array locations = objLocations.getLocs().ToArray(); // converts location data to array

        string loc = testJs.Serialize(locations); // converts location array into JSON string 

        ScriptManager.RegisterStartupScript(this, typeof(Page), "test", "calc('" + loc + "')", true); // calls javascript function calc with the location array as a parameter

        dl_locations.DataSource = objLocations.getLocations();
        dl_locations.DataBind();
    }
}