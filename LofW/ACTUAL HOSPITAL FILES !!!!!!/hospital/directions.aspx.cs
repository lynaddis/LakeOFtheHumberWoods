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
            if (!Page.IsPostBack)
            {
                //hospitalList = (DropDownList)Page.FindControl("ddl_list");
                ddl_list.DataSource = objLocations.getLocations();
                ddl_list.DataTextField = "hospital_name";
                ddl_list.DataValueField = "hospital_address";
                ddl_list.DataBind();
                ddl_list.Items.Insert(0, new ListItem("-- Select a Destination --"));
                ddl_list.SelectedIndex = 0;
            }
        }

        //[System.Web.Services.WebMethod]
        //public static bool subRequest(string start, string end)
        //{
        //    directionRequestClass newRequest = new directionRequestClass();
        //    var insert = newRequest.commintInsert(start, end, DateTime.Now.ToShortDateString());
        //    return insert;
        //}

        //[System.Web.Services.WebMethod]
        //public static bool subReverseRequest(string start, string end)
        //{
        //    directionRequestClass newRequest = new directionRequestClass();
        //    var insert = newRequest.commintInsert(start, end, DateTime.Now.ToShortDateString());
        //    return insert;
        //}



    }




 