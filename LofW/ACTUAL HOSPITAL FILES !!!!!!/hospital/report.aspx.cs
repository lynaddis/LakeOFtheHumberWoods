using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.Reporting.WebForms;



public partial class report : System.Web.UI.Page
{

    labClass objLab = new labClass();
    string user = HttpContext.Current.User.Identity.Name.ToString();

  private int ID;




    protected void _subRebind(string user)
    {

     rpt_report.ProcessingMode = ProcessingMode.Local;
     rpt_report.Reset();
     rpt_report.LocalReport.Dispose();
     rpt_report.LocalReport.DataSources.Clear();
       ReportDataSource LabResults = new ReportDataSource();
       LabResults.Name = "LabResults";
       DataTable dt = new DataTable();
       LabResults.Value = dt;
     rpt_report.LocalReport.ReportPath = "Report1.rdlc";
     rpt_report.LocalReport.DataSources["dt"].Value =  objLab.getLabsByID(ID);
     ID = objLab.getPatientCodeByUsername(user); // stores id of user to global variable for id 
     rpt_report.DataBind();
     rpt_report.LocalReport.Refresh();

        //DataTable dt = new DataTable("labs");
        //dt.Columns.Add(new DataColumn("Id", typeof(System.Int32)));
        //dt.Columns.Add(new DataColumn("patientID", typeof(System.String)));
        //dt.Columns.Add(new DataColumn("patientCode",typeof(System.String)));
        //dt.AcceptChanges();

        //String strName = this.rpt_report.LocalReport.DataSources[0].Name;

        //var labs = from item in dt.AsEnumerable()
        //             select new { Id = item.Field<int>("Id"),patientID = item.Field<String>("patientID"), PatientCode = item.Field<String>("patientCode") };
        //this.rpt_report.LocalReport.DataSources[0] = new Microsoft.Reporting.WebForms.ReportDataSource(strName, labs);
        //rpt_report.LocalReport.Refresh(); 
       
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Report";
        if (!Page.IsPostBack)
        {
            _subRebind(user);
         
        }
    }

    
          
    }






