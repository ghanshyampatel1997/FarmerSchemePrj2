import { Component, OnInit } from '@angular/core';
import { Claimservice } from 'src/Services/Claim.service';
import { Claim } from '../Models/Claim.Model';

@Component({
  selector: 'app-insurance-claim',
  templateUrl: './insurance-claim.component.html',
  styleUrls: ['./insurance-claim.component.css']
})
export class InsuranceClaimComponent implements OnInit {

  constructor(private claimservice:Claimservice) { }

  ngOnInit(): void {
  }
  //postmethod
    Claim: Claim = new Claim;
    Result;
    RetrivedData
    i:number;
    Insurancecompany;
    Suminsured;
    Nameofinsuree;
  getdata(PolicyNo)
  {
    
    this.claimservice.getInsData(PolicyNo.value).subscribe((data)=>
    {
      console.log(data);
      console.table(data);
      this.RetrivedData=data;
      this.Insurancecompany=this.RetrivedData[0];
      this.Suminsured=this.RetrivedData[1];
      this.Nameofinsuree=this.RetrivedData[2];
    },
    (error)=>{console.log(error); 
      window.alert(error.error.Message)})

  }

 AddInsuranceClaim(PolicyNo,Insurancecompany, Suminsured,Nameofinsuree,Dateofloss,Causeofloss)
 {
   debugger;
   this.Claim.PolicyNo=PolicyNo.value;
   this.Claim.Insurancecompany=Insurancecompany.value;
   this.Claim.Suminsured=Suminsured.value;
   this.Claim.Nameofinsuree=Nameofinsuree.value;
   this.Claim.Dateofloss=Dateofloss.value;
   this.Claim.Causeofloss=Causeofloss.value;
  console.log(this.Claim);
    this.claimservice.InsertClaimForm(this.Claim).subscribe((data) =>
     { this.Result = data;
    window.alert(this.Result);
  })
 }
}
