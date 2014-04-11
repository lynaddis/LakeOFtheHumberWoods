using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class newsClass
{
    public IQueryable<New> getNews()
    {
        // creating an instance of our linq object
      HospitalDataContext objNews = new HospitalDataContext();

        //creating an anonymous variable with its value being the instance of our linq object

        var allNews = objNews.News.Select(x => x);

        //var allProducts = from x in objProd.products select x;
        return allNews;
    }

    public IQueryable<string> getNewsType() 
    {
       HospitalDataContext objNews = new HospitalDataContext(); // new instance of class


       var allNews = objNews.News.Select(x => x.Department).Distinct();

       return allNews;
        
       // return allNews; // selecting products from the database by their ID
    }

    public IQueryable<New> getNewsByID(int _id)
    {
       HospitalDataContext objNews = new HospitalDataContext(); // new instance of class

        var allNews = objNews.News.Where(x => x.Id == _id).Select(x => x);

        return allNews; // selecting products from the database by their ID
    }


    public IQueryable<New> getNewsByDepartment(string _depart)
    {
       HospitalDataContext objNews = new HospitalDataContext(); // new instance of class

        var allNews = objNews.News.Where(x => x.Department == _depart).Select(x => x);

        return allNews; // selecting products from the database by their ID
    }

    public bool commitInsert(string _Dep, string _Details, string _Url, string _Date) //allows insert using boolean and string to validate 
    {
       HospitalDataContext objNews = new HospitalDataContext();
        using (objNews)
        {
            New objNewNews = new New();
            objNewNews.Department = _Dep;
            objNewNews.Details = _Details;
            objNewNews.Url= _Url;
            objNewNews.Date = _Date;
            objNews.News.InsertOnSubmit(objNewNews);
            objNews.SubmitChanges();
            return true;
        }

    }

    public bool commitUpdate(int _id, string _Dep, string _Details, string _Url, string _Date) //allows update
    {
       HospitalDataContext objNews = new HospitalDataContext();
        using (objNews)
        {
            var objUpNews = objNews.News.Single(x => x.Id == _id);

            New objNewNews = new New();
            objNewNews.Department = _Dep;
            objNewNews.Details = _Details;
            objNewNews.Url = _Url;
            objNewNews.Date = _Date;
            objNews.News.InsertOnSubmit(objNewNews);
            objNews.SubmitChanges();
            return true;
        }

    }


    public bool commmitDelete(int _id) //allows delete
    {
       HospitalDataContext objNews = new HospitalDataContext();
        using (objNews)
        {
            var objDelNews = objNews.News.Single(x => x.Id == _id);
            objNews.News.DeleteOnSubmit(objDelNews);
            objNews.SubmitChanges();
            return true;
        }

    }


}
