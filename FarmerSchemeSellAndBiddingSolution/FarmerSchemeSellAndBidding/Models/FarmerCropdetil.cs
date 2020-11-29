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
    using System.Runtime.Serialization;
    [DataContract]
    public partial class FarmerCropdetil
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FarmerCropdetil()
        {
            this.BiddingTables = new HashSet<BiddingTable>();
        }
        [DataMember]
        public int FarmerSellID { get; set; }
        [DataMember]
        public string cropType { get; set; }
        [DataMember]
        public Nullable<int> CropId { get; set; }
        [DataMember]
        public string fertilizerType { get; set; }
        [DataMember]
        public Nullable<int> quantity { get; set; }
        [DataMember]
        public string SoilPHCertificate { get; set; }
        [DataMember]
        public Nullable<bool> AproovedFarmersell { get; set; }
        [DataMember]
        public Nullable<int> UserID { get; set; }
        [DataMember]
        public Nullable<System.DateTime> AddedDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BiddingTable> BiddingTables { get; set; }
        public virtual Cropprice Cropprice { get; set; }
        public virtual RollType RollType { get; set; }
    }
}
