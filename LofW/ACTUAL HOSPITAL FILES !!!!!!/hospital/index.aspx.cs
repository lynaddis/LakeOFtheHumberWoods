using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
  
        
        DateTime test = Convert.ToDateTime("05-Sep-1994");

        lbl.Text = test.ToString("{dd/MM/yyyy}");
    }


    protected void testDate(Object sender, ServerValidateEventArgs e)
    {
        DateTime dob;

        e.IsValid = (DateTime.TryParse(e.Value.ToString(), out dob));


        if (e.IsValid)
        {
            lbl.Text = Convert.ToDateTime(test.Text).ToString();
        }

    }

    //protected void insert(object sender, EventArgs e)
    //{
        
    //}
} 