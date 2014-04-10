using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for invoiceClass
/// </summary>
public class invoiceClass
{
    public List<Invoice> getInvoices()
    {
        HospitalDataContext objInvoice = new HospitalDataContext();
        var allInvoices = objInvoice.Invoices.Select(x => x);
        return allInvoices.ToList();
    }
     
    public List<Invoice> getInvoiceById(int id)
    {
        HospitalDataContext objInvoice = new HospitalDataContext();
        var allInvoice = objInvoice.Invoices.Where(x => x.Id == id).Select(x => x);
        return allInvoice.ToList();
    }

    public List<Invoice> getInvoiceByPatientId(int p_id)
    {
        HospitalDataContext objInvoice = new HospitalDataContext();
        var allInvoice = objInvoice.Invoices.Where(x => x.patient_id == p_id).Select(x => x);
        return allInvoice.ToList();
    }

    public bool commintInsert(decimal amount, string procedure, int p_id)
    {
        HospitalDataContext objInvoice = new HospitalDataContext();
        using (objInvoice)
        {
            Invoice newInvoice = new Invoice();
            newInvoice.amount = amount;
            newInvoice.procedure = procedure;
            newInvoice.patient_id = p_id;
            objInvoice.Invoices.InsertOnSubmit(newInvoice);
            objInvoice.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int id, decimal amount, string status, string procedure, string paymentType, int p_id)
    {
        HospitalDataContext objInvoice = new HospitalDataContext();
        using (objInvoice)
        {
            var objUpdate = objInvoice.Invoices.Single(x => x.Id == id);
            objUpdate.amount = amount;
            objUpdate.status = status;
            objUpdate.procedure = procedure;
            objUpdate.payment_method = paymentType;
            objUpdate.patient_id = p_id;
            objInvoice.SubmitChanges();
            return true;
        }
    }


    public bool commitUpdatePaid(int id, string status, string paymentType)
    {
         HospitalDataContext objInvoice = new HospitalDataContext();
         using (objInvoice)
         {
             var objUpdate = objInvoice.Invoices.Single(x => x.Id == id);
             objUpdate.status = status;
             objUpdate.payment_method = paymentType;
             objInvoice.SubmitChanges();
             return true;
         }
    }
}