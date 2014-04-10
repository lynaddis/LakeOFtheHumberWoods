using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for patientClass
/// </summary>
public class patientClass
{
    public List<Patient> getPatients()
    {
        HospitalDataContext objPatient = new HospitalDataContext();
        var allPatients = objPatient.Patients.Select(x => x);
        return allPatients.ToList();
    }

    public List<Patient> getPatientById(int id)
    {
        HospitalDataContext objPatient = new HospitalDataContext();
        var allPatient = objPatient.Patients.Where(x => x.Id == id).Select(x => x);
        return allPatient.ToList();
    }

    public int getPatientIdByUsername(string user)
    {
        HospitalDataContext objPatient = new HospitalDataContext();
        return objPatient.Patients.Where(x => x.username == user).Select(x => x.Id ).First();
       
    }

    public List<Patient> getPatientByUsername(string user)
    {
        HospitalDataContext objPatient = new HospitalDataContext();
        var allPatient = objPatient.Patients.Where(x => x.username == user).Select(x => x);
        return allPatient.ToList();
    }

    public List<Patient> getPatientByinfo(string fname, string lname, string dob)
    {
        HospitalDataContext objPatient = new HospitalDataContext();
        var allPatient = objPatient.Patients.Where(x => x.fname == fname).Where(x => x.lname == lname).Where(x => x.dob == dob).Select(x => x);
        return allPatient.ToList();
    }

    public bool commitInsert(string Fname, string Lname, string Address, string Phone, string Pc,string City, string Country, string Username, string dob)
    {
        HospitalDataContext objPatient = new HospitalDataContext();
        using (objPatient)
        {
            Patient newPatient = new Patient();
            newPatient.fname = Fname;
            newPatient.lname = Lname;
            newPatient.address = Address;
            newPatient.phone = Phone;
            newPatient.pc = Pc;
            newPatient.city = City;
            newPatient.country = Country;
            newPatient.username = Username;
            newPatient.dob = dob;
            objPatient.Patients.InsertOnSubmit(newPatient);
            objPatient.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string Fname, string Lname, string Address, string Phone, string Pc, string City, string Country, string dob, string username)
    {
        HospitalDataContext objPatient = new HospitalDataContext();
        using (objPatient)
        {
            var objUpdate = objPatient.Patients.Single(x => x.Id == _id);
            objUpdate.fname = Fname;
            objUpdate.lname = Lname;
            objUpdate.address = Address;
            objUpdate.phone = Phone;
            objUpdate.pc = Pc;
            objUpdate.city = City;
            objUpdate.country = Country;
            objUpdate.dob = dob;
            objUpdate.username = username;
            objPatient.SubmitChanges();
            return true;
        }
    }
}