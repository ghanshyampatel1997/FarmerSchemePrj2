import { Component, OnInit } from '@angular/core';
import { Claimrequestservice } from 'src/Services/AdminClaimRequest.Service';

@Component({
  selector: 'app-admin-claim-approval',
  templateUrl: './admin-claim-approval.component.html',
  styleUrls: ['./admin-claim-approval.component.css']
})
export class AdminClaimApprovalComponent implements OnInit {
  Adminclaimrequestapprove;
  ViewDetails;

  constructor(private insclaim : Claimrequestservice) { }

  ngOnInit(): void {
    this.Adminclaimrequestapprove=true;
    this.ViewDetails=false;
    this.Getfarmerinsclaimdata();
  }

  Insclaimdata;
//To display the details provided by farmer for Admin claim approval
  Getfarmerinsclaimdata(){
    this.insclaim.Getclaimrequestdata().subscribe((data)=>
    {this.Insclaimdata=data;console.log(data);console.table(data);});

  }
  season;
  year;
  cropname;
  suminsured;
  FarmId;
  ClaimNo;
  CauseOfLoss;
  dateOfLoss;
  fullname;
  city;
  ContactNo_;
  ClaimApprove;

  Viewdata(c)
  {
    this.Adminclaimrequestapprove=false;
    this.ViewDetails=true;
    this.season=c.season;
    this.year=c.year;
    this.cropname=c.cropname;
    this.suminsured=c.SumInsured;
    this.FarmId=c.FarmId;
    this.ClaimNo=c.ClaimNo;
    this.CauseOfLoss=c.CauseOfLoss;
    this.dateOfLoss=c.dateOfLoss;
    this.fullname=c.fullname;
    this.city=c.city;
    this.ContactNo_=c.ContactNo_;
    this.ClaimApprove=c.ClaimApprove;
    
  }
  GoBack()
  {
    this.ViewDetails=false;
    this.Adminclaimrequestapprove=true;
  }
  //To fetch the data after admin approval
  ApproveClaimrequest()
  {
    this.insclaim.Approveclaimdata(this.ClaimNo).subscribe((data)=>
    {
      window.alert(data);
      this.GoBack();
      this.Getfarmerinsclaimdata();
    },
    (error)=>{window.alert(error.error.Message);})
  }

}
