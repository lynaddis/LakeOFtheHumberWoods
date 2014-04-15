using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master : System.Web.UI.MasterPage
{



    protected void subCollapse(object sender, EventArgs e)
    {
        trv_main.CollapseAll();
    } 
}
