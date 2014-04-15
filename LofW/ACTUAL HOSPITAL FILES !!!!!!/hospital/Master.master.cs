using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master : System.Web.UI.MasterPage
{

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
