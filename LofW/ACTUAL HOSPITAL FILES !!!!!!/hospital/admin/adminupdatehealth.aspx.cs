using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    illnessClass objHealth = new illnessClass(); //illness Linq class!

    protected void dtl_change(object sender, PagePropertiesChangingEventArgs e)
    {
        datapager_listAll.SetPageProperties(e.StartRowIndex, e.MaximumRows, false); //datapager subroutine!
        _subRebind();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Update Health";
        if (!IsPostBack)
        {

            _subRebind();//subroutine for insert!
            _subRebinded(); //second rebind to work with recommendations information / class!
        }

    }
    private void _strMessage(bool flag, string str) //message for updates/deletes!
    {
        if (flag)
        {
            lbl_message.Text = "Record has been successfully " + str + "d!";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + "form";
        }
    }

    private void _subRebind() //sub routine used to reset fields !
    {

        ltv_update.DataSource = objHealth.getIllnesses();
        ltv_update.DataBind(); //binds data!
    }

    protected void subUpDel(object sender, ListViewCommandEventArgs e) //specify it is a datalist Command event args.!
    {
        switch (e.CommandName) //updateX = update button command name!
        {
            case "UpdateX":

                TextBox txtname = (TextBox)e.Item.FindControl("txt_infnameU");
                TextBox txtloc = (TextBox)e.Item.FindControl("txt_locationU");
                TextBox txtentry = (TextBox)e.Item.FindControl("txt_entryDateU");
                TextBox txtdesc = (TextBox)e.Item.FindControl("txt_descU");
                TextBox txtsympt = (TextBox)e.Item.FindControl("txt_symptomsU");
                TextBox txtprev = (TextBox)e.Item.FindControl("txt_preventU");
                TextBox txttreat = (TextBox)e.Item.FindControl("txt_treatmentsU");
                TextBox txtrec = (TextBox)e.Item.FindControl("txt_recommendU");

                HiddenField hdfId = (HiddenField)e.Item.FindControl("hdf_Id");
                int subId = int.Parse(hdfId.Value.ToString());


                _strMessage(objHealth.commitUpdate(subId, txtname.Text, txtloc.Text, txtentry.Text, txtdesc.Text, txtsympt.Text, txtprev.Text, txttreat.Text, txtrec.Text.ToString()), "update"); 
                _subRebind();

                break;

            case "DeleteX":
                int _Id = int.Parse(((HiddenField)e.Item.FindControl("hdf_Id")).Value);//use Id numbers to delete rows.!
                _strMessage(objHealth.commitDelete(_Id), "delete");
                _subRebind();
                break;
            case "CancelX":
                _subRebind();
                break;
        }
    }

    recomendClass objRec = new recomendClass(); //recommend class for recommendations on presentation page!

    private void _subRebinded() //sub routine used to reset fields !
    {

        rep_rec.DataSource = objRec.getRecommendations(); //calling query from recommend class!
        rep_rec.DataBind(); //binds data!
    }
    protected void recDelete(object sender, RepeaterCommandEventArgs e) //repeaterCommand to work!
    {
        switch (e.CommandName)
        {
            case "Deletex":
                int _Id = int.Parse(((HiddenField)e.Item.FindControl("hdf_IdD")).Value);//use Id numbers to delete rows.!
                _strdMessage(objRec.commitDelete(_Id), "delete");
                _subRebinded();
                break;
            case "Cancelx":
                _subRebinded();
                break;
        }
    }
    private void _strdMessage(bool flag, string str) //message output for recommendations (when deleted)!
    {
        if (flag)
        {
            lbl_output.Text = "Record has been successfully " + str + "d!";
        }
        else
        {
            lbl_output.Text = "Sorry, unable to " + str + "form";
        }
    }
}