﻿using System;
using System.Collections.Generic;
using System.Linq/*importing necessary namespace.! */;
using System.Web;


public class illnessClass
{
    public IQueryable<illnessAdmin> getIllnesses()
    {
        HospitalDataContext objIll = new HospitalDataContext();

        var allIllnesses = objIll.illnessAdmins.Select(x => x); /*x just represents your columns ! */
        /*var allSubmissions = from x in objSub.submissions select x; ! */

        return allIllnesses;
    }
    public IQueryable<illnessAdmin> getIllnessesK(string _Location) //creating specific queries to call different illnesses based on region!
    {
        HospitalDataContext objIll = new HospitalDataContext();
       
        var Illnesses = objIll.illnessAdmins.Where(x => x.Location == "Kenora").Select(x=> x); //location has to equal Kenora!
    return Illnesses;
}
    public IQueryable<illnessAdmin> getIllnessesO(string _Location)
    {
        HospitalDataContext objIll = new HospitalDataContext();

        var Illnesses = objIll.illnessAdmins.Where(x => x.Location == "Ontario").Select(x => x); //location has to equal ontario!
        return Illnesses;
    }

    public IQueryable<illnessAdmin> getIllnessesC(string _Location)
    {
        HospitalDataContext objIll = new HospitalDataContext();

        var Illnesses = objIll.illnessAdmins.Where(x => x.Location == "Canada").Select(x => x); //location has to equal Canada!

        return Illnesses;
    }

    public IQueryable<illnessAdmin> getIllnessesByID(int _Id)
    {
        HospitalDataContext objIll = new HospitalDataContext();
        var allIllnesses = objIll.illnessAdmins.Where(x => x.Id == _Id).Select(x => x);
        return allIllnesses;
    }

    public bool commitInsert(string _InfectionName, string _Location, string _entryDate, string _Description, string __symptoms, string _preventatives, string _treatments, string _recomend) /* if it works it comes back as 1, if it doesn't it comes back at 0.  Just another method on how to do this.*/
    {
        HospitalDataContext objIll = new HospitalDataContext();
        using (objIll)
        {
            illnessAdmin objNewIll = new illnessAdmin(); /*referencing designer.cs file */
            objNewIll.InfectionName = _InfectionName;
            objNewIll.Location = _Location;
            objNewIll.entryDate = _entryDate;
            objNewIll.Description = _Description;
            objNewIll.symptoms = __symptoms;
            objNewIll.preventatives = _preventatives;
            objNewIll.treatments = _treatments;
            objNewIll.recomend = _recomend;

            objIll.illnessAdmins.InsertOnSubmit(objNewIll);  /*on submit does one row at a time, all submit submits all rows. and passes new parameter of objNewProd*/
            objIll.SubmitChanges();/*this commits change to database*/
            return true;
        }
    }

    //updates! COMMIT!
    public bool commitUpdate(int _Id, string _InfectionName, string _Location, string _entryDate, string _Description, string __symptoms, string _preventatives, string _treatments, string _recomend)
    {
        HospitalDataContext objIll = new HospitalDataContext();
        using (objIll)
        {
            var objUpIll = objIll.illnessAdmins.Single(x => x.Id == _Id);
            objUpIll.InfectionName = _InfectionName;
            objUpIll.Location = _Location;
            objUpIll.entryDate = _entryDate;
            objUpIll.Description = _Description;
            objUpIll.symptoms = __symptoms;
            objUpIll.preventatives = _preventatives;
            objUpIll.treatments = _treatments;
            objUpIll.recomend = _recomend;
            objIll.SubmitChanges();
            return true;
        }
    }
    public bool commitDelete(int _Id)
    {
        HospitalDataContext objIll = new HospitalDataContext();
        using (objIll)
        {
            var objDelIll = objIll.illnessAdmins.Single(x => x.Id == _Id);
            objIll.illnessAdmins.DeleteOnSubmit(objDelIll);
            objIll.SubmitChanges();
            return true;
        }
    }

}