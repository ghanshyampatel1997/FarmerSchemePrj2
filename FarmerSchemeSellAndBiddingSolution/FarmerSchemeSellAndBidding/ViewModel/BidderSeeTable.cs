using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace FarmerSchemeSellAndBidding.Models
{
    [DataContract]
    public class BidderSeeTable
    {
        [DataMember]
        public int FarmerSellID { get; set; }
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