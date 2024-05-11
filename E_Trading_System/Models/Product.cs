//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace E_Trading_System.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.BucketLists = new HashSet<BucketList>();
        }
    
        public decimal Product_Id { get; set; }
        public Nullable<decimal> Vendor_Id { get; set; }
        public string Product_Name { get; set; }
        public string Brand { get; set; }
        public Nullable<int> Stock { get; set; }
        public Nullable<double> Price { get; set; }
        public string Status { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BucketList> BucketLists { get; set; }
        public virtual Vendor Vendor { get; set; }
    }
}