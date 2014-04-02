using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class linqClass
{
    public IQueryable<suggestion> getSuggestion()
    {
        // creating an instance of our linq object
        suggestionDataContext objSug = new suggestionDataContext();

        //creating an anonymous variable with its value being the instance of our linq object

        var allSuggestions = objSug.suggestions.Select(x => x);

        //var allProducts = from x in objProd.products select x;
        return allSuggestions;
    }


    public IQueryable<suggestion> getSuggestionByID(int _id)
    {
        suggestionDataContext objSug = new suggestionDataContext(); // new instance of class

        var allSuggestions = objSug.suggestions.Where(x => x.Id == _id).Select(x => x);

        return allSuggestions; // selecting products from the database by their ID
    }

    public bool commitInsert(string _type, string _first, string _last,string _phone, string _hours, string _email, string _comment ) //allows insert using boolean and string to validate 
    {
        suggestionDataContext objSug = new suggestionDataContext();
        using (objSug)
        {
           suggestion objNewSug = new suggestion();
            objNewSug.suggestionType = _type;
            objNewSug.first = _first;
            objNewSug.last = _last;
            objNewSug.phone = _phone;
            objNewSug.hours = _hours;
            objNewSug.email = _email;
            objNewSug.comment = _comment;
            objSug.suggestions.InsertOnSubmit(objNewSug);
            objSug.SubmitChanges();
            return true;
        }

    }

  

    }
