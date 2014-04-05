using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_administrative : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        accessDropDownFill objClassAccess=new accessDropDownFill();
        if (!IsPostBack)
        {
            detailViewDonorIOnformation.Visible = false;
            accessDropDownFill objaccess = new accessDropDownFill();
            gridviewDonorInformation.DataSource = objaccess.getDonorInformation();
            gridviewDonorInformation.DataBind();
            PanelDonorInfo.Visible = false;

            //GridView1.DataSource = objClassAccess.getBedRoomsData();
            //GridView1.DataBind();
        }
    }
    protected void gridviewDonorInformation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (gridviewDonorInformation.SelectedDataKey != null)
        {
            int index = (int)gridviewDonorInformation.SelectedDataKey.Value;
            accessDropDownFill objacc = new accessDropDownFill();
            detailViewDonorIOnformation.DataSource = objacc.getDonorInformationById(index);
            detailViewDonorIOnformation.DataBind();
            detailViewDonorIOnformation.Visible = true;

            DropDownList country = (DropDownList)(detailViewDonorIOnformation.FindControl("dropDownCountry"));
            country.DataSource = objacc.getCountryNames();
            country.DataTextField = "countryName";
            country.DataValueField = "countryId";
            country.DataBind();
            DropDownList province = (DropDownList)(detailViewDonorIOnformation.FindControl("dropDownProvince"));
            int cId = Convert.ToInt32(((DropDownList)detailViewDonorIOnformation.FindControl("dropDownCountry")).SelectedValue);
            province.DataSource = objacc.getProvinceByCountryId(cId);
            province.DataTextField = "provikceName";
            province.DataValueField = "provinceId";
            province.DataBind();
            DropDownList city = (DropDownList)(detailViewDonorIOnformation.FindControl("dropDownCity"));
            int pId = Convert.ToInt32(((DropDownList)detailViewDonorIOnformation.FindControl("dropDownProvince")).SelectedValue);
            city.DataSource = objacc.getCityById(pId);
            city.DataTextField = "cityName";
            city.DataValueField = "cityId";
            city.DataBind();
        }
    }
    protected void detailViewDonorIOnformation_PreRender(object sender, EventArgs e)
    {
        if (gridviewDonorInformation.SelectedIndex == -1)
        {
            detailViewDonorIOnformation.Visible = false;
        }
        else
        {
            detailViewDonorIOnformation.Visible = true;
        }
    }
    protected void detailViewDonorIOnformation_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "EditUpdate":
                 int id=  Convert.ToInt32(gridviewDonorInformation.SelectedDataKey.Value);
              int amount= Convert.ToInt32(((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxAmount"))).Text);
              string title = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxTitle"))).Text;
              string fname = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxFirstName"))).Text;

              string middle = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxMiddle"))).Text;
              string lname = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxlastName"))).Text;
              string type = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxType"))).Text;
              string company = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxCompany"))).Text;
              string zip = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxZipCode"))).Text;
              string pobox = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxPoBox"))).Text;
            
              string country = ((DropDownList)(detailViewDonorIOnformation.FindControl("dropDownCountry"))).SelectedItem.Text;
              string province = ((DropDownList)(detailViewDonorIOnformation.FindControl("dropDownProvince"))).SelectedItem.Text;
              string city = ((DropDownList)(detailViewDonorIOnformation.FindControl("dropDownCity"))).SelectedItem.Text;

              string email = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxEmail"))).Text;
              string phoneH = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxPhoneHome"))).Text;
              string phoneW = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxPhoneWork"))).Text;
              string Emailsend = ((TextBox)(detailViewDonorIOnformation.FindControl("TextBoxEmailSend"))).Text;

              accessDropDownFill obj = new accessDropDownFill();
             int result= obj.updateDonorInformation(id,amount,title,fname,middle,lname,type,company,zip,pobox,country,province,city,email,phoneH,phoneW,Emailsend);
             lblMessage.Text = "Rows Updated";
             lblMessage.ForeColor = System.Drawing.Color.Green;
             gridviewDonorInformation.DataSource = obj.getDonorInformation();
             gridviewDonorInformation.DataBind();
             gridviewDonorInformation.SelectedIndex = -1;
                break;
            case "CancelUpdate":
             
             gridviewDonorInformation.SelectedIndex = -1;
             lblMessage.Text = "";
             break;
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

             Button btn = (Button)e.Row.Cells[6].FindControl("ButtonBook");
             btn.Enabled = false;
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
            Button btnchk = (Button)e.Row.Cells[6].FindControl("ButtonCheckOut");
         int counter=   Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "bedCount"));
            if (counter == 0)
            {
                btnchk.Enabled = false;
            }
            else
            {
                btnchk.Enabled = true;
            }
        }
    }
    protected void GridViewSearchAll_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "bookBed":
              //  (grid)e.CommandSource
              //string counter= ((Label)gridrow.NamingContainer.FindControl("LabelbedCount")).Text;
              // lblSearch.Text = counter;

             Button lbl=((Button)e.CommandSource);
            int index= ((GridViewRow)lbl.NamingContainer).RowIndex;
         Label  lblcount= (Label)(GridViewSearchAll.Rows[index].FindControl("LabelbedCount"));
         int counter = Convert.ToInt32(lblcount.Text);

         Label lblAvail = (Label)(GridViewSearchAll.Rows[index].FindControl("LabelroomType"));
                string roomtype = lblAvail.Text;
                switch (roomtype.ToLower())
                { 
                    case "private":
                        if (counter < 1)
                        {
                            counter += 1;
                            accessDropDownFill objaccess = new accessDropDownFill();
                            objaccess.updateBedRooms(counter, Convert.ToInt32(e.CommandArgument));
                            objaccess.updateBedRoomsAvalability(Convert.ToInt32(e.CommandArgument), 0);

                            GridViewSearchAll.DataBind();
                        }
                        else 
                        {
                            lblSearch.Text = "Room Is Occupied";
                            accessDropDownFill objfill = new accessDropDownFill();
                            int num = 0;
                            lbl.Visible = false;
                            Button btnCheckout = (Button)(GridViewSearchAll.Rows[index].FindControl("ButtonCheckOut"));
                            btnCheckout.Visible = true;
                            if (objfill.updateBedRoomsAvalability(Convert.ToInt32(e.CommandArgument), num))
                            {
                                GridViewSearchAll.DataBind();
                            }
                            
                            
                        }
                        
                        break;
                    case "semi":
                        if (counter < 2)
                        {
                            counter += 1;
                            accessDropDownFill objaccess = new accessDropDownFill();
                            objaccess.updateBedRooms(counter, Convert.ToInt32(e.CommandArgument));
                            GridViewSearchAll.DataBind();
                            Button btnCheckout = (Button)(GridViewSearchAll.Rows[index].FindControl("ButtonCheckOut"));
                            Button btnbooked = (Button)(GridViewSearchAll.Rows[index].FindControl("ButtonBook"));
                            if (counter == 0)
                            {
                                btnCheckout.Enabled = false;
                                btnbooked.Enabled = true;
                                GridViewSearchAll.DataBind();
                            }
                            else
                            {
                                btnCheckout.Enabled = true;
                                GridViewSearchAll.DataBind();
                                if (counter == 2)
                                {
                                    btnCheckout.Enabled = true;
                                    btnbooked.Enabled = false;
                                    objaccess.updateBedRooms(counter, Convert.ToInt32(e.CommandArgument));
                                    objaccess.updateBedRoomsAvalability(Convert.ToInt32(e.CommandArgument), 0);
                                    GridViewSearchAll.DataBind();

                                }
                            }

                        }
                        else
                        {

                           
                        }
                        break;
                    case "general":
                        if (counter < 1)
                        {
                            counter += 1;
                            accessDropDownFill objaccess = new accessDropDownFill();
                            objaccess.updateBedRooms(counter, Convert.ToInt32(e.CommandArgument));
                            GridViewSearchAll.DataBind();
                        }
                        break;
                }
             break;
            case "checkOut":
                 Button lblC=((Button)e.CommandSource);
            int indexC= ((GridViewRow)lblC.NamingContainer).RowIndex;
         Label  lblcountC= (Label)(GridViewSearchAll.Rows[indexC].FindControl("LabelbedCount"));
         int counterC = Convert.ToInt32(lblcountC.Text);

         Label lblAvailC = (Label)(GridViewSearchAll.Rows[indexC].FindControl("LabelroomType"));
                string roomtypeC = lblAvailC.Text;
                switch (roomtypeC.ToLower())
                {
                    case "private":
                        if (counterC == 1)
                        {
                            counterC -= 1;
                            accessDropDownFill objaccess = new accessDropDownFill();
                            objaccess.updateBedRooms(counterC, Convert.ToInt32(e.CommandArgument));
                            objaccess.updateBedRoomsAvalability(Convert.ToInt32(e.CommandArgument), 1);
                            Button btnCheckout = (Button)(GridViewSearchAll.Rows[indexC].FindControl("ButtonBook"));
                            btnCheckout.Visible = true;
                            GridViewSearchAll.DataBind();
                        }
                        else
                        {
                            lblSearch.Text = "Room Is Unchecked";
                            GridViewSearchAll.DataBind();
                        }

                        break;
                    case "semi":
                        if (counterC <= 1)
                        {
                            counterC -= 1;
                            accessDropDownFill objaccess = new accessDropDownFill();
                            objaccess.updateBedRooms(counterC, Convert.ToInt32(e.CommandArgument));
                            GridViewSearchAll.DataBind();
                            Button btnCheckout = (Button)(GridViewSearchAll.Rows[indexC].FindControl("ButtonCheckOut"));
                            Button btnbooked = (Button)(GridViewSearchAll.Rows[indexC].FindControl("ButtonBook"));
                            if (counterC == 0)
                            {
                                btnCheckout.Enabled = false;
                                btnbooked.Enabled = true;
                                GridViewSearchAll.DataBind();
                            }
                            else
                            {
                                btnCheckout.Enabled = true;
                                GridViewSearchAll.DataBind();
                                if (counterC == 2)
                                {
                                    btnCheckout.Enabled = true;
                                    btnbooked.Enabled = false;
                                    objaccess.updateBedRooms(counterC, Convert.ToInt32(e.CommandArgument));
                                    objaccess.updateBedRoomsAvalability(Convert.ToInt32(e.CommandArgument), 0);
                                    GridViewSearchAll.DataBind();

                                }
                            }

                        }
                        break;
                    case "general":
                        if (counterC <= 1)
                        {
                            counterC -= 1;
                            accessDropDownFill objaccess = new accessDropDownFill();
                            objaccess.updateBedRooms(counterC, Convert.ToInt32(e.CommandArgument));
                            GridViewSearchAll.DataBind();
                        }
                        break;
                }
                break;
        }
    }
    protected void LinkButtonSearchBedding_Click(object sender, EventArgs e)
    {
        PanelDonorInfo.Visible = false;
        PanelBedRoomSearch.Visible = true;
        panelSearchTicket.Visible = false;
        GridViewSearchAll.DataBind();
    }

    private void bindGridviewSearchAll()
    {
        //accessDropDownFill objaccess = new accessDropDownFill();
        //GridViewSearchAll.DataSource = objaccess.getBedRoomsData();
        //GridViewSearchAll.DataBind();
    }
    protected void LinkButtonCheckDonor_Click(object sender, EventArgs e)
    {
        PanelDonorInfo.Visible = true;
        PanelBedRoomSearch.Visible = false;
        panelSearchTicket.Visible = false;
    }
    protected void LinkButtonCarParking_Click(object sender, EventArgs e)
    {
        PanelDonorInfo.Visible = false;
        PanelBedRoomSearch.Visible = false;
        panelSearchTicket.Visible = true;
    }
    protected void subConfirmTicket(object sender, EventArgs e)
    {
        accessDropDownFill objticket = new accessDropDownFill();
        string tNo=TextBoxTicket.Text;
        GridViewTicket.DataSource = objticket.GetParkingTicket(tNo);
        GridViewTicket.DataBind();
    }
    protected void GridViewTicket_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "confirm":
                accessDropDownFill objdel = new accessDropDownFill();
                int id = Convert.ToInt32(e.CommandArgument);
                objdel.deleteParkingTicket(id);
                lblTicket.Text = "Ticket Confirmed";
                GridViewTicket.Visible = false;
                break;
        }
    }
}