using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class directions : System.Web.UI.Page
    {
        directionRequestClass objDirections = new directionRequestClass();
        hospitalLocationClass objLocations = new hospitalLocationClass();


        protected void Page_Load(object sender, EventArgs e)
        {
            Master.pp_masterTitle = "Directions";
            if (!Page.IsPostBack)
            {
                ddl_list.DataSource = objLocations.getLocations();
                ddl_list.DataTextField = "hospital_name";
                ddl_list.DataValueField = "hospital_address";
                ddl_list.DataBind();
                ddl_list.Items.Insert(0, new ListItem("-- Select a Destination --"));
                ddl_list.SelectedIndex = 0;
            }
        }
    }




 