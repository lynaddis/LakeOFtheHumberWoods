using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newsupdates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
         
            panel3.Visible = false;
        }
    }
    protected void ButtonInsertP1_Click(object sender, EventArgs e)
    {
        
        panel3.Visible = false;
    }
    protected void ButtonEditP1_Click(object sender, EventArgs e)
    {
       
        panel3.Visible = true;
        sugClass objLinqClass = new sugClass();
       DropDownList1.DataSource= objLinqClass.getNews();
       DropDownList1.DataTextField = "Department";
       DropDownList1.DataValueField = "Id";
       DropDownList1.DataBind();

       ListView1.DataSource = objLinqClass.getNewsByID(Convert.ToInt32(DropDownList1.SelectedItem.Value));
       ListView1.DataBind();
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindProduct();
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Selectx":
        sugClass objLinqClass = new sugClass();
        ListView1.DataSource = objLinqClass.getNewsByID(Convert.ToInt32(DropDownList1.SelectedItem.Value));
        ListView1.DataBind();
        
                break;

        }
    }

    private void bindProduct()
    {
        sugClass objLinq = new sugClass();

        ListView1.DataSource = objLinq.getNewsByID(Convert.ToInt32(DropDownList1.SelectedItem.Value));
        ListView1.DataBind();
        DropDownList1.DataSource = objLinq.getNews();
        DropDownList1.DataTextField = "Department";
        DropDownList1.DataValueField = "Id";
        DropDownList1.DataBind();
    }
    
}
