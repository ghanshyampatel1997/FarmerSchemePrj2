//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FarmerSchemeSellAndBidding.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cropprice
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cropprice()
        {
            this.FarmerCropdetils = new HashSet<FarmerCropdetil>();
        }
    
        public int CropId { get; set; }
        public string cropname { get; set; }
        public Nullable<int> MSP { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FarmerCropdetil> FarmerCropdetils { get; set; }
    }
}
