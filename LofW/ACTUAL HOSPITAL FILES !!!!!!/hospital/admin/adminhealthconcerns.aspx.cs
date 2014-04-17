using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminhealthconcerns : System.Web.UI.Page
{
    illnessClass objSub = new illnessClass(); //calling linqClass from class file
   

    private void _subRebind() //sub routine used to reset fields 
    {

        txt_infnameI.Text = string.Empty;
        txt_locationI.Text = string.Empty;
        txt_entryDateI.Text = string.Empty;
        txt_descI.Text = string.Empty;
        txt_symptomsI.Text = string.Empty;
        txt_preventI.Text = string.Empty;
        txt_treatmentsI.Text = string.Empty;
        txt_recommendI.Text = string.Empty;
        dtl_all.DataSource = objSub.getIllnesses();
        dtl_all.DataBind(); //binds data
    }

   
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Health Concerns"; //title for page

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



                _strMessage(objSub.commitInsert(txt_infnameI.Text, txt_locationI.Text, txt_entryDateI.Text, txt_descI.Text, txt_symptomsI.Text, txt_preventI.Text, txt_treatmentsI.Text, txt_recommendI.Text.ToString()), "insert");
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
            lbl_message.Text = "New record was successfully" + str + "ed"; //if insert is successful subroutie )strMessage will say "(submission you inserted) was successful"
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " record";//if insert fails then this message is produced.
        }
    }
}
