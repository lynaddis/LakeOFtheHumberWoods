using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class labClass
{
	


    public IQueryable<lab> getLabs()
    {
        // creating an instance of our linq object
        HospitalDataContext objLAB = new HospitalDataContext();

        //creating an anonymous variable with its value being the instance of our linq object

        var allLabs = objLAB.labs.Select(x => x);

        //var allProducts = from x in objProd.products select x;
        return allLabs;
    }


    public int getPatientCodeByUsername(string user)
    {
        HospitalDataContext objLab = new HospitalDataContext();
        return objLab.labs.Where(x => x.patientCode == user).Select(x => x.Id).FirstOrDefault();

    }


    public IQueryable<lab> getLabsByID(int _id)
    {
        HospitalDataContext objLAB = new HospitalDataContext();

        var allLabs = objLAB.labs.Where(x => x.Id == _id).Select(x => x);

        return allLabs;
    }

    public bool commitInsert(string _patient, string _code,  string _age , string _sex, string _type, string _testcode, 
        string _result1, string _result2, string _desc, string _abnormal , string _refrange, string _unit, string _dob   )
    {
       HospitalDataContext objLAB = new HospitalDataContext();
        using (objLAB)
        {
            lab objNewLAB = new lab();
            objNewLAB.patientID = _patient;
            objNewLAB.patientCode = _code;
            objNewLAB.age = _age;
            objNewLAB.sex = _sex;
            objNewLAB.testType = _type;
            objNewLAB.testCode = _testcode;
            objNewLAB.resultType1 = _result1;
            objNewLAB.resultType2 = _result2;
            objNewLAB.resultdescription = _desc;
            objNewLAB.abnormal = _abnormal;
            objNewLAB.referenceRange = _refrange;
            objNewLAB.units = _unit;
            objNewLAB.DateofBirth = _dob;
            objLAB.labs.InsertOnSubmit(objNewLAB);
            objLAB.SubmitChanges();
            return true;

        }

    }

    public bool commitUpdate(int _id, string _patient, string _code,string _unit, string _age, string _sex, string _type, string _testcode,
        string _result1, string _result2, string _desc, string _abnormal, string _refrange, string _dob)
    {
 HospitalDataContext objLAB = new HospitalDataContext();
        using (objLAB)
        {
            var objUPLAB = objLAB.labs.Single(x => x.Id == _id);

            objUPLAB.patientID = _patient;
            objUPLAB.patientCode = _code;
            objUPLAB.age = _age;
            objUPLAB.sex = _sex;
            objUPLAB.testType = _type;
            objUPLAB.testCode = _testcode;
            objUPLAB.resultType1 = _result1;
            objUPLAB.resultType2 = _result2;
            objUPLAB.resultdescription = _desc;
            objUPLAB.abnormal = _abnormal;
            objUPLAB.referenceRange = _refrange;
            objUPLAB.units = _unit;
            objUPLAB.DateofBirth = _dob;
            objLAB.SubmitChanges();
            return true;
        }

    }


    public bool commmitDelete(int _id)
    {
        HospitalDataContext objLAB = new HospitalDataContext();
        using (objLAB)
        {

            var objDelPro = objLAB.labs.Single(x => x.Id == _id);

            objLAB.labs.DeleteOnSubmit(objDelPro);
            objLAB.SubmitChanges();
            return true;
        }

    }
}
