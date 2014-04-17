using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_editWait_times : System.Web.UI.Page
{
    waitTimeClass objTimes = new waitTimeClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Edit Wait Times";
        if (!Page.IsPostBack)
        {
            subRebind();
        }
    }

    // binds time to datasource 
    protected void subRebind()
    {
        lv_times.DataSource = objTimes.getTimes();
        lv_times.DataBind();
        ddl_beds.Items.Insert(0, new ListItem("-- Select bed count --"));
        ddl_beds.SelectedIndex = 0;

        ddl_docs.Items.Insert(0, new ListItem("-- Select doctor count --"));
        ddl_docs.SelectedIndex = 0;

        ddl_status.Items.Insert(0, new ListItem("-- Select status --"));
        ddl_status.SelectedIndex = 0;

        pnl_update.Visible = false;
    }

    // stores value of time to be updated 
    protected void subChange(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Editx":
                hdf_id.Value = e.CommandArgument.ToString();
                pnl_update.Visible = true;
                break;
        }
    }

    protected void subAdmin(object sender, EventArgs e)
    {
        int bed = Convert.ToInt32(ddl_beds.SelectedItem.Value.ToString());
        int doc = Convert.ToInt32(ddl_docs.SelectedItem.Value.ToString());
        int status = Convert.ToInt32(ddl_status.SelectedItem.Value.ToString());
        int id = Convert.ToInt32(hdf_id.Value.ToString());
        int time;

        int bed_count = Convert.ToInt32(ddl_beds.SelectedItem.Text.ToString());
        int doc_count = Convert.ToInt32(ddl_docs.SelectedItem.Text.ToString());
        string curr_stat = ddl_status.SelectedItem.Text.ToString();

        lbl_update_status.Text = curr_stat;

        time = calcTime(bed, doc, status);
       
        lbl_update_status.Text = hdf_id.Value.ToString();
        // updates wait time to database 
        CommandResult(objTimes.commitUpdate(id, Math.Abs(time), doc_count, curr_stat, bed_count), "Update");
        pnl_update.Visible = false;
        subRebind();

    }

    // dispays success message to user 
    private void CommandResult(bool commandFlag, string action)
    {
        if (commandFlag)
        {
            lbl_update_status.Text = action + ": was successfull ";
        }

        else
        {
            lbl_update_status.Text = action + ": failed";
        }

    }

    // calculates the waiting time 
    protected int calcTime(int beds, int docs, int status)
    {
        int final_time;

        if (docs == 0)
        {
            final_time = status - beds;
            return final_time;
        }

        else
        {
            final_time = (docs * status) + beds;
            return final_time;
        }  
    }


}