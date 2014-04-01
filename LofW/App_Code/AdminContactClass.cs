using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminContactClass
/// </summary>
public class AdminContactClass
{
    public List<contactus> getMessages()
    {
        contactusClassesDataContext objContact = new contactusClassesDataContext();
        var allMessages = objContact.contactus.Select(x => x);
        return allMessages.ToList();
    }

    public List<contactus> getMessagesByID(int _id)
    {
        contactusClassesDataContext objContact = new contactusClassesDataContext();
        var allMessages = objContact.contactus.Where(x => x.Id == _id).Select(x => x);
        return allMessages.ToList();
    }

    public bool updateMessage(int _id, string _message)
    {
        contactusClassesDataContext objContact = new contactusClassesDataContext();
        var singleRow = (from p in objContact.contactus
                         where p.Id == _id
                         select p).Single();
        singleRow.subject = _message;

        objContact.SubmitChanges();
        return true;
    }
    public bool commitUpdate(int _id, string _fname, string _lname, int _tel, string _email, string _subject, string _message)
    {
        contactusClassesDataContext objContact = new contactusClassesDataContext();
        using (objContact)
        {
           var upMsg = objContact.contactus.Single(x => x.Id == _id);
           upMsg.firstname = _fname;
           upMsg.lastname = _lname;
           upMsg.telephone = _tel;
           upMsg.email = _email;
           upMsg.subject = _subject;
           upMsg.message = _message;

           objContact.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)
    {
        contactusClassesDataContext objContact = new contactusClassesDataContext();
        using (objContact)
        {
            var objDelMsg = objContact.contactus.Single(x => x.Id == _id);
            objContact.contactus.DeleteOnSubmit(objDelMsg);
            objContact.SubmitChanges();
            return true;
        }
    }
}
