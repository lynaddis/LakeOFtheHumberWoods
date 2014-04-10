using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class recomendClass
{
    public IQueryable<recommendation> getRecommendations()
    {
        HospitalDataContext objRec = new HospitalDataContext();

        var allRecommendations = objRec.recommendations.Select(x => x); /*x just represents your columns*/
        /*var allSubmissions = from x in objSub.submissions select x; */

        return allRecommendations;
    }

    public IQueryable<recommendation> getallRecommendationsByID(int _Id)
    {
        HospitalDataContext objRec = new HospitalDataContext();
        var allRecommendations = objRec.recommendations.Where(x => x.Id == _Id).Select(x => x);
        return allRecommendations;
    }

    public bool commitInsert(string _name, string _ill_name, string _region, string _recomend) /* if it works it comes back as 1, if it doesn't it comes back at 0.  Just another method on how to do this.*/
    {
        HospitalDataContext objRec = new HospitalDataContext();
        using (objRec)
        {
            recommendation objNewRec = new recommendation(); /*referencing designer.cs file */
            objNewRec.name = _name;
            objNewRec.ill_name = _ill_name;
            objNewRec.region = _region;
            objNewRec.recomend = _recomend;

            objRec.recommendations.InsertOnSubmit(objNewRec);  /*on submit does one row at a time, all submit submits all rows. and passes new parameter of objNewProd*/
            objRec.SubmitChanges();/*this commits change to database*/
            return true;
        }
    }
    public bool commitDelete(int _Id)
    {
        HospitalDataContext objRec = new HospitalDataContext();
        using (objRec)
        {
            var objDelRec = objRec.recommendations.Single(x => x.Id == _Id);
            objRec.recommendations.DeleteOnSubmit(objDelRec);
            objRec.SubmitChanges();
            return true;
        }
    }

}