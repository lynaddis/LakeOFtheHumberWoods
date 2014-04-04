using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminhealthconcerns : System.Web.UI.Page
{
    illnessClass objSub = new illnessClass(); //calling linqClass from class file
    recomendClass objRec = new recomendClass();

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

    private void _subRebinded() //sub routine used to reset fields 
    {

        txt_infnameI.Text = string.Empty;
        txt_locationI.Text = string.Empty;
        txt_entryDateI.Text = string.Empty;
        txt_descI.Text = string.Empty;
        txt_symptomsI.Text = string.Empty;
        txt_preventI.Text = string.Empty;
        txt_treatmentsI.Text = string.Empty;
        txt_recommendI.Text = string.Empty;
        dtl_all.DataSource = objRec.getRecommendations();
        dtl_all.DataBind(); //binds data
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            rpt_rec.DataSource = objRec.getRecommendations();
            rpt_rec.DataBind();

            _subRebind();
            _subRebinded();

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

    protected void subDel(object sender, RepeaterCommandEventArgs e) //specify it is a datalist Command event args.
    {
        switch (e.CommandName)
        {
            case "Delete":

                int _Id = int.Parse(((HiddenField)e.Item.FindControl("hdf_Id")).Value);//use Id numbers to delete rows.
                _strMessage(objRec.commitDelete(_Id), "delete");
                _subRebinded();
                break;
            case "Cancel":
                _subRebinded();
                break;


        }
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Submissions" + str + " was successful"; //if insert is successful subroutie )strMessage will say "(submission you inserted) was successful"
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + "submissions";//if insert fails then this message is produced.
        }
    }
}
