using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_parkingBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Parking Booking";
    }
    protected void btnGenerateNo_Click(object sender, EventArgs e)
    {
        Random randomNumber = new Random();
        //Provide the min and max limit for the no
        int generatedNo = randomNumber.Next(100, int.MaxValue);
        accessDropDownFill objaccess = new accessDropDownFill();
        objaccess.insertTicket(generatedNo.ToString());
        lblRandomNumber.Text = generatedNo.ToString();
    }
}