using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EmployeeClass
/// </summary>
public class EmployeeClass
{
    public bool commitInsert(string _firstname, string _lastname, string _email, ulong _phone, ulong _ophone, string _address, string _pcode, 
        string _state, string _country, DateTime _edu_date_from, string _edu_date_to, string _level, string _edu_institute, string _work_exp, string _jobTitle)
    {
        HospitalDataContext objEmployee = new HospitalDataContext();
        using (objEmployee)
        {
            employee objNewEmployee = new employee();  // object of table
            objNewEmployee.firstname = _firstname;
            objNewEmployee.lastname = _lastname;
            objNewEmployee.email = _email;
            objNewEmployee.primary_phone = _phone;
            objNewEmployee.other_phone = _ophone;
            objNewEmployee.address = _address;
            objNewEmployee.postal_code = _pcode;
            objNewEmployee.state = _state;
            objNewEmployee.country = _country;
            objNewEmployee.edu_date_from = _edu_date_from;
            objNewEmployee.edu_date_to = _edu_date_to;
            objNewEmployee.level = _level;
            objNewEmployee.edu_institute = _edu_institute;
            objNewEmployee.work_exp = _work_exp;
            objNewEmployee.jobTitle = _jobTitle;

            //Add the new object to collection of applicants
            objEmployee.employees.InsertOnSubmit(objNewEmployee);
            objEmployee.SubmitChanges();
            return true;

        }

    }
    //public string getTitleByID(int _id)
    //{
    //    HospitalDataContext objContact = new HospitalDataContext();
    //    var singleRow = (from p in objContact.employees
    //                     where p.Id == _id
    //                     select p).Single();
      
    //    var singlePostRow = (from q in objContact.jobPostings
    //                         where q.Id == singleRow.job_id
    //                         select q).Single();
    //    return singlePostRow.title;
       

    //}
    //it will return all the job titles
    public String[] getTitles()
    {
       HospitalDataContext objTitle = new HospitalDataContext();
       var personnelIds = objTitle.jobPostings
      .Select(p => p.title)
      .ToArray();
      return personnelIds;
   }
}