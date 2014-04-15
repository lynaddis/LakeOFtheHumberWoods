using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_seeRoomAvailability : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Room Availability";
        if (!IsPostBack)
        {
            //accessDropDownFill objaccess = new accessDropDownFill();
            //GridViewShowRoomAvailability.DataSource = objaccess.getBedRoomsData();
            //GridViewShowRoomAvailability.DataBind();
        }
    }
         protected void GridViewSearchAll_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int val = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "bedAvailable"));
         int id=Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "bedId"));
         if (val == 1)
         {

             e.Row.Cells[2].Text = "Available";
             e.Row.Cells[2].ForeColor = System.Drawing.Color.Green;

         }
         else
         {
             e.Row.Cells[2].Text = "Not Available";
             e.Row.Cells[2].ForeColor = System.Drawing.Color.Red;

            // Button btn = (Button)e.Row.Cells[6].FindControl("ButtonBook");
             //btn.Enabled = false;
             //accessDropDownFill objfill = new accessDropDownFill();
             //int num = 0;

             //if (objfill.updateBedRoomsAvalability(id, num))
             //{
             //    GridViewSearchAll.DataBind();
             //}
         }
            int totalbed = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "roomTotleBed"));
            switch (totalbed.ToString())
            {
                case "1":
                    e.Row.Cells[4].Text = "Max 1 Bed";
                    break;
                case "2":
                    e.Row.Cells[4].Text = "Max 2 Bed";

                    break;

                case "4":
                    e.Row.Cells[4].Text = "Max 4 Bed";

                    break;
            }
            //Button btnchk = (Button)e.Row.Cells[6].FindControl("ButtonCheckOut");
         int counter=   Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "bedCount"));
            //if (counter == 0)
            //{
            //    btnchk.Enabled = false;
            //}
            //else
            //{
            //    btnchk.Enabled = true;
            //}
        }
    }
    }
