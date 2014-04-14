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
        if (!IsPostBack) // Shows if the page is visited for the first time
        {
          panel3.Visible = false;
        }
    }
    protected void ButtonInsertP1_Click(object sender, EventArgs e)
    {
        
        panel3.Visible = false; 
    }
    protected void btn_news_Click(object sender, EventArgs e)
    {
       
        panel3.Visible = true;
        newsClass objLinqClass = new newsClass(); //new instance of the class
        ddl_news.DataSource= objLinqClass.getNewsType();
        ddl_news.DataBind();
           }
    protected void ddl_news_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindNews();
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName) //
        {
        case "Selectx":
        newsClass objLinqClass = new newsClass();
        ListView1.DataSource = objLinqClass.getNewsByID(Convert.ToInt32(ddl_news.SelectedItem.Value)); //gets the id of the department then populates the dropdown
        ListView1.DataBind();
        
                break;

        }
    }

    private void bindNews()
    {
        newsClass objLinq = new newsClass(); // gets the news by the department from the database linked to the  dropdown
        ListView1.DataSource = objLinq.getNewsByDepartment(ddl_news.SelectedItem.Text.ToString());
        ListView1.DataBind();
    }
    
}
