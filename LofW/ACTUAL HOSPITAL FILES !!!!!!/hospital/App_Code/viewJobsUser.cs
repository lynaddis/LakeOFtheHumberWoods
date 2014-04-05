using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for viewJobsUser
/// </summary>
public class viewJobsUser
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
}