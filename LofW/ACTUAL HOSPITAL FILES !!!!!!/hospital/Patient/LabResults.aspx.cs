using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patient_LabResults : System.Web.UI.Page
{

    patientClass objPatient = new patientClass();
    labClass objLinq = new labClass();  //new instance of the class
    string user = HttpContext.Current.User.Identity.Name.ToString();
    private int ID;

    protected void Page_Load(object sender, EventArgs e)// loads page 
    {
        Master.pp_masterTitle = "lab Results";
        if (!Page.IsPostBack) // Shows if the page is visited for the first time
        {
            subBindlist(user);
        }

    }


    private void _subRebind()
    {
        grd_main.DataSource = objLinq.getLabs(); //binds grid view
        grd_main.DataBind();

    }

    protected void subBindlist(string user)
    {
        ID = objPatient.getPatientIdByUsername(user); // stores id of user to global variable for id 
        grd_main.DataSource = objLinq.getLabsByID(ID); // takes global id and uses it to get associated record
        grd_main.DataBind();
    }

}
