using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class linqClass
{
    public IQueryable<New> getNews()
    {
        // creating an instance of our linq object
       NewsDataContext objNews = new NewsDataContext();

        //creating an anonymous variable with its value being the instance of our linq object

        var allNews = objNews.News.Select(x => x);

        //var allProducts = from x in objProd.products select x;
        return allNews;
    }


    public IQueryable<New> getNewsByID(int _id)
    {
        NewsDataContext objNews = new NewsDataContext(); // new instance of class

        var allNews = objNews.News.Where(x => x.Id == _id).Select(x => x);

        return allNews; // selecting products from the database by their ID
    }

    public bool commitInsert(string _publishfirst, string _publishafter, string _Dep, string _Date) //allows insert using boolean and string to validate 
    {
        NewsDataContext objNews = new NewsDataContext();
        using (objNews)
        {
            New objNewNews = new New();
            objNewNews.PublishBefore = _publishfirst;
            objNewNews.PublishAfter = _publishafter;
            objNewNews.Department = _Dep;
            objNewNews.Date = _Date;
            objNews.News.InsertOnSubmit(objNewNews);
            objNews.SubmitChanges();
            return true;
        }

    }



}
