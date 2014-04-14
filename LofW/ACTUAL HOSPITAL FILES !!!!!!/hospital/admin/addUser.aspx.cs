using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Globalization;

public partial class Admin_addUser : System.Web.UI.Page
{
    patientClass objPatient = new patientClass();

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void createUser(object sender, EventArgs e)
    {
        MembershipCreateStatus accountStatus;
        bool stat = false;

        MembershipUser NewPatient = Membership.CreateUser(txt_username.Text, txt_password.Text, txt_email.Text, txt_question.Text, txt_answer.Text, true, out accountStatus);

        switch (accountStatus)
        {
            case MembershipCreateStatus.Success:
                lbl_accountStatus.Text = "The user account for " + txt_fname.Text.ToString() +" "+ txt_lname.Text.ToString()   + " was successfully created";
               
                try
                {
                    Roles.AddUserToRole(txt_username.Text, "Patient");
                    lbl_accountStatus.Text += " and given the patient role";
                    stat = true;    
                }
                catch (HttpException Ex)
                {
                    lbl_accountStatus.Text += " Error:  " + Ex.Message;
                }

                if (stat)
                {
                    string birth = (Convert.ToDateTime(txt_dob.Text)).ToShortDateString();
                    CommandResult(objPatient.commitInsert(txt_fname.Text, txt_lname.Text, txt_address.Text, txt_phone.Text, txt_pc.Text, txt_city.Text, txt_country.Text, txt_username.Text,birth));
                }

                break;
            case MembershipCreateStatus.DuplicateUserName:
                lbl_accountStatus.Text = " The username:" + txt_username.Text.ToString() + "Already exist. Please enter a new username." ;
                break;

            case MembershipCreateStatus.DuplicateEmail:
                lbl_accountStatus.Text = "There already exists a user with this email address.";
                break;
            case MembershipCreateStatus.InvalidEmail:
                lbl_accountStatus.Text = "Invalid email address.";
                break;
            case MembershipCreateStatus.InvalidAnswer:
                lbl_accountStatus.Text = "Invalid security answer.";
                break;
            case MembershipCreateStatus.InvalidPassword:
                lbl_accountStatus.Text = "Invalid password. It must be seven characters long and have at least one non-alphanumeric character.";

                break;
            default:
                lbl_accountStatus.Text = "There was an unknown error; account was NOT created.";
                break;
        }
    }

    private void CommandResult(bool commandFlag )
    {
        if (commandFlag)
        {
            lbl_accountStatus.Text += "; added to the patient table";
        }

        else
        {
            lbl_accountStatus.Text += "; insert failed";
        }

    }



}