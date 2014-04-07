using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news : System.Web.UI.Page
{

    linqClass objLinq = new linqClass();
    private void _subRebind()
    {
        
        
        txt_filterI.Text = string.Empty;
        txt_filterafterI.Text = string.Empty;
        cbl_dep.DataTextField = "Department";
        cbl_dep.DataValueField = "Id";
        cbl_dep.DataBind();
        txt_dateI.Text = string.Empty;
        objLinq.getNews();
        DataBind();


         

        // Binds the data from the database and allows it to be manipulated through the textboxes
    }
    protected void Page_Load(object sender, EventArgs e) // loads page 
    {
        if (!Page.IsPostBack) // Shows if the page is visited for the first time
        {
            pnl_cbl.Visible = true;
            _subRebind();
        }
    }

    protected void CheckBoxList_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindNews();
    }

    private void bindNews()
    {
        linqClass objLinq = new linqClass();

        lst_details.DataSource = objLinq.getNewsByID(Convert.ToInt32(cbl_dep.SelectedItem.Value));
        lst_details.DataBind();
        cbl_dep.DataSource = objLinq.getNews();
        cbl_dep.DataTextField = "Department";
        cbl_dep.DataValueField = "Id";
        cbl_dep.DataBind();



    }


    protected void ListView1_ItemCommand(object sender, CommandEventArgs e) // Admin inserts or cancels products into the database using linq 
    {
        switch (e.CommandName)
        {
            case "Selectx":
                int newsID = Convert.ToInt32(e.CommandArgument.ToString());
                lst_details.DataSource = objLinq.getNewsByID(newsID);
                lst_details.DataBind();
                pnl_cbl.Visible = false;
                break;
                
        }

    }


    
    private void _strMessage(bool flag, string str) // Error handling / mesage handling
    {
        if (flag)
        {
            string name = txt_filterafterI.Text.ToString();
            lbl_message.Text = "Thank You!  user " + name + " ,  News" + str + " was successful ";

        }

        else
        {
            lbl_message.Text = "Sorry, unable to  " + str + "News";

        }
    }






}