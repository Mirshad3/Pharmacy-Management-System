﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace pharm.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class pharmEntities : DbContext
    {
        public pharmEntities()
            : base("name=pharmEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Batch> Batches { get; set; }
        public virtual DbSet<Bill_Information> Bill_Information { get; set; }
        public virtual DbSet<Drug_Generic_name> Drug_Generic_name { get; set; }
        public virtual DbSet<Manufacturer> Manufacturers { get; set; }
        public virtual DbSet<Medicine_Information> Medicine_Information { get; set; }
        public virtual DbSet<Purchase> Purchases { get; set; }
        public virtual DbSet<Sale> Sales { get; set; }
        public virtual DbSet<Supplier> Suppliers { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<User_Access> User_Access { get; set; }
        public virtual DbSet<User_Information> User_Information { get; set; }
        public virtual DbSet<Expense_Information> Expense_Information { get; set; }
        public virtual DbSet<Expens> Expenses { get; set; }
        public virtual DbSet<Event> Events { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Unit> Units { get; set; }
    }
}
