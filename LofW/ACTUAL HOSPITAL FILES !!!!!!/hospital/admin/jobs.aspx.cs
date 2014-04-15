using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class jobs : System.Web.UI.Page
{
    jobPost objclass = new jobPost();
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - View Jobs";
        if (!Page.IsPostBack)
        {
            rpt_main.DataSource = objclass.getJobs();
            rpt_main.DataBind();
            pnl_add.Visible = false;
            pnl_update.Visible = false;
        }
    }
    private void subRebind()
    {
        rpt_main.DataSource = objclass.getJobs();
        rpt_main.DataBind();
        PanelControl(pnl_all);
    }

   
    protected void subUpdate(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "update":
                TextBox txttitle = (TextBox)e.Item.FindControl("txt_title");
                TextBox txtdesc = (TextBox)e.Item.FindControl("txt_desc");
                TextBox txtcdate = (TextBox)e.Item.FindControl("txt_closing_date");
                TextBox txtdept = (TextBox)e.Item.FindControl("txt_dept");
                TextBox txtstatus = (TextBox)e.Item.FindControl("txt_status");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");

                int jobID = int.Parse(hdfID.Value.ToString());
                objclass.commitUpdate(jobID,txttitle.Text, txtdesc.Text, DateTime.Parse(txtcdate.Text.ToString()), txtdept.Text, txtstatus.Text);
                subRebind();
                break;
       }
    }
    
    protected void subAdmi1n(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
               int y = int.Parse(e.CommandArgument.ToString());
               showUpdate(y);
                break;
            case "insert":
               objclass.commitInsert(txt_titleA.Text, txt_descA.Text, DateTime.Parse(txt_closing_dateA.Text.ToString()), txt_deptA.Text, txt_statusA.Text);
               subRebind(); 
               break;
            case "delete":
               // int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);                
               int temp = int.Parse((e.CommandArgument.ToString()));
               objclass.commitDelete(temp);
               subRebind();
                break;
            case "cancel": // To open the main panel
                pnl_update.Visible = false;
                pnl_add.Visible = false;
                pnl_all.Visible = true;
                break;
        }
    }
    public void showAddForm(object sender, EventArgs e)
    {
        pnl_add.Visible = true;
    }


    private void PanelControl(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_update.Visible = false;
        pnl.Visible = true;
    }
    //open the update panel and populate it with record coresponding to given id
    private void showUpdate(int id)
    {
        PanelControl(pnl_update);
        jobPost _job = new jobPost();
        rpt_update.DataSource = _job.getJobsById(id);
        rpt_update.DataBind();
    }
}