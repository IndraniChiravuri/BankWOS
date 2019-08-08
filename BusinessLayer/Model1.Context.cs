﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BusinessLayer
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class BankEntities2 : DbContext
    {
        public BankEntities2()
            : base("name=BankEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Branch> Branches { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<CustomerMedal> CustomerMedals { get; set; }
        public virtual DbSet<Login> Logins { get; set; }
        public virtual DbSet<Manager> Managers { get; set; }
        public virtual DbSet<Transaction> Transactions { get; set; }
    
        public virtual int addCustomer(string custName, string gender, string dob, string address, string state, string city, string pincode, string phoneNo, string email, string createdDate, string editedDate, string userId, string branchId, Nullable<int> managerId)
        {
            var custNameParameter = custName != null ?
                new ObjectParameter("custName", custName) :
                new ObjectParameter("custName", typeof(string));
    
            var genderParameter = gender != null ?
                new ObjectParameter("gender", gender) :
                new ObjectParameter("gender", typeof(string));
    
            var dobParameter = dob != null ?
                new ObjectParameter("dob", dob) :
                new ObjectParameter("dob", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("address", address) :
                new ObjectParameter("address", typeof(string));
    
            var stateParameter = state != null ?
                new ObjectParameter("state", state) :
                new ObjectParameter("state", typeof(string));
    
            var cityParameter = city != null ?
                new ObjectParameter("city", city) :
                new ObjectParameter("city", typeof(string));
    
            var pincodeParameter = pincode != null ?
                new ObjectParameter("pincode", pincode) :
                new ObjectParameter("pincode", typeof(string));
    
            var phoneNoParameter = phoneNo != null ?
                new ObjectParameter("phoneNo", phoneNo) :
                new ObjectParameter("phoneNo", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            var createdDateParameter = createdDate != null ?
                new ObjectParameter("createdDate", createdDate) :
                new ObjectParameter("createdDate", typeof(string));
    
            var editedDateParameter = editedDate != null ?
                new ObjectParameter("editedDate", editedDate) :
                new ObjectParameter("editedDate", typeof(string));
    
            var userIdParameter = userId != null ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(string));
    
            var branchIdParameter = branchId != null ?
                new ObjectParameter("branchId", branchId) :
                new ObjectParameter("branchId", typeof(string));
    
            var managerIdParameter = managerId.HasValue ?
                new ObjectParameter("managerId", managerId) :
                new ObjectParameter("managerId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("addCustomer", custNameParameter, genderParameter, dobParameter, addressParameter, stateParameter, cityParameter, pincodeParameter, phoneNoParameter, emailParameter, createdDateParameter, editedDateParameter, userIdParameter, branchIdParameter, managerIdParameter);
        }
    
        public virtual int addDetails(Nullable<int> customerId, string accounttype, string dateOfOpen, string status, string dateOfEdited, string closingDate, Nullable<int> amount, string type)
        {
            var customerIdParameter = customerId.HasValue ?
                new ObjectParameter("customerId", customerId) :
                new ObjectParameter("customerId", typeof(int));
    
            var accounttypeParameter = accounttype != null ?
                new ObjectParameter("accounttype", accounttype) :
                new ObjectParameter("accounttype", typeof(string));
    
            var dateOfOpenParameter = dateOfOpen != null ?
                new ObjectParameter("DateOfOpen", dateOfOpen) :
                new ObjectParameter("DateOfOpen", typeof(string));
    
            var statusParameter = status != null ?
                new ObjectParameter("status", status) :
                new ObjectParameter("status", typeof(string));
    
            var dateOfEditedParameter = dateOfEdited != null ?
                new ObjectParameter("dateOfEdited", dateOfEdited) :
                new ObjectParameter("dateOfEdited", typeof(string));
    
            var closingDateParameter = closingDate != null ?
                new ObjectParameter("ClosingDate", closingDate) :
                new ObjectParameter("ClosingDate", typeof(string));
    
            var amountParameter = amount.HasValue ?
                new ObjectParameter("amount", amount) :
                new ObjectParameter("amount", typeof(int));
    
            var typeParameter = type != null ?
                new ObjectParameter("type", type) :
                new ObjectParameter("type", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("addDetails", customerIdParameter, accounttypeParameter, dateOfOpenParameter, statusParameter, dateOfEditedParameter, closingDateParameter, amountParameter, typeParameter);
        }
    
        public virtual int addLogin(string userId, string password, string role)
        {
            var userIdParameter = userId != null ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("password", password) :
                new ObjectParameter("password", typeof(string));
    
            var roleParameter = role != null ?
                new ObjectParameter("role", role) :
                new ObjectParameter("role", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("addLogin", userIdParameter, passwordParameter, roleParameter);
        }
    
        public virtual int addManager(string managerName, string branchId, string address, string phoneNo, string email)
        {
            var managerNameParameter = managerName != null ?
                new ObjectParameter("managerName", managerName) :
                new ObjectParameter("managerName", typeof(string));
    
            var branchIdParameter = branchId != null ?
                new ObjectParameter("branchId", branchId) :
                new ObjectParameter("branchId", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("address", address) :
                new ObjectParameter("address", typeof(string));
    
            var phoneNoParameter = phoneNo != null ?
                new ObjectParameter("phoneNo", phoneNo) :
                new ObjectParameter("phoneNo", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("addManager", managerNameParameter, branchIdParameter, addressParameter, phoneNoParameter, emailParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> balanceEnq(Nullable<long> acc)
        {
            var accParameter = acc.HasValue ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("balanceEnq", accParameter);
        }
    
        public virtual int changeMedal(Nullable<int> amt, Nullable<long> acc)
        {
            var amtParameter = amt.HasValue ?
                new ObjectParameter("amt", amt) :
                new ObjectParameter("amt", typeof(int));
    
            var accParameter = acc.HasValue ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("changeMedal", amtParameter, accParameter);
        }
    
        public virtual ObjectResult<string> changePass(string uid)
        {
            var uidParameter = uid != null ?
                new ObjectParameter("uid", uid) :
                new ObjectParameter("uid", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("changePass", uidParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> checkAcc(Nullable<long> acc)
        {
            var accParameter = acc.HasValue ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("checkAcc", accParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> checkAmo(Nullable<long> acc)
        {
            var accParameter = acc.HasValue ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("checkAmo", accParameter);
        }
    
        public virtual ObjectResult<checkCre_Result> checkCre(string uid)
        {
            var uidParameter = uid != null ?
                new ObjectParameter("uid", uid) :
                new ObjectParameter("uid", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<checkCre_Result>("checkCre", uidParameter);
        }
    
        public virtual ObjectResult<string> checkCust(Nullable<int> customerID)
        {
            var customerIDParameter = customerID.HasValue ?
                new ObjectParameter("customerID", customerID) :
                new ObjectParameter("customerID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("checkCust", customerIDParameter);
        }
    
        public virtual ObjectResult<string> checkMedal(Nullable<int> amt)
        {
            var amtParameter = amt.HasValue ?
                new ObjectParameter("amt", amt) :
                new ObjectParameter("amt", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("checkMedal", amtParameter);
        }
    
        public virtual ObjectResult<datecheck_Result> datecheck(Nullable<long> acc, string start, string end)
        {
            var accParameter = acc.HasValue ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(long));
    
            var startParameter = start != null ?
                new ObjectParameter("start", start) :
                new ObjectParameter("start", typeof(string));
    
            var endParameter = end != null ?
                new ObjectParameter("end", end) :
                new ObjectParameter("end", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<datecheck_Result>("datecheck", accParameter, startParameter, endParameter);
        }
    
        public virtual int deleteCustomer(Nullable<int> custId)
        {
            var custIdParameter = custId.HasValue ?
                new ObjectParameter("custId", custId) :
                new ObjectParameter("custId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("deleteCustomer", custIdParameter);
        }
    
        public virtual int deleteDetails(Nullable<int> accountNo)
        {
            var accountNoParameter = accountNo.HasValue ?
                new ObjectParameter("accountNo", accountNo) :
                new ObjectParameter("accountNo", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("deleteDetails", accountNoParameter);
        }
    
        public virtual int deleteManager(string managerId)
        {
            var managerIdParameter = managerId != null ?
                new ObjectParameter("managerId", managerId) :
                new ObjectParameter("managerId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("deleteManager", managerIdParameter);
        }
    
        public virtual int deposit(Nullable<long> acc, Nullable<int> amt)
        {
            var accParameter = acc.HasValue ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(long));
    
            var amtParameter = amt.HasValue ?
                new ObjectParameter("amt", amt) :
                new ObjectParameter("amt", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("deposit", accParameter, amtParameter);
        }
    
        public virtual int editedDetails(Nullable<long> accountNo, string accounttype, string type, string status, string dateOfEdited, string closingDate, Nullable<int> amount)
        {
            var accountNoParameter = accountNo.HasValue ?
                new ObjectParameter("accountNo", accountNo) :
                new ObjectParameter("accountNo", typeof(long));
    
            var accounttypeParameter = accounttype != null ?
                new ObjectParameter("accounttype", accounttype) :
                new ObjectParameter("accounttype", typeof(string));
    
            var typeParameter = type != null ?
                new ObjectParameter("type", type) :
                new ObjectParameter("type", typeof(string));
    
            var statusParameter = status != null ?
                new ObjectParameter("status", status) :
                new ObjectParameter("status", typeof(string));
    
            var dateOfEditedParameter = dateOfEdited != null ?
                new ObjectParameter("dateOfEdited", dateOfEdited) :
                new ObjectParameter("dateOfEdited", typeof(string));
    
            var closingDateParameter = closingDate != null ?
                new ObjectParameter("ClosingDate", closingDate) :
                new ObjectParameter("ClosingDate", typeof(string));
    
            var amountParameter = amount.HasValue ?
                new ObjectParameter("amount", amount) :
                new ObjectParameter("amount", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("editedDetails", accountNoParameter, accounttypeParameter, typeParameter, statusParameter, dateOfEditedParameter, closingDateParameter, amountParameter);
        }
    
        public virtual int editManager(Nullable<int> managerId, string managerName, string address, string phoneNo, string emailId, string branchId)
        {
            var managerIdParameter = managerId.HasValue ?
                new ObjectParameter("managerId", managerId) :
                new ObjectParameter("managerId", typeof(int));
    
            var managerNameParameter = managerName != null ?
                new ObjectParameter("managerName", managerName) :
                new ObjectParameter("managerName", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("address", address) :
                new ObjectParameter("address", typeof(string));
    
            var phoneNoParameter = phoneNo != null ?
                new ObjectParameter("phoneNo", phoneNo) :
                new ObjectParameter("phoneNo", typeof(string));
    
            var emailIdParameter = emailId != null ?
                new ObjectParameter("emailId", emailId) :
                new ObjectParameter("emailId", typeof(string));
    
            var branchIdParameter = branchId != null ?
                new ObjectParameter("branchId", branchId) :
                new ObjectParameter("branchId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("editManager", managerIdParameter, managerNameParameter, addressParameter, phoneNoParameter, emailIdParameter, branchIdParameter);
        }
    
        public virtual ObjectResult<getAllCustomers_Result> getAllCustomers()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<getAllCustomers_Result>("getAllCustomers");
        }
    
        public virtual ObjectResult<string> getBranch(string userId)
        {
            var userIdParameter = userId != null ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("getBranch", userIdParameter);
        }
    
        public virtual ObjectResult<string> getCustomerName(string uid)
        {
            var uidParameter = uid != null ?
                new ObjectParameter("uid", uid) :
                new ObjectParameter("uid", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("getCustomerName", uidParameter);
        }
    
        public virtual ObjectResult<string> getMedal(Nullable<long> acc)
        {
            var accParameter = acc.HasValue ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("getMedal", accParameter);
        }
    
        public virtual ObjectResult<getSpecificCustomer_Result> getSpecificCustomer(Nullable<int> custId)
        {
            var custIdParameter = custId.HasValue ?
                new ObjectParameter("custId", custId) :
                new ObjectParameter("custId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<getSpecificCustomer_Result>("getSpecificCustomer", custIdParameter);
        }
    
        public virtual int insTrans(Nullable<long> acc1, Nullable<long> acc2, Nullable<int> amt, string type, string comment, string date)
        {
            var acc1Parameter = acc1.HasValue ?
                new ObjectParameter("acc1", acc1) :
                new ObjectParameter("acc1", typeof(long));
    
            var acc2Parameter = acc2.HasValue ?
                new ObjectParameter("acc2", acc2) :
                new ObjectParameter("acc2", typeof(long));
    
            var amtParameter = amt.HasValue ?
                new ObjectParameter("amt", amt) :
                new ObjectParameter("amt", typeof(int));
    
            var typeParameter = type != null ?
                new ObjectParameter("type", type) :
                new ObjectParameter("type", typeof(string));
    
            var commentParameter = comment != null ?
                new ObjectParameter("comment", comment) :
                new ObjectParameter("comment", typeof(string));
    
            var dateParameter = date != null ?
                new ObjectParameter("Date", date) :
                new ObjectParameter("Date", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("insTrans", acc1Parameter, acc2Parameter, amtParameter, typeParameter, commentParameter, dateParameter);
        }
    
        public virtual ObjectResult<ministategen_Result> ministategen(Nullable<long> acc)
        {
            var accParameter = acc.HasValue ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ministategen_Result>("ministategen", accParameter);
        }
    
        public virtual ObjectResult<prints_Result> prints(string id)
        {
            var idParameter = id != null ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<prints_Result>("prints", idParameter);
        }
    
        public virtual int transferAdd(Nullable<int> amt, string acc)
        {
            var amtParameter = amt.HasValue ?
                new ObjectParameter("amt", amt) :
                new ObjectParameter("amt", typeof(int));
    
            var accParameter = acc != null ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("transferAdd", amtParameter, accParameter);
        }
    
        public virtual int transferSub(Nullable<int> amt, string acc)
        {
            var amtParameter = amt.HasValue ?
                new ObjectParameter("amt", amt) :
                new ObjectParameter("amt", typeof(int));
    
            var accParameter = acc != null ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("transferSub", amtParameter, accParameter);
        }
    
        public virtual int updateCustomer(Nullable<int> custId, string custName, string gender, string dob, string address, string state, string city, string pincode, string phoneNo, string editedDate)
        {
            var custIdParameter = custId.HasValue ?
                new ObjectParameter("custId", custId) :
                new ObjectParameter("custId", typeof(int));
    
            var custNameParameter = custName != null ?
                new ObjectParameter("custName", custName) :
                new ObjectParameter("custName", typeof(string));
    
            var genderParameter = gender != null ?
                new ObjectParameter("gender", gender) :
                new ObjectParameter("gender", typeof(string));
    
            var dobParameter = dob != null ?
                new ObjectParameter("dob", dob) :
                new ObjectParameter("dob", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("address", address) :
                new ObjectParameter("address", typeof(string));
    
            var stateParameter = state != null ?
                new ObjectParameter("state", state) :
                new ObjectParameter("state", typeof(string));
    
            var cityParameter = city != null ?
                new ObjectParameter("city", city) :
                new ObjectParameter("city", typeof(string));
    
            var pincodeParameter = pincode != null ?
                new ObjectParameter("pincode", pincode) :
                new ObjectParameter("pincode", typeof(string));
    
            var phoneNoParameter = phoneNo != null ?
                new ObjectParameter("phoneNo", phoneNo) :
                new ObjectParameter("phoneNo", typeof(string));
    
            var editedDateParameter = editedDate != null ?
                new ObjectParameter("editedDate", editedDate) :
                new ObjectParameter("editedDate", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("updateCustomer", custIdParameter, custNameParameter, genderParameter, dobParameter, addressParameter, stateParameter, cityParameter, pincodeParameter, phoneNoParameter, editedDateParameter);
        }
    
        public virtual int updatePass(string uid, string pass)
        {
            var uidParameter = uid != null ?
                new ObjectParameter("uid", uid) :
                new ObjectParameter("uid", typeof(string));
    
            var passParameter = pass != null ?
                new ObjectParameter("pass", pass) :
                new ObjectParameter("pass", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("updatePass", uidParameter, passParameter);
        }
    
        public virtual int updateUserID(string newuserId, string olduserId)
        {
            var newuserIdParameter = newuserId != null ?
                new ObjectParameter("newuserId", newuserId) :
                new ObjectParameter("newuserId", typeof(string));
    
            var olduserIdParameter = olduserId != null ?
                new ObjectParameter("olduserId", olduserId) :
                new ObjectParameter("olduserId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("updateUserID", newuserIdParameter, olduserIdParameter);
        }
    
        public virtual int withdraw(Nullable<long> acc, Nullable<int> amt)
        {
            var accParameter = acc.HasValue ?
                new ObjectParameter("acc", acc) :
                new ObjectParameter("acc", typeof(long));
    
            var amtParameter = amt.HasValue ?
                new ObjectParameter("amt", amt) :
                new ObjectParameter("amt", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("withdraw", accParameter, amtParameter);
        }
    }
}
