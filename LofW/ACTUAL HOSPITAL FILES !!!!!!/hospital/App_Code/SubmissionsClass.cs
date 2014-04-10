using System;
using System.Collections.Generic;
using System.Linq/*importing necessary namespace.*/;
using System.Web;


public class SubmissionsClass
{
    public IQueryable<submission> getSubmissions()
    {
        HospitalDataContext objSub = new HospitalDataContext();

        var allSubmissions = objSub.submissions.Select(x => x); /*x just represents your columns*/
        /*var allSubmissions = from x in objSub.submissions select x; */

        return allSubmissions;
    }

    public IQueryable<submission> getSubmissionsByID(int _Id)
    {
        HospitalDataContext objSub = new HospitalDataContext();
        var allSubmissions = objSub.submissions.Where(x => x.Id == _Id).Select(x => x);
        return allSubmissions;
    }

    public bool commitInsert(string _FullName, int _Age, string _Gender, string _Email, string _Phone, string _Reason, string _VolExp, string _ifYes, decimal _Nohours, string _PersonR, string _Interest, string _Allergies, string _Drefuse, string _Drequest) /* if it works it comes back as 1, if it doesn't it comes back at 0.  Just another method on how to do this.*/
    {
        HospitalDataContext objSub = new HospitalDataContext();
        using (objSub)
        {
            submission objNewSub = new submission(); /*referencing designer.cs file */
            objNewSub.FullName = _FullName;
            objNewSub.age = _Age;
            objNewSub.gender = _Gender; 
            objNewSub.email = _Email;
            objNewSub.phone = _Phone;
            objNewSub.reason = _Reason;
            objNewSub.VolExp = _VolExp;
            objNewSub.ifYes = _ifYes;
           
            objNewSub.noHours = _Nohours;
            
            objNewSub.personRequest = _PersonR;
            objNewSub.interest = _Interest;
            objNewSub.allergies = _Allergies;
            objNewSub.deptRefuse = _Drefuse;
            objNewSub.deptRequest = _Drequest;
            objSub.submissions.InsertOnSubmit(objNewSub);  /*on submit does one row at a time, all submit submits all rows. and passes new parameter of objNewProd*/
            objSub.SubmitChanges();/*this commits change to database*/
            return true;
        }
    }
    public bool commitUpdate(int _Id, string _FullName, int _Age, string _Gender, string _Email, string _Phone, string _Reason, string _VolExp, string _ifYes, decimal _Nohours, string _PersonR, string _Interest, string _Allergies, string _Drefuse, string _Drequest)
    {
        HospitalDataContext objSub = new HospitalDataContext();
        using (objSub)
        {
            var objUpSub = objSub.submissions.Single(x => x.Id == _Id);
            objUpSub.FullName = _FullName;
            objUpSub.age = _Age;
            objUpSub.gender = _Gender;
            objUpSub.email = _Email;
            objUpSub.phone = _Phone;
            objUpSub.reason = _Reason;
            objUpSub.VolExp = _VolExp;
            objUpSub.ifYes = _ifYes;
            
            objUpSub.noHours = _Nohours;
           
            objUpSub.personRequest = _PersonR;
            objUpSub.interest = _Interest;
            objUpSub.allergies = _Allergies;
            objUpSub.deptRefuse = _Drefuse;
            objUpSub.deptRequest = _Drequest;
            objSub.SubmitChanges();
            return true;
        }
    }
    public bool commitDelete(int _Id)
    {
        HospitalDataContext objSub = new HospitalDataContext();
        using (objSub)
        {
            var objDelSub = objSub.submissions.Single(x => x.Id == _Id);
            objSub.submissions.DeleteOnSubmit(objDelSub);
            objSub.SubmitChanges();
            return true;
        }
    }

}