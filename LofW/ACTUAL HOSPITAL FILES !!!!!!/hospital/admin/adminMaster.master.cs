using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminMaster : System.Web.UI.MasterPage
{
    private string _heading = "LOGO";
    public string pp_masterHeading
    {
        get { return _heading; }
        set { _heading = value; }
    }


     private string _title = "Default Master Page Title";
     public string pp_masterTitle
     {
         get { return _title; }
         set { _title = value; }
     }
    protected void subCollapse(object sender, EventArgs e)
    {
        trv_main.CollapseAll();
    } 
}
