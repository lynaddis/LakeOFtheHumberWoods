using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CalenderClass
/// </summary>
public class CalenderClass
{
    public List<Entry> getEntry()
    {
        HospitalDataContext objcal = new HospitalDataContext();
        var allEntries = objcal.Entries.Select(x => x);
        return allEntries.ToList(); //query for all entries to be returned -- list style !
    }

    public List<Entry> getEntryID(DateTime _EntryDate) //getting entries by ID!
    {
        HospitalDataContext objcal = new HospitalDataContext();
        var allEntries = objcal.Entries.Where(x => x.EntryDate == _EntryDate).Select(x => x);
        return allEntries.ToList();
    }
    //creating insert commit!
    public bool commitInsert(DateTime _EntryDate, string _AppAvail, string _SpecialistName, string _SpecialistField, string _AppInfo, string TimesAvail)
    {
        HospitalDataContext objcal = new HospitalDataContext();
        using (objcal) //use objcal (object created of hospitaldaatacontext!
        {
            Entry objNewEnt = new Entry(); //made new object to pass new values into database! (objNewEnt)!
            objNewEnt.EntryDate = _EntryDate;
            objNewEnt.AppAvail = _AppAvail;
            objNewEnt.SpecialistName = _SpecialistName;
            objNewEnt.SpecialistField = _SpecialistField;
            objNewEnt.AppInfo = _AppInfo;
            objNewEnt.TimesAvail = TimesAvail;
            objcal.Entries.InsertOnSubmit(objNewEnt); //inserts all fields when button is clicked!
            objcal.SubmitChanges(); //submit all changes!
            return true;
        }
    }
    //creating update!
    public bool commitUpdate(int _Id, DateTime _EntryDate, string _SpecialistName, string _SpecialistField, string _AppAvail, string _AppInfo, string _TimesAvail)
    {
        HospitalDataContext objschd = new HospitalDataContext();
        using (objschd)
        {
            var objUpEnt = objschd.Entries.Single(x => x.Id == _Id); //updates ID automatically!
            objUpEnt.EntryDate = _EntryDate;
            objUpEnt.SpecialistField = _SpecialistName; // all fields  with underscore must match ones in commitUpdate, which match what is in the dbml file...!
            objUpEnt.SpecialistField = _SpecialistField;
            objUpEnt.AppAvail = _AppAvail;
            objUpEnt.AppInfo = _AppInfo;
            objUpEnt.TimesAvail = _TimesAvail;
            objschd.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _Id) //comming a delete by deleting the ID! 
    {
        HospitalDataContext objcal = new HospitalDataContext();
        using (objcal)
        {
            var objDelCal = objcal.Entries.Single(x => x.Id == _Id); //column that contains Id! (X is just your colum and i assigned it as Id so it will delete everything in the column that the Id is deleted from)!
            objcal.Entries.DeleteOnSubmit(objDelCal);
            objcal.SubmitChanges();
            return true;
        }
    }
}