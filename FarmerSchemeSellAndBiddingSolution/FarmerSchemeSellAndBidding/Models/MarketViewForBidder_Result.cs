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
    using System.Runtime.Serialization;
    [DataContract]
    public partial class MarketViewForBidder_Result
    {
        [DataMember]
        public Nullable<int> FarmerSellID { get; set; }
        [DataMember]
        public string cropType { get; set; }
        [DataMember]
        public string cropname { get; set; }
        [DataMember]
        public Nullable<int> MSP { get; set; }
        [DataMember]
        public Nullable<int> bidAmount { get; set; }
    }
}
