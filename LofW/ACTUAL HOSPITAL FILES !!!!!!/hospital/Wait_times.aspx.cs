using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Wait_times : System.Web.UI.Page
{
    waitTimeClass objTimes = new waitTimeClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Wait Times";
        lv_times.DataSource = objTimes.getTimes();
        lv_times.DataBind();
        pnl_times.Visible = false;
    }

    protected void subGetTimes(object sender, EventArgs e)
    {
        pnl_times.Visible = true;
    }



    protected void subSetBox(object sender, ListViewItemEventArgs e)
    {

        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            Label time = (Label)e.Item.FindControl("lbl_current_time");
            if (time.Text != null)
            {
                int times = Convert.ToInt32(time.Text.ToString());

                if (times < 60)
                {
                    lbl_stat_box.BackColor = System.Drawing.Color.Green;
                }
                else if (times >= 60 && times < 180)
                {
                    lbl_stat_box.BackColor = System.Drawing.Color.Orange;
                }
                else
                {
                    lbl_stat_box.BackColor = System.Drawing.Color.Red;
                }
            }

        }
    }
}