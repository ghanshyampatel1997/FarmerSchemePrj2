using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace FarmerSchemeSellAndBidding.Models
{
   [DataContract]
    public class AngFarmerCropSellRequest
    {
        [Key]
        public int FarmerSellID { get; set; }
        [DataMember]
        public string cropType { get; set; }
        [DataMember]
        public string cropname { get; set; }
        [DataMember]
        public string fertilizerType { get; set; }
        [DataMember]
        public Nullable<int> quantity { get; set; }
        [DataMember]
        public string SoilPHCertificate { get; set; }
    }
}