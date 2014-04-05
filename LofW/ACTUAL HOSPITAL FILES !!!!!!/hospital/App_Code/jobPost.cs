using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for jobPosting
/// </summary>
public class jobPost
{
    public IQueryable<jobPosting> getJobs()
    {
        //creating an instance of LINQ object
        HospitalDataContext objJobs = new HospitalDataContext();
        //creating an variable with its value being the instance of our LINQ
        var allJobs = objJobs.jobPostings.Select(x => x);
        //return IQueryable<jobPosting> for data bound control

        return allJobs;
    }
    public IQueryable<jobPosting> getJobsById(int _id)
    {
        HospitalDataContext objJobs = new HospitalDataContext();
        var allJobs = objJobs.jobPostings.Where(x => x.Id == _id).Select(x => x);
        return allJobs;
    }

    public bool commitInsert(string _title, string _desc, DateTime _cdate, string _dept, string _status)
    {
        HospitalDataContext objJobs = new HospitalDataContext();
        using (objJobs)
        {
            //create an instance of table
            jobPosting objNewJob = new jobPosting();
            //set table columns to new values being passed from jobPosting.aspx page
            
            objNewJob.title = _title;
            objNewJob.description = _desc;
            objNewJob.closing_date = _cdate;
            objNewJob.department = _dept;
            objNewJob.status = _status;
            //insert command
            objJobs.jobPostings.InsertOnSubmit(objNewJob); //insert one complete row
            //commit insert against database
            objJobs.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id,string _title, string _desc, DateTime _cdate, string _dept, string _status)
    {
        HospitalDataContext objJobs = new HospitalDataContext();
        using (objJobs)
        {
            var objUpJobs = objJobs.jobPostings.Single(x => x.Id == _id);
            objUpJobs.title = _title;
            objUpJobs.description = _desc;
            objUpJobs.closing_date = _cdate;
            objUpJobs.department = _dept;
            objUpJobs.status = _status;
            //commit update against database
            objJobs.SubmitChanges();
           return true;
        }    
    }

    public bool commitDelete(int _id)
    {
        HospitalDataContext objJobdel = new HospitalDataContext();
        using (objJobdel)
        {
            var jobDel = objJobdel.jobPostings.Single(x => x.Id == _id);
            //delete command
            objJobdel.jobPostings.DeleteOnSubmit(jobDel);
            //commit delete against database
            objJobdel.SubmitChanges();
            return true;
        }
    }
}