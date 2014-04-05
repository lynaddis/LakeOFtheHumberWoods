﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ContactClass
/// </summary>
public class ContactClass
{
    // To submit the user message with details in database
   public bool commitInsert(string _fname, string _lname, ulong _tel, string _email, string _subject, string _message)
    {
        HospitalDataContext objContact = new HospitalDataContext();

        using (objContact)
        {
            contactus ObjNewContact = new contactus();
            ObjNewContact.firstname = _fname;           
            ObjNewContact.lastname = _lname;
            ObjNewContact.telephone = _tel;
            ObjNewContact.email = _email;
            ObjNewContact.subject = _subject;
            ObjNewContact.message = _message;
            objContact.contactus.InsertOnSubmit(ObjNewContact);
            objContact.SubmitChanges();
            return true;
        }
    }
}