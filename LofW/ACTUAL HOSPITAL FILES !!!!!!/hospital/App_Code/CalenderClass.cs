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
        submClassDataContext objcal = new submClassDataContext();
        var allEntries = objcal.Entries.Select(x => x);
        return allEntries.ToList();
    }

    public List<Entry> getEntryID(DateTime _EntryDate)
    {
        submClassDataContext objcal = new submClassDataContext();
        var allEntries = objcal.Entries.Where(x => x.EntryDate == _EntryDate).Select(x => x);
        return allEntries.ToList();
    }

    public bool commitInsert(DateTime _EntryDate, string _AppAvail)
    {
        submClassDataContext objcal = new submClassDataContext();
        using (objcal)
        {
            Entry objNewEnt = new Entry();
            objNewEnt.EntryDate = _EntryDate;
            objNewEnt.AppAvail = _AppAvail;

            objcal.Entries.InsertOnSubmit(objNewEnt);
            objcal.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(DateTime _EntryDate, string _AppAvail)
    {
        submClassDataContext objschd = new submClassDataContext();
        using (objschd)
        {
            var objUpEnt = objschd.Entries.Single(x => x.EntryDate == _EntryDate);
            objUpEnt.AppAvail = _AppAvail;
            objschd.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(DateTime _EntryDate)
    {
        submClassDataContext objcal = new submClassDataContext();
        using (objcal)
        {
            var objDelCal = objcal.Entries.Single(x => x.EntryDate == _EntryDate);
            objcal.Entries.DeleteOnSubmit(objDelCal);
            objcal.SubmitChanges();
            return true;
        }
    }
}