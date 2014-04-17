using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql; //imported!
using System.Data.SqlClient;//imported!
using System.Web.Configuration;//imported!
using System.Drawing;//imported!

public partial class visitingspecialists : System.Web.UI.Page
{
    //The Brink of Insanity: A Calendar Story

    //once upon a time I used a dataset class 
    DataSet dsMonth = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Visiting Specialist"; 

        if (!Page.IsPostBack)
        {
           


       
            calSchedule.VisibleDate = DateTime.Today; 
            GetCurrentMonthData(); //this  was my dataset that calls database connection !
            calSchedule.TitleStyle.BackColor = Color.Tan; //this made teh cell backgrounds tan!
            calSchedule.TitleStyle.Height = 35;

        }
    }
    

    DataSet GetCurrentMonthData() //whenever I call this bad boy my connection is opened and closed!
    {


        string _connString = WebConfigurationManager.ConnectionStrings["DeetaBaseConnectionString"].ConnectionString;

        SqlConnection dbConnection = new SqlConnection(_connString);
        string query;
        query = "SELECT * FROM Entry"; //So i made my query to call all things from my Entry table...
        SqlCommand dbCommand = new SqlCommand(query, dbConnection);
     
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(dbCommand);
        try
        {
            dbConnection.Open(); 
           //and made sure my connection was totally open 

            sqlDataAdapter.Fill(dsMonth); 
        }
        catch (Exception ex)
        {

            lbl_output.Text = ex.Message.ToString(); //I even made sure that if somethign goes wrong with the connection this will produce a message!

        }
        finally
        {
            dbConnection.Close();
            //then for good practiced, made sure my connection was closed.
        }

        return dsMonth;

    }


    protected void Cal_DR(object sender, DayRenderEventArgs e)  //DAY RENDER CAN FIND TABLE [0]!
    {
        //it all seems to be going great.. but then...
       //IT JUST DIDN'T WORK!   It didn't make sense because: 
        if (e != null) // if day is not null
        {
            Style style = new Style(); //then the styles would work
            // stylez
            GetCurrentMonthData(); // the connection would open

            foreach (DataRow dr in dsMonth.Tables[0].Rows) // and for each datarow in my table
            {
                string nextDate = dr["EntryDate"].ToString(); //that contained Entry date
                DateTime nDate = DateTime.Parse(nextDate);//(parsing it to date time)
             
                if (e.Day.Date == nDate) // would be identified as having an entry date.. SO if a day had an entry date
                {
                    e.Cell.ApplyStyle(style); // i would apply some styles
                    e.Cell.BackColor = Color.LightCoral; //like lightCoral!
                    
                    e.Cell.Text = dr["SpecialistName"].ToString(); //and also the specialist Name would be listed in the day cell
                    e.Cell.Attributes.Add("onclick", e.SelectUrl); //and when people clicked it, the information would be outputted
                    
                }
                
                
                e.Cell.Height = 65; //(had to make sure cells stayed the same size!
                e.Cell.Width = 65;
                /// but none of this stuff was showing up.. even though I wrote it like 7 different ways (that ended up being right).
                /// so what the heck was the problem?
                /// MONTH day year = date format was the problem.  who puts months first, seriously?  

            }
         

        }

    }

    protected void selectChange(object sender, EventArgs e)
    {

        GetCurrentMonthData(); //so once I fixed that date format problem.. I opened my connection string.

        //I added selectChange subroutine so that data row could Find Table[0]!
        string specName = ""; //made some strings for all the stuff i was going to output when peopel clicked days
        string appAvail = "";
        string appInfo = "";
        string specField = "";
        string times = "";
       
        if (e != null) //so if the day wasn't null
        {

            Calendar dee = (Calendar)sender; //then send the calendar sender named after me

            foreach (DataRow dr in dsMonth.Tables[0].Rows) //and call those datarows again
            {
                string nextDate = dr["EntryDate"].ToString(); //made nextdate string that is equal to entry date
                DateTime nDate = DateTime.Parse(nextDate); //parsed it
                if (dee.SelectedDate.Date == nDate) //then if the selected date is equal to nDate (which is the parsed version of nextdate)
                {
                  //then all these wonderful things will appear
                    specName = dr["SpecialistName"].ToString();
                    specField = dr["SpecialistField"].ToString();
                    appAvail = dr["AppAvail"].ToString();
                    appInfo = dr["AppInfo"].ToString();
                    times = dr["TimesAvail"].ToString();
             
                }
            }
           //HOWEVER if there is no inforamtion on a day that was clicked
            if ((appAvail == null) || (appAvail == ""))
            {
                lbl_output.Text = "No Appointments Available Today "; //this is the message will display instead
            }
            else { lbl_output.Text = "<br /><strong> Specialist Name:</strong> " + specName + "<br /><br /><strong>Specialist Field:</strong> " + specField + "<br /><br /><strong>Appointment Information:</strong> " + appInfo + "<br /><br /><strong>Available Appointments:</strong> " + appAvail + "<br /><br /><strong>Appointments Available: </strong>" + times; } //but when there is information, this great bit of information is outputted into that label created on the presentation page

        }
    }
}

//And that's how you make a calendar With ADO ! 

/// <End of insanity: The Calendar Story>



