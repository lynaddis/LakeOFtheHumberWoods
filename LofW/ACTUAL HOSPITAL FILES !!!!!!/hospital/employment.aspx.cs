using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    EmployeeClass objEmployment = new EmployeeClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Employment";
       //Load dropdown list with title values
        ddl_title.DataSource = objEmployment.getTitles();
        ddl_title.DataBind();

    }
    protected void _subRebind()
    {
        txt_fname.Text = string.Empty;
        txt_lname.Text = string.Empty;
        txt_address.Text = string.Empty;
        txt_country.Text = string.Empty;
        txt_edufrom.Text = string.Empty;
        txt_eduInstitute.Text = string.Empty;
        txt_eduLevel.Text = string.Empty;
        txt_eduto.Text = string.Empty;
        txt_email.Text = string.Empty;
        txt_ophone.Text = string.Empty;
        txt_phone.Text = string.Empty;
        txt_state.Text = string.Empty;
        txt_wexp.Text = string.Empty;
  }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {

           // lbl_employment.Text = "Thank you for Applying! we will get back to you soon";
        }
        else
        {
            lbl_employment.Text = "Please fill in the required fields !";
        }
    }
    // To allow Applicant to upload resume
    protected void Button1_Click()
    {
        int[] temp = objEmployment.getApplicantID();
        string applicant_id = temp[temp.Length-1].ToString();

        if (FileUpload1.HasFile)
        {
            String extn = System.IO.Path.GetExtension(FileUpload1.FileName);           
            if (".docx" == extn)
            {
                FileUpload1.SaveAs(Server.MapPath("~/resumes/" +applicant_id+ "_"+ FileUpload1.FileName));
                emptyupload.Text = "Save sucessfully";
            }
            else
            {
                emptyupload.Text = "only docx support";  // restrict any other file than .docx
            }
        }
        else
        {
            emptyupload.Text = "no file to upload";
        }
    }

    protected void subInsert(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objEmployment.commitInsert(txt_fname.Text, txt_lname.Text, txt_email.Text.ToString(), ulong.Parse(txt_phone.Text.ToString()), 
                    ulong.Parse(txt_ophone.Text.ToString()),txt_address.Text.ToString(),txt_pcode.Text.ToString(),txt_state.Text.ToString(),txt_country.Text.ToString(),
                    DateTime.Parse(txt_edufrom.Text.ToString()),txt_eduto.Text.ToString(),txt_eduLevel.Text.ToString(),txt_eduInstitute.Text.ToString(),
                    txt_wexp.Text.ToString(), ddl_title.SelectedValue.ToString()), "insert");
                Button1_Click();
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;

            case "Upload":
                {  break; }
        }
    }
}