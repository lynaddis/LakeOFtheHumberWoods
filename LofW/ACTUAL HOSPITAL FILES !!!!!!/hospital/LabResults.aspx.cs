using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LabResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) // Shows if the page is visited for the first time
        {
            _subRebind();
        }
    
    }

   labClass objLinq = new labClass();  //new instance of the class
   private void _subRebind()
   {
      grd_main.DataSource = objLinq.getLabs();
      grd_main.DataBind();
       
   }



}