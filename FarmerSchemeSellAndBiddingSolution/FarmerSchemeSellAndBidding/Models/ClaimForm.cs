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
    public partial class ClaimForm
    {
        [DataMember]
        public Nullable<int> PolicyNo { get; set; }
        [DataMember]
        public long ClaimNo { get; set; }
        [DataMember]
        public Nullable<System.DateTime> dateOfLoss { get; set; }
        [DataMember]
        public string CauseOfLoss { get; set; }
        [DataMember]
        public Nullable<bool> ClaimApprove { get; set; }
    
        public virtual InsuranceApplication InsuranceApplication { get; set; }
    }
}
