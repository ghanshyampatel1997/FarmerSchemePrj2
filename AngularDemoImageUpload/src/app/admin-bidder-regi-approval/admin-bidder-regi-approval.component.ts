import { Component, OnInit } from '@angular/core';
import { AdminBidderregisterApprovalservice } from 'src/Services/AdminBidderRegiApproval.Service';

@Component({
  selector: 'app-admin-bidder-regi-approval',
  templateUrl: './admin-bidder-regi-approval.component.html',
  styleUrls: ['./admin-bidder-regi-approval.component.css']
})
export class AdminBidderRegiApprovalComponent implements OnInit {
  Bidderregister;
  Bidderregi;
  ViewDetails;
  

  constructor(private ABregiservice:AdminBidderregisterApprovalservice) { }

  ngOnInit(): void {
    this.Bidderregister=true;
    this.Bidderregi=false;
    this.ViewDetails=false;
  }
  Bidderregisterdataresult;
  br;
  Bidderregiapproval(){
    this.Bidderregister=false;
    this.Bidderregi=true;
    this.ABregiservice.Getbidderregisterdata().subscribe((data)=>
    {this.Bidderregisterdataresult=data;console.log(data);console.table(data);
      this.br=this.Bidderregisterdataresult;console.log(this.br);},
      (error)=>{window.alert(error.error.Message)}
      );
    }
   UserEmailId;
   ContactNo_;
   address1;
   address2;
   city;
   state;
   pincode;
   aadharCardDocument;
   pancardDocument;
   certificate;
   IFSCCode;
   BankAccountNo;
   userid;
   ApprovedStatus;
   Viewdata(b)
   {
     debugger;
     this.Bidderregi=false;
     this.ViewDetails=true;
     this.UserEmailId=b.UserEmailId;
     this.ContactNo_=b.ContactNo_;
     this.address1=b.address1;
     this.address2=b.address2;
     this.city=b.city;
     this.state=b.state;
     this.pincode=b.pincode;
     this.pancardDocument=b.pancardDocument;
     //this.aadharCardDocument="/assets/img/FarmerSchemeDB2Diagram.PNG";
     this.aadharCardDocument=b.aadharCardDocument;
     this.certificate=b.certificate;;
     this.IFSCCode=b.IFSCCode;
     this.BankAccountNo=b.BankAccountNo;
     this.userid=b.UserID;
     this.ApprovedStatus=b.ApprovedStatus;
   }
   GoBack()
  {
    this.ViewDetails=false;
    this.Bidderregi=true;
  }
  GoBackAgain()
  {
    this.Bidderregister=true;
    this.Bidderregi=false;
  }
  Approveddata()
  {
    debugger;
    this.ABregiservice.Approvebidderregisterdata(this.userid).subscribe((data)=>
    {
      window.alert(data);
      this.GoBack();
      this.Bidderregiapproval();
    },
    (error)=>
    {
      window.alert(error.error.Message);
    });

  }

}
