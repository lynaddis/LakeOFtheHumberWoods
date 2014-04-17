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
        Master.pp_masterTitle = "Admin - Add Patient User"; //overwites master page title
    }

    // creates new patient user and adds it to the asp membership table and to the patients table 
    protected void createUser(object sender, EventArgs e)
    {
        MembershipCreateStatus accountStatus;
        bool stat = false;

        // creates new membership user 
        MembershipUser NewPatient = Membership.CreateUser(txt_username.Text, txt_password.Text, txt_email.Text, txt_question.Text, txt_answer.Text, true, out accountStatus);

        switch (accountStatus)
        {
                // on successful account creation try to add user to the patient role 
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

                if (stat) // user added to role successful then insert new user into patient table 
                {
                    string birth = (Convert.ToDateTime(txt_dob.Text)).ToShortDateString();
                    CommandResult(objPatient.commitInsert(txt_fname.Text, txt_lname.Text, txt_address.Text, txt_phone.Text, txt_pc.Text, txt_city.Text, txt_country.Text, txt_username.Text,birth));
                }

                break;
            // error handling 
            case MembershipCreateStatus.DuplicateUserName:
                lbl_accountStatus.Text = " The username:" + txt_username.Text.ToString() + "Already exist. Please enter a new username." ;
                break;
            // error handling 
            case MembershipCreateStatus.DuplicateEmail:
                lbl_accountStatus.Text = "There already exists a user with this email address.";
                break;
            // error handling 
            case MembershipCreateStatus.InvalidEmail:
                lbl_accountStatus.Text = "Invalid email address.";
                break;
            // error handling 
            case MembershipCreateStatus.InvalidAnswer:
                lbl_accountStatus.Text = "Invalid security answer.";
                break;
            // error handling 
            case MembershipCreateStatus.InvalidPassword:
                lbl_accountStatus.Text = "Invalid password. It must be seven characters long and have at least one non-alphanumeric character.";

                break;
            // error handling 
            default:
                lbl_accountStatus.Text = "There was an unknown error; account was NOT created.";
                break;
        }
    }

    // displays success message to admin
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