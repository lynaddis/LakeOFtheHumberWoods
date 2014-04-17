﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminspecialists : System.Web.UI.Page
{
    CalenderClass specCal = new CalenderClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Specialists";
    }

    protected void ltv_allChange(object sender, PagePropertiesChangingEventArgs e) //ltv_allChange from list view, have to call Page PropertiesChangingEventAgs to enable event!
    {
        dp_listAll.SetPageProperties(e.StartRowIndex, e.MaximumRows, false); //dp_listAll.binds datapager to subroutine!
        _subRebind();
      
    }

    private void _subRebind() //sub routine used to reset fields !
    {
        txt_entryDateI.Text = string.Empty;
        txt_appAvailI.Text = string.Empty;
        txt_snameI.Text = string.Empty;
        txt_fieldI.Text = string.Empty;
        txt_appInfoI.Text = string.Empty;
        txt_timeI.Text = string.Empty;

        ltv_all.DataSource = specCal.getEntry();
        ltv_all.DataBind(); //binds data
    }

    protected void subInsert(object sender, CommandEventArgs e)
    {
        switch (e.CommandName) //calls command names from presentation page for Insert.!
        {
            case "Insert":

                DateTime Date = (DateTime.Parse(txt_entryDateI.Text.ToString())); //parsing date!
       

              _strMessage(specCal.commitInsert(Date, txt_appAvailI.Text, txt_snameI.Text, txt_fieldI.Text, txt_appInfoI.Text, txt_timeI.Text), "insert");
                _subRebind();
                break;
            case "Cancel": //only needs subrebind because you aren't changing anything, so fields justneed to be reset!
                _subRebind();
                break;

        }

    }
    protected void subEdit(object sender, ListViewCommandEventArgs e) //using subEdit routine to bind listview to commands
    {
        switch (e.CommandName) //switching command names from buttons
        {
            case "UpdateE":


                TextBox txtEdateE = (TextBox)e.Item.FindControl("txt_entrydateE");
                TextBox txtsnameE = (TextBox)e.Item.FindControl("txt_snameE");
                TextBox txtfieldE = (TextBox)e.Item.FindControl("txt_fieldE");
                TextBox txtappAvailE = (TextBox)e.Item.FindControl("txt_appAvailE");
                TextBox txtappInfoE = (TextBox)e.Item.FindControl("txt_appInfoE");
                TextBox txttimesAvailE = (TextBox)e.Item.FindControl("txt_timesAvailE");
               
               //parsing Id to int!
                HiddenField hdfIDU = (HiddenField)e.Item.FindControl("hdf_idE");
                int Id = int.Parse(hdfIDU.Value.ToString());

                _strMessage(specCal.commitUpdate(Id, DateTime.Parse(txtEdateE.Text.ToString()), txtsnameE.Text, txtfieldE.Text, txtappAvailE.Text, txtappInfoE.Text, txttimesAvailE.Text.ToString()), "update"); 

                _subRebind();

                break;

            case "DeleteE":
               
                int _Id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);

                _strMessage(specCal.commitDelete(_Id), "delete");
                _subRebind();
                break;
            case "CancelE":
                _subRebind();
                break;
        }
    }


    private void _strMessage(bool flag, string str) //creating message output for insert/update/delete
    {
        if (flag)
        {
            lbl_output.Text =  str + " was successful"; //if insert is successful subroutie )strMessage will say "(submission you inserted) was successful"
        }
        else
        {
            lbl_output.Text = "Sorry, unable to " + str + "submissions";//if insert fails then this message is produced.
        }
    }
   
}