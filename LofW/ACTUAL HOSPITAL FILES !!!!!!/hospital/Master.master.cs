using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master : System.Web.UI.MasterPage
{


    private string _heading = "LOGO"; 
    public string pp_masterHeading
    {
        get { return _heading; }
        set { _heading = value; }
    }



    protected void subCollapse(object sender, EventArgs e)
    {
        trv_main.CollapseAll();
    } 
}
