using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class volunteer : System.Web.UI.Page
{
    SubmissionsClass objLinq = new SubmissionsClass(); //calling linqClass from class file


    private void _subRebind() //sub routine used to reset fields 
    {

        txt_nameI.Text = string.Empty;
        txt_ageI.Text = string.Empty;
        txt_genderI.Text = string.Empty;
        txt_emailI.Text = string.Empty;
        txt_phoneI.Text = string.Empty;
        txt_reasonI.Text = string.Empty;
        txt_VolExpI.Text = string.Empty;
        txt_ifYesI.Text = string.Empty;
        txt_noHoursI.Text = string.Empty;
        txt_personRequestI.Text = string.Empty;
        txt_interestI.Text = string.Empty;
        txt_allergiesI.Text = string.Empty;
        txt_deptRefuseI.Text = string.Empty;
        txt_deptRequestI.Text = string.Empty;
        dtl_all.DataSource = objLinq.getSubmissions();
        dtl_all.DataBind(); //binds data
    }


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            _subRebind();

        }

    }



    protected void subInsert(object sender, CommandEventArgs e)
    {
        switch (e.CommandName) //calls command names from presentation page for Insert.
        {
            case "Insert":
                
                _strMessage(objLinq.commitInsert(txt_nameI.Text, int.Parse(txt_ageI.Text), txt_genderI.Text, txt_emailI.Text, txt_phoneI.Text, txt_reasonI.Text, txt_VolExpI.Text, txt_ifYesI.Text, decimal.Parse(txt_noHoursI.Text), txt_personRequestI.Text, txt_interestI.Text, txt_allergiesI.Text, txt_deptRefuseI.Text, txt_deptRequestI.Text.ToString()), "insert");
                _subRebind();
                break;
            case "Cancel": //only needs subrebind because you aren't changing anything, so fields justneed to be reset
                _subRebind();
                break;

        }

    }
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Thankyou " + txt_nameI.Text + ", your form has successfully been " + str + "ed!"; //if insert is successful subroutie )strMessage will say "(submission you inserted) was successful"
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + "submissions";//if insert fails then this message is produced.
        }
    }
}