using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class calendar : System.Web.UI.Page
{
    DataSet dsCalendar = new DataSet();
    private string _connString;

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Calendar";
        if (!Page.IsPostBack)
        {

            calSchedule.VisibleDate = DateTime.Today;
            FillCalendarDataset();
        }
    }

    protected void FillCalendarDataset()
    {
        DateTime firstDate = new DateTime(calSchedule.VisibleDate.Year,
            calSchedule.VisibleDate.Month, 1);
        DateTime lastDate = GetFirstDayOfNextMonth();
        dsCalendar = GetCurrentMonthData(firstDate, lastDate);
    }
    protected DateTime GetFirstDayOfNextMonth()
    {
        int monthNumber, yearNumber;
        if (calSchedule.VisibleDate.Month == 12)
        {
            monthNumber = 1;
            yearNumber = calSchedule.VisibleDate.Year + 1;
        }
        else
        {
            monthNumber = calSchedule.VisibleDate.Month + 1;
            yearNumber = calSchedule.VisibleDate.Year;
        }
        DateTime lastDate = new DateTime(yearNumber, monthNumber, 1);
        return lastDate;
    }

    protected DataSet GetCurrentMonthData(DateTime firstDate, DateTime lastDate)
    {

        DataSet dsMonth = new DataSet();

        {


            _connString = WebConfigurationManager.ConnectionStrings["DeetaBaseConnectionString"].ConnectionString;
            String connString = _connString;
            SqlConnection dbConnection = new SqlConnection(connString);
            String query;
            query = "SELECT EntryDate, AppAvail FROM Entry WHERE EntryDate >= @firstDate AND EntryDate < @lastDate";
            SqlCommand dbCommand = new SqlCommand(query, dbConnection);
            dbCommand.Parameters.Add(new SqlParameter("@firstDate",
                firstDate));
            dbCommand.Parameters.Add(new SqlParameter("@lastDate", lastDate));

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(dbCommand);
            try
            {
                sqlDataAdapter.Fill(dsMonth);
            }
            catch { }
            return dsMonth;
        }
    }

    protected void calSchedule_DayRender(object sender, DayRenderEventArgs e)
    {
        DateTime nextDate;
        String appAvail;
        if (dsCalendar != null)
        {
            foreach (DataRow dr in dsCalendar.Tables[0].Rows)
            {
                nextDate = (DateTime)dr["EntryDate"];
                appAvail = (String)dr["AppAvail"];

                if (nextDate == e.Day.Date)
                {
                    e.Cell.BackColor = System.Drawing.Color.Coral;
                    //  e.Day.IsSelectable = true;

                    Label lbl_edate = new Label();
                    lbl_edate.Text = " <br>" + dr["EntryDate"];
                    e.Cell.Controls.Add(lbl_edate);

                    Label lbl_app = new Label();
                    lbl_app.Text = (Convert.ToString(dr["AppAvail"]));
                    lbl_app.ID = "lbl_app" + appAvail;
                    e.Cell.Controls.Add(lbl_app);


                    /* void day_change(object sender, EventArgs e)

                     {
                         lbl_output = calSchedule.SelectedDate.ToShortDateString();
                     }*/

                    /*
                    lbl_output.Text = "Appointments Available:" + "<br />";
                    for (int i = 0; i <= calSchedule.SelectedDates.Count - 1; i++)
                    {
                        lbl_output.Text += calSchedule.SelectedDates[i].ToShortDateString() + "<br />";
                    }*/

                }

            }
        }
    }

    protected void calSchedule_VisibleMonthChanged(object sender,
        MonthChangedEventArgs e)
    {
        FillCalendarDataset();
    }

}

/// <End of insanity calendar>

/// <Begining of regular stuff>

