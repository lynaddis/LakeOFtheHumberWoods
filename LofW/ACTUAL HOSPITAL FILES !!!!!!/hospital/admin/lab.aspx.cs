using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class lab : System.Web.UI.Page
{
    labClass objLab = new labClass(); //new instance of the class
    protected void dtl_Change(object sender, PagePropertiesChangingEventArgs e)
    {
        dp_listAll.SetPageProperties(e.StartRowIndex, e.MaximumRows, false); //datapager 
        _subRebind();

    }

        private void _subRebind()
        {
            txt_patientidI.Text = string.Empty;
            txt_patientcodeI.Text = string.Empty;
            txt_dobI.Text = string.Empty;
            txt_ageI.Text = string.Empty;
            txt_sexI.Text = string.Empty;
            txt_testTypeI.Text = string.Empty;
            txt_testCodeI.Text = string.Empty;
            txt_result1I.Text = string.Empty;
            txt_result2I.Text = string.Empty;
            txt_resultDescI.Text = string.Empty;
            txt_abnormalI.Text = string.Empty;
            txt_refrangeI.Text = string.Empty;
            txt_unitsI.Text = string.Empty;
            lst_all.DataSource = objLab.getLabs();
            lst_all.DataBind();
            // Binds the data from the database and allows it to be manipulated through the textboxes
        }
     protected void Page_Load(object sender, EventArgs e)
     {
         if (!Page.IsPostBack)// Shows if the page is visited for the first time
         {
             _subRebind();
         }
    }

     protected void subAdmin(object sender, CommandEventArgs e) // Admin inserts or cancels records into the database using linq 
    {
        switch (e.CommandName)
        {
                        
          case "Insert":
                string DateofBirth = (Convert.ToDateTime(txt_dobI.Text)).ToShortDateString();
                int pid = Convert.ToInt32(txt_patientidI.Text.ToString());
                _strMessage(objLab.commitInsert(pid, txt_patientcodeI.Text.ToString(), txt_ageI.Text.ToString(), txt_sexI.Text.ToString(), txt_testTypeI.Text.ToString(), txt_testCodeI.Text.ToString(), txt_result1I.Text.ToString(), txt_result2I.Text.ToString(), txt_resultDescI.Text.ToString(), txt_abnormalI.Text.ToString(), txt_refrangeI.Text.ToString(), txt_unitsI.Text.ToString(), DateofBirth), "insert");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break; 
        }

    }

    private void _strMessage (bool flag, string str)

    {
        if (flag)
        {
            lbl_message.Text = "lab " + str + "was successful"; // Error handling / mesage handling

                    }

                    else 
                {
                    lbl_message.Text ="Sorry, unable to  " + str + "lab";

                }
    }
    protected void subUpDel(object sender, ListViewCommandEventArgs e) // allows Updates or deletes data using the textboxes  from the interface which is bounded to the database
    {

        switch (e.CommandName)
        {
            case "UpdateE":
                TextBox txtpID = (TextBox)e.Item.FindControl("txt_patientidE");
                TextBox txtPC = (TextBox)e.Item.FindControl("txt_patientcodeE");
                TextBox txtdob = (TextBox)e.Item.FindControl("txt_dobE");
                TextBox txtSex = (TextBox)e.Item.FindControl("txt_sexE");
                TextBox txtAge = (TextBox)e.Item.FindControl("txt_ageE");
                TextBox txtType = (TextBox)e.Item.FindControl("txt_testTypeE");
                TextBox txtCode = (TextBox)e.Item.FindControl("txt_testCodeE");
                TextBox txtResult1 = (TextBox)e.Item.FindControl("txt_result1E");
                TextBox txtResult2 = (TextBox)e.Item.FindControl("txt_result2E");
                TextBox txtResultD = (TextBox)e.Item.FindControl("txt_resultDescE");
                TextBox txtAbnormal = (TextBox)e.Item.FindControl("txt_abnormalE");
                TextBox txtRef = (TextBox)e.Item.FindControl("txt_refrangeE");
                TextBox txtUnits = (TextBox)e.Item.FindControl("txt_unitsE");
                               
                
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int labID = Convert.ToInt32(hdfID.Value.ToString());
                int pid = Convert.ToInt32(txtpID.Text.ToString());
                string DateofBirth = (Convert.ToDateTime(txtdob.Text)).ToString("dd/MM/yyyy");
                _strMessage(objLab.commitUpdate(labID,pid,txtPC.Text.ToString(),txtAge.Text.ToString(),txtSex.Text.ToString(),txtType.Text.ToString(),txtCode.Text.ToString(),txtResult1.Text.ToString(),txtResult2.Text.ToString(),txtResultD.Text.ToString(),txtAbnormal.Text.ToString(),txtRef.Text.ToString(),txtUnits.Text.ToString(), DateofBirth), "update");
                 _subRebind();
                break;
            case "DeleteE": //delete record from the database by the ID
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMessage(objLab.commmitDelete(_id), "delete");
                _subRebind();
                break;
            case "CancelE":
                _subRebind();
                break;

        }


    }
    
 
}