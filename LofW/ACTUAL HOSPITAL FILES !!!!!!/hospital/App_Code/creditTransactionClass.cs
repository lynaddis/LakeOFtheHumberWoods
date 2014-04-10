using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for creditTransactionClass
/// </summary>
public class creditTransactionClass
{
    public List<Credit_transaction> getTransactions()
    {
        HospitalDataContext objTransactions = new HospitalDataContext();
        var allTransactions = objTransactions.Credit_transactions.Select(x => x);
        return allTransactions.ToList();
    }

    public bool commitInsert(int i_id, int u_id, string num, string holder, string expire, string date)
    {
        HospitalDataContext objTransactions = new HospitalDataContext();
        using (objTransactions)
        {
            Credit_transaction newTransaction = new Credit_transaction();
            newTransaction.invoice_id = i_id;
            newTransaction.user_id = u_id;
            newTransaction.card_number = num;
            newTransaction.card_holder = holder;
            newTransaction.expire_date = expire;
            newTransaction.transaction_date = date;
            objTransactions.Credit_transactions.InsertOnSubmit(newTransaction);
            objTransactions.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int id, int i_id, int u_id, string num, string holder, string expire, string date)
    {
         HospitalDataContext objTransactions = new HospitalDataContext();
         using (objTransactions)
         {
             var objUpdate = objTransactions.Credit_transactions.Single(x => x.Id == id);
             objUpdate.invoice_id = i_id;
             objUpdate.user_id = u_id;
             objUpdate.card_number = num;
             objUpdate.card_holder = holder;
             objUpdate.expire_date = expire;
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
            var DeleteTransaction = objTransactions.Credit_transactions.Single(x => x.Id == id);
            objTransactions.Credit_transactions.DeleteOnSubmit(DeleteTransaction);
            objTransactions.SubmitChanges();
            return true;
        }
    }
}