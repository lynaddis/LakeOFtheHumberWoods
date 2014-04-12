using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminvolunteer : System.Web.UI.Page
{
    SubmissionsClass objVol = new SubmissionsClass();

    protected void dtl_Change(object sender, PagePropertiesChangingEventArgs e)
    {
        dp_listAll.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

    }


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            _subRebind();

        }

    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Submission" + str + "has been submitted!";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + "Submit";
        }
    }

    private void _subRebind() //sub routine used to reset fields 
    {

        ltv_all.DataSource = objVol.getSubmissions();
        ltv_all.DataBind(); //binds data
    }

    protected void subEdit(object sender, ListViewCommandEventArgs e) //specify it is a datalist Command event args.
    {
        switch (e.CommandName)
        {
            case "Update":

                TextBox txtname = (TextBox)e.Item.FindControl("txt_nameE");
                TextBox txtage = (TextBox)e.Item.FindControl("txt_ageE");
                TextBox txtgender = (TextBox)e.Item.FindControl("txt_genderE");
                TextBox txtemail = (TextBox)e.Item.FindControl("txt_emailE");
                TextBox txtphone = (TextBox)e.Item.FindControl("txt_phoneE");
                TextBox txtreason = (TextBox)e.Item.FindControl("txt_reasonE");
                TextBox txtVolExp = (TextBox)e.Item.FindControl("txt_VolExpE");
                TextBox txtifYes = (TextBox)e.Item.FindControl("txt_ifYesE");
                TextBox txtnoHours = (TextBox)e.Item.FindControl("txt_noHoursE");
                TextBox txtpersonRequest = (TextBox)e.Item.FindControl("txt_personRequestE");
                TextBox txtinterest = (TextBox)e.Item.FindControl("txt_interestE");
                TextBox txtallergies = (TextBox)e.Item.FindControl("txt_allergiesE");
                TextBox txtdeptRefuse = (TextBox)e.Item.FindControl("txt_deptRefuseE");
                TextBox txtdeptRequest = (TextBox)e.Item.FindControl("txt_deptRequestE");

                HiddenField hdfId = (HiddenField)e.Item.FindControl("hdf_IdE");
                int subId = int.Parse(hdfId.Value.ToString());

                int AgeU = Convert.ToInt32(txtage.Text.ToString());

                _strMessage(objVol.commitUpdate(subId, txtname.Text, AgeU, txtgender.Text, txtemail.Text, txtphone.Text, txtreason.Text, txtVolExp.Text, txtifYes.Text, decimal.Parse(txtnoHours.Text), txtpersonRequest.Text, txtinterest.Text, txtallergies.Text, txtdeptRefuse.Text, txtdeptRequest.Text.ToString()), "update");
                _subRebind();

                break;

            case "Delete":
                int _Id = int.Parse(((HiddenField)e.Item.FindControl("hdf_IdE")).Value);//use Id numbers to delete rows.
                _strMessage(objVol.commitDelete(_Id), "delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }



}
