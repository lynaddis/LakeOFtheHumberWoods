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
        return allEntries.ToList();
    }

    public List<Entry> getEntryID(DateTime _EntryDate)
    {
        HospitalDataContext objcal = new HospitalDataContext();
        var allEntries = objcal.Entries.Where(x => x.EntryDate == _EntryDate).Select(x => x);
        return allEntries.ToList();
    }

    public bool commitInsert(DateTime _EntryDate, string _AppAvail, string _SpecialistName, string _SpecialistField, string _AppInfo, string TimesAvail)
    {
        HospitalDataContext objcal = new HospitalDataContext();
        using (objcal)
        {
            Entry objNewEnt = new Entry();
            objNewEnt.EntryDate = _EntryDate;
            objNewEnt.AppAvail = _AppAvail;
            objNewEnt.SpecialistName = _SpecialistName;
            objNewEnt.SpecialistField = _SpecialistField;
            objNewEnt.AppInfo = _AppInfo;
            objNewEnt.TimesAvail = TimesAvail;
            objcal.Entries.InsertOnSubmit(objNewEnt);
            objcal.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _Id, DateTime _EntryDate, string _AppAvail, string _SpecialistName, string _SpecialistField, string _AppInfo, string _TimesAvail)
    {
        HospitalDataContext objschd = new HospitalDataContext();
        using (objschd)
        {
            var objUpEnt = objschd.Entries.Single(x => x.Id == _Id);
            objUpEnt.EntryDate = _EntryDate;
            objUpEnt.AppAvail = _AppAvail;
            objUpEnt.SpecialistField = _SpecialistName;
            objUpEnt.SpecialistField = _SpecialistField;
            objUpEnt.AppAvail = _AppInfo;
            objUpEnt.TimesAvail = _TimesAvail;
            objschd.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _Id)
    {
        HospitalDataContext objcal = new HospitalDataContext();
        using (objcal)
        {
            var objDelCal = objcal.Entries.Single(x => x.Id == _Id);
            objcal.Entries.DeleteOnSubmit(objDelCal);
            objcal.SubmitChanges();
            return true;
        }
    }
}