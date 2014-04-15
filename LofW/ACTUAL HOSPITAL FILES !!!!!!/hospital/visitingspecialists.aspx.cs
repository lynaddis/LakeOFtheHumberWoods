using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

public partial class visitingspecialists : System.Web.UI.Page
{
    
    DataSet dsMonth = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            string hex;


         //   calSchedule.TitleStyle.BackColor _color = ColorTranslator.FromHtml(hex);
            calSchedule.VisibleDate = DateTime.Today;
            GetCurrentMonthData();
            calSchedule.TitleStyle.BackColor = Color.Tan;
            calSchedule.TitleStyle.Height = 35;

        }
    }

    DataSet GetCurrentMonthData()
    {


        string _connString = WebConfigurationManager.ConnectionStrings["DeetaBaseConnectionString"].ConnectionString;

        SqlConnection dbConnection = new SqlConnection(_connString);
        string query;
        query = "SELECT * FROM Entry";
        SqlCommand dbCommand = new SqlCommand(query, dbConnection);
     
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(dbCommand);
        try
        {
            dbConnection.Open();
           //remember when my connection wasn't open? 

            sqlDataAdapter.Fill(dsMonth);
        }
        catch (Exception ex)
        {

            lbl_output.Text = ex.Message.ToString();

        }
        finally
        {
            dbConnection.Close();
            //closed: for good practice
        }

        return dsMonth;

    }


    protected void Cal_DR(object sender, DayRenderEventArgs e)
    {
       
        if (e != null)
        {
            Style style = new Style();
            // stylez
            GetCurrentMonthData();

            foreach (DataRow dr in dsMonth.Tables[0].Rows)
            {
                string nextDate = dr["EntryDate"].ToString(); //identified by EntryDate
                DateTime nDate = DateTime.Parse(nextDate);//parsing it to date time
             
                if (e.Day.Date == nDate)// && (!e.Day.IsOtherMonth))
                {
                    e.Cell.ApplyStyle(style);
                    e.Cell.BackColor = Color.LightCoral;
                    
                    e.Cell.Text = dr["SpecialistName"].ToString();
                    e.Cell.Attributes.Add("onclick", e.SelectUrl);
                    // appAvail = (String)dr["AppAvail"];
                    // nDate = (DateTime)dr["EntryDate"];
                    /* Label lbl_edate = new Label();
                     lbl_edate.Text = " <br>" + dr["EntryDate"];
                     e.Cell.Controls.Add(lbl_edate);*/
                }
                //e.Day.IsSelectable = true;
                // e.Cell.Text = dr["AppAvail"].ToString();

                //string hex = "#f7bd41";

                //calSchedule.TitleStyle.BackColor _color = System.Drawing.ColorTranslator.FromHtml(hex);
                
                e.Cell.Height = 65;
                e.Cell.Width = 65;


                /*  Label lbl_app = new Label();
                  lbl_app.Text = (Convert.ToString(dr["AppAvail"]));
                  lbl_app.ID = "lbl_app" + appAvail;
                  e.Cell.Controls.Add(lbl_app);*/


            }
         

        }

    }

    protected void selectChange(object sender, EventArgs e)
    {

        GetCurrentMonthData(); //connects
        string specName = "";
        string appAvail = "";
        string appInfo = "";
        string specField = "";
        string times = "";
        //  String appAvail;
        if (e != null)
        {

            Calendar dee = (Calendar)sender;

            foreach (DataRow dr in dsMonth.Tables[0].Rows)
            {
                string nextDate = dr["EntryDate"].ToString();
                DateTime nDate = DateTime.Parse(nextDate);
                if (dee.SelectedDate.Date == nDate)
                {
                    // lbl_output.Text = "The selected date is " + calSchedule.SelectedDate.ToShortDateString();
                    specName = dr["SpecialistName"].ToString();
                    specField = dr["SpecialistField"].ToString();
                    appAvail = dr["AppAvail"].ToString();
                    appInfo = dr["AppInfo"].ToString();
                    times = dr["TimesAvail"].ToString();
                    // DateTime ndate3 = DateTime.Parse(ndate2);
                    //this is where i'd add in more stuff
                }
            }
            //String appAvail;
            if ((appAvail == null) || (appAvail == ""))
            {
                lbl_output.Text = "sadfdsa. ";
            }
            else { lbl_output.Text = "<br /><strong> Specialist Name:</strong> " + specName + "<br /><br /><strong>Specialist Field:</strong> " + specField + "<br /><br /><strong>Appointment Information:</strong> " + appInfo + "<br /><br /><strong>Available Appointments:</strong> " + appAvail + "<br /><br /><strong>Appointments Available: </strong>" + times; }

        }
    }
}



/*  lbl_output.Text - appAvail["AppAvail"].ToString();
    protected void Calendar1_VisibleMonthChanged(object sender,
        MonthChangedEventArgs e)
    {
        FillCalDataset();
    }}*/


/// <End of insanity calendar>

/// <Begining of regular stuff>

