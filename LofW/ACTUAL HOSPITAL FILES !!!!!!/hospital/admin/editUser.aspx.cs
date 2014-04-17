using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;


public partial class Admin_editUser : System.Web.UI.Page
{
    patientClass objPatient = new patientClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Edit User";
        if (!Page.IsPostBack)
        {
            lv_editUser.Items.Clear();
            subRebind();

            txt_byFName.Enabled = false;
            txt_byLname.Enabled = false;
            txt_bydob.Enabled = false;
            btn_byInfo.Enabled = false;

            txt_byUsername.Enabled = false;
            btn_byUsername.Enabled = false;
        }
    }

    // binds list of patients users
    protected void subRebind()
    {
        lv_editUser.Items.Clear();
        lv_editUser.DataSource = objPatient.getPatients(); 
        lv_editUser.EditIndex = -1;
        lv_editUser.DataBind();

        pnl_search.Visible = true;
    }

    // display check for user search
    protected void Checked(object sender, EventArgs e)
    {
        if (rbl_username.Checked)
        {
            txt_byUsername.Enabled = true;
            btn_byUsername.Enabled = true;

            btn_byInfo.Enabled = false;
            txt_byFName.Enabled = false;
            txt_byLname.Enabled = false;
            txt_bydob.Enabled = false;

        }


        if (rbl_info.Checked)
        {
            txt_byFName.Enabled = true;
            txt_byLname.Enabled = true;
            txt_bydob.Enabled = true;
            btn_byInfo.Enabled = true;

            txt_byUsername.Enabled = false;
            btn_byUsername.Enabled = false;

        }
    }

    // search for user by user name 
    protected void subByUsername(object sender, EventArgs e)
    {
        if (rbl_username.Checked == true && txt_byUsername.Text != "")
        {
           List<Patient> test = objPatient.getPatientByUsername(txt_byUsername.Text);
           if (test != null)
           {
               lbl_editlist.Text = "Search Results: By Username";
               lv_editUser.DataSource = test;
               lv_editUser.DataBind();
           }
           else
           {
               lbl_accountStatus.Text = "Status: No Account Found";
           }
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert(' Please Select an option to search by  ');</script>");
        }
        
    }

    // checks if date of birth entered is valid 
    protected void testDate(Object sender, ServerValidateEventArgs e)
    {
        DateTime dob;

        e.IsValid = (DateTime.TryParse(e.Value.ToString(), out dob));
    }

    // search by user info
    protected void subByInfo(object sender, EventArgs e)
    {
        if (rbl_info.Checked == true && txt_byFName.Text != "" && txt_byLname.Text != "" && txt_bydob.Text != "")
        {
            List<Patient> test = objPatient.getPatientByinfo(txt_byFName.Text, txt_byLname.Text, txt_bydob.Text);
            if (test != null)
            {
                lbl_editlist.Text = "Search Results: By User Info";
                lv_editUser.DataSource = test;
                lv_editUser.DataBind();
            }
            else
            {
                lbl_accountStatus.Text = "Status: No Account Found";
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "Message", "<SCRIPT LANGUAGE='javascript'>alert(' Please Select an option to search by  ');</script>");
        }
    }

    protected void subAdmin(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Editx": // sends selected user to the edit template and changes mode 

                int Pid = Convert.ToInt32(e.CommandArgument.ToString());
                lv_editUser.DataSource = objPatient.getPatientById(Pid);
                lv_editUser.EditIndex = 0;
                lv_editUser.DataBind();
                pnl_search.Visible = false;
                break;

            case"Updatex":
                updateUser(e); // sends user to be update 
                break;

            case "Cancelx":
                lbl_accountStatus.Text = ""; // cancel
                subRebind();
                break;
        }     
    }


    protected void updateUser(ListViewCommandEventArgs e)
    {
        string Fname = ((TextBox)e.Item.FindControl("txt_fname")).Text;
        string Lname = ((TextBox)e.Item.FindControl("txt_lname")).Text;
        string Address = ((TextBox)e.Item.FindControl("txt_address")).Text;
        string Phone = ((TextBox)e.Item.FindControl("txt_phone")).Text;
        string Postal = ((TextBox)e.Item.FindControl("txt_pc")).Text;
        string City = ((TextBox)e.Item.FindControl("txt_city")).Text;
        string Country = ((TextBox)e.Item.FindControl("txt_country")).Text;
        string birth = ((TextBox)e.Item.FindControl("txt_dob")).Text;

        string dob = (Convert.ToDateTime(birth)).ToString("dd/MM/yyyy");

        string usr = ((HiddenField)e.Item.FindControl("hdf_username")).Value.ToString();

        int Id = Convert.ToInt32(e.CommandArgument.ToString());
        bool update;
        update = objPatient.commitUpdate(Id, Fname, Lname, Address, Phone, Postal, City, Country, dob,usr); // updates user and dispays success message to user
        if (update)
        {
            lbl_accountStatus.Text = "Status: Patient Updated  :" +  " " + Id;
            subRebind();

        }
        else
        {
            lbl_accountStatus.Text = "Status: Update failed";
        }
      

    }

}