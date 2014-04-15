using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    imageSliderClass objImage = new imageSliderClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Image Slider";
        if (!Page.IsPostBack)
        {
            rpt_main.DataSource = objImage.getAllImageInfo();
            rpt_main.DataBind();
            pnl_add.Visible = false;
            pnl_update.Visible = false;
        }
    }
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_head.Text = "Details has been " + str + "ed!"; 
        }
        else
        {
            lbl_head.Text = "Sorry, unable to " + str + "Submit";
        }
    }
    //To open Add Panel on click of "Add new Image"
    public void showAddPanel(object sender, EventArgs e)
    {
        pnl_add.Visible = true;
    }
     private void subRebind()
    {
        rpt_main.DataSource = objImage.getAllImageInfo();
        rpt_main.DataBind();
        PanelControl(pnl_main);
    }

    protected void subUpdate(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "update":

                TextBox txtImageURL = (TextBox)e.Item.FindControl("txt_imgU");
                TextBox txtDescription = (TextBox)e.Item.FindControl("txt_descU");

                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int imgID = int.Parse(hdfID.Value.ToString());
                objImage.commitUpdate(imgID, txtImageURL.Text, txtDescription.Text);
                break;            
        }
    }

  
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":                 
               int y = int.Parse(e.CommandArgument.ToString());
               showUpdate(y);
                break;

            case "cancel":
            // To open the main panel
                pnl_update.Visible = false;
                pnl_add.Visible = false;
                pnl_main.Visible = true;
                break;

            case "delete":
               
                int temp = int.Parse((e.CommandArgument.ToString()));
                objImage.commitDelete(temp);
                subRebind();
                break;

            case "insert":
                objImage.commitInsert(txt_imgURLA.Text, txt_descA.Text);
                break;
        }
    }

    private void PanelControl(Panel pnl)
    {
        pnl_main.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }
    //open the update panel and populate it with record coresponding to given id
    private void showUpdate(int id)
    {
        PanelControl(pnl_update);
        imageSliderClass _job = new imageSliderClass();
        rpt_update.DataSource = _job.getImagesById(id);
        rpt_update.DataBind();
    }  
}