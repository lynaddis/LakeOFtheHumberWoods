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

    }

    private void _subRebind() //sub routine used to reset fields 
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
        switch (e.CommandName) //calls command names from presentation page for Insert.
        {
            case "Insert":

                DateTime Date = (DateTime.Parse(txt_entryDateI.Text.ToString()));
               // string nextDate = (Convert.(specCal.ToString["EntryDate"])); //identified by EntryDate
             //   DateTime nDate = DateTime.Parse(nextDate);//parsing it to date time
              //  DateTime entryDate = Convert.ToDateTime(specCal.["EntryDate"]).ToString("MM/DD/YYYY"); 

              _strMessage(specCal.commitInsert(Date, txt_appAvailI.Text, txt_snameI.Text, txt_fieldI.Text, txt_appInfoI.Text, txt_timeI.Text), "insert");
                _subRebind();
                break;
            case "Cancel": //only needs subrebind because you aren't changing anything, so fields justneed to be reset
                _subRebind();
                break;

        }

    }
    protected void subEdit(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "UpdateE":

                TextBox txtnameE = (TextBox)e.Item.FindControl("txt_snameE");
                TextBox txtfieldE = (TextBox)e.Item.FindControl("txt_fieldE");
                TextBox txtappAvailE = (TextBox)e.Item.FindControl("txt_appAvailE");
                TextBox txtappInfoE = (TextBox)e.Item.FindControl("txt_appInfoE");
                TextBox txttimesAvailE = (TextBox)e.Item.FindControl("txt_timesAvailE");
               
                HiddenField hdfIDU = (HiddenField)e.Item.FindControl("hdf_idE");
                DateTime cal = DateTime.Parse(hdfIDU.Value.ToString());

                _strMessage(specCal.commitUpdate(cal, txtfieldE.Text, txtappAvailE.Text, txtappAvailE.Text, txtappInfoE.Text, txttimesAvailE.Text), "update");

                _subRebind();

                break;

            case "DeleteE":
               
                DateTime _EntryDate = DateTime.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);

                _strMessage(specCal.commitDelete(_EntryDate), "delete");
                _subRebind();
                break;
            case "CancelE":
                _subRebind();
                break;
        }
    }


    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_output.Text = "Submissions" + str + " was successful"; //if insert is successful subroutie )strMessage will say "(submission you inserted) was successful"
        }
        else
        {
            lbl_output.Text = "Sorry, unable to " + str + "submissions";//if insert fails then this message is produced.
        }
    }
}