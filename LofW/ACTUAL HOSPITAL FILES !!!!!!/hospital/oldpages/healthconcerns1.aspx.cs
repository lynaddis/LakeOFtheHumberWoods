using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HealthConcerns : System.Web.UI.Page
{
    illnessClass objLinq = new illnessClass();
    recomendClass objRec = new recomendClass();

  public List<illnessAdmin> illness;

 
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Location"]))
            {
                rpt_k.DataSource = illness.Where(x => x.Location == "Kenora").Select(x => x);
                dtl_Ont.DataSource = illness.Where(x => x.Location == "Ontario").Select(x => x);
                ltv_Can.DataSource = illness.Where(x => x.Location == "Canada").Select(x => x);
            }
            string Location = Request.QueryString["Location"];

            rpt_k.DataSource = objLinq.getIllnessesK(Location);
            rpt_k.DataBind();

            dtl_Ont.DataSource = objLinq.getIllnessesO(Location);
            dtl_Ont.DataBind();

            ltv_Can.DataSource = objLinq.getIllnessesC(Location);
            ltv_Can.DataBind();
        }
        
        
        }

   // protected void subSubmit(object sender, EventArgs e)
   // {

   // }

    private void _subRebind() //sub routine used to reset fields 
    {

        txt_nameI.Text = string.Empty;
        txt_illI.Text = string.Empty;
        txt_regionI.Text = string.Empty;
        txt_infoI.Text = string.Empty;

    }

    protected void subInsert(object sender, CommandEventArgs e)
    {
        switch (e.CommandName) //calls command names from presentation page for Insert.
        {
            case "Insert":


                _strMessage(objRec.commitInsert(txt_nameI.Text, txt_illI.Text, txt_regionI.Text, txt_infoI.Text.ToString()), "insert");
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

    
