using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for waitTimeClass
/// </summary>
public class waitTimeClass
{
    public List<Wait_time> getTimes()
    {
        HospitalDataContext objTime = new HospitalDataContext();
        var allTimes = objTime.Wait_times.Select(x => x);
        return allTimes.ToList();
    }

    public bool commitInsert(int length, int docs, string stat, int beds)
    {
        HospitalDataContext objTime = new HospitalDataContext();
        using (objTime)
        {
            Wait_time newTime = new Wait_time();
            newTime.time = length;
            newTime.number_doctors = docs;
            newTime.status = stat;
            newTime.number_beds = beds;
            objTime.Wait_times.InsertOnSubmit(newTime);
            objTime.SubmitChanges();
            return true;
        }
    }


    public bool commitUpdate(int id, int length, int docs, string stat, int beds)
    {
        HospitalDataContext objTime = new HospitalDataContext();
        using (objTime)
        {
            var objUpdate = objTime.Wait_times.Single(x => x.Id == id);
            objUpdate.time = length;
            objUpdate.number_doctors = docs;
            objUpdate.status = stat;
            objUpdate.number_beds = beds;
            objTime.SubmitChanges();
            return true;
        }
    }

    public bool DeleteTime(int id)
    {
         HospitalDataContext objTime = new HospitalDataContext();
         using (objTime)
         {
             var DeleteTime = objTime.Wait_times.Single(x => x.Id == id);
             objTime.Wait_times.DeleteOnSubmit(DeleteTime);
             objTime.SubmitChanges();
             return true;
         }
    }

}