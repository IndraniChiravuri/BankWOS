//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Login
    {
        public Login()
        {
            this.Customers = new HashSet<Customer>();
        }
    
        public string userId { get; set; }
        public string password { get; set; }
        public string role { get; set; }
    
        public virtual ICollection<Customer> Customers { get; set; }
    }
}