using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminEmployeeClass
/// </summary>
public class AdminEmployeeClass
{
    public List<employee> getAllApplicants()
    {
        HospitalDataContext dbObjEmployee = new HospitalDataContext();
        var allEmployees = dbObjEmployee.employees.Select(x => x);
        return allEmployees.ToList();
    }


    public List<employee> getApplicantsByID(int _id)
    {
        HospitalDataContext objEmployee = new HospitalDataContext();
        var allEmployees = objEmployee.employees.Where(x => x.Id == _id).Select(x => x);
        return allEmployees.ToList();
    }

    public bool commitDelete(int _id)
    {
        HospitalDataContext objApplicant = new HospitalDataContext();
        using (objApplicant)
        {
            var objDelApp = objApplicant.employees.Single(x => x.Id == _id);
            objApplicant.employees.DeleteOnSubmit(objDelApp);
            objApplicant.SubmitChanges();
            return true;
        }
    }

}