using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for hospitalLocationClass
/// </summary>
public class hospitalLocationClass
{
    public List<Hospital_location> getLocations()
    {
        HospitalDataContext objLocation = new HospitalDataContext();
        var allLocations = objLocation.Hospital_locations.Select(x => x);
        return allLocations.ToList();
    }

    public List<Hospital_location> getLocationById(int id)
    {
        HospitalDataContext objLocation = new HospitalDataContext();
        var allInvoice = objLocation.Hospital_locations.Where(x => x.Id == id).Select(x => x);
        return allInvoice.ToList();
    }

    public List<string> getLocs()
    {
        HospitalDataContext objLocation = new HospitalDataContext();
        var allLocations = objLocation.Hospital_locations.Select(x => x.hospital_address);
        return allLocations.ToList();
    }

    public bool commitInsert(string hName, string hAddress, string des)
    {
        HospitalDataContext objLocation = new HospitalDataContext();
        using (objLocation)
        {
            Hospital_location newLocation = new Hospital_location();
            newLocation.hospital_name = hName;
            newLocation.hospital_address = hAddress;
            newLocation.desc = des;
            objLocation.Hospital_locations.InsertOnSubmit(newLocation);
            objLocation.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int id, string hName, string hAddress, string des)
    {
         HospitalDataContext objLocation = new HospitalDataContext();
         using (objLocation)
         {
             var objUpdate = objLocation.Hospital_locations.Single(x => x.Id == id);
             objUpdate.hospital_name = hName;
             objUpdate.hospital_address = hAddress;
             objUpdate.desc = des;
             objLocation.SubmitChanges();
             return true;
         }
    }

    public bool deleteLocation(int id)
    {
        HospitalDataContext objLocation = new HospitalDataContext();
        using (objLocation)
        {
            var DeleteLocation = objLocation.Hospital_locations.Single(x => x.Id == id);
            objLocation.Hospital_locations.DeleteOnSubmit(DeleteLocation);
            objLocation.SubmitChanges();
            return true;
        }
    }
}