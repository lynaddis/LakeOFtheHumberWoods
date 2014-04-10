using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for paypalTransactionClass
/// </summary>
public class paypalTransactionClass
{
    public List<Paypal_transaction> getTransactions()
    {
        HospitalDataContext objTransactions = new HospitalDataContext();
        var allTransactions = objTransactions.Paypal_transactions.Select(x => x);
        return allTransactions.ToList();
    }

    public bool commitInsert(int i_id, int u_id, string ppa, string date)
    {
        HospitalDataContext objTransactions = new HospitalDataContext();
        using (objTransactions)
        {
            Paypal_transaction newTransaction = new Paypal_transaction();
            newTransaction.invoice_id = i_id;
            newTransaction.user_id = u_id;
            newTransaction.paypal_account = ppa;
            newTransaction.transaction_date = date;
            objTransactions.Paypal_transactions.InsertOnSubmit(newTransaction);
            objTransactions.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int id, int i_id, int u_id, string ppa, string date)
    {
        HospitalDataContext objTransactions = new HospitalDataContext();
        using (objTransactions)
        {
            var objUpdate = objTransactions.Paypal_transactions.Single(x => x.Id == id);
            objUpdate.invoice_id = i_id;
            objUpdate.user_id = u_id;
            objUpdate.paypal_account = ppa;
            objUpdate.transaction_date = date;
            objTransactions.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int id)
    {
         HospitalDataContext objTransactions = new HospitalDataContext();
         using (objTransactions)
         {
             var DeleteTransaction = objTransactions.Paypal_transactions.Single(x => x.Id == id);
             objTransactions.Paypal_transactions.DeleteOnSubmit(DeleteTransaction);
             objTransactions.SubmitChanges();
             return true;
         }
    }
}