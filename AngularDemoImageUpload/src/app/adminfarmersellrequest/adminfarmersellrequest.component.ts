import { Component, OnInit } from '@angular/core';
import { Farmersellrequestapproval } from 'src/Services/AdminFarmersellrequest.service';

@Component({
  selector: 'app-adminfarmersellrequest',
  templateUrl: './adminfarmersellrequest.component.html',
  styleUrls: ['./adminfarmersellrequest.component.css']
})
export class AdminfarmersellrequestComponent implements OnInit {
  Adminfarmersellrequestapprove;
  // FarmerSellrequest;
   ViewDetails;
  constructor(private FSRequest:Farmersellrequestapproval) { }

  ngOnInit(): void {
    // this.FarmerSelldataresult=true;
    this.Adminfarmersellrequestapprove=true;
    this.ViewDetails=false;
   this.Farmersellapprovalgetdata();
  }
  FarmerSelldataresult;
 
   Farmersellapprovalgetdata(){
    this.FSRequest.Getfarmersellrequestdata().subscribe((data)=>
    {this.FarmerSelldataresult=data;console.log(data);console.table(data);});
    
  }
  cropType;
  cropname;
  MSP;
  fertilizerType;
  quantity;
  SoilPHCertificate;
  fullname;
  FarmerSellID;
  ApprovedStatus;
  
  Viewdata(f) 
  {
    debugger;
    this.Adminfarmersellrequestapprove=false;
    this.ViewDetails=true;
    this.fullname=f.fullname;
    this.FarmerSellID=f.FarmerSellID;
    this.cropType=f.cropType;
    this.cropname=f.cropname;
    this.MSP=f.MSP;
    this.fertilizerType=f.fertilizerType;
    this.quantity=f.quantity;
    this.SoilPHCertificate=f.SoilPHCertificate;
    this.ApprovedStatus=f.AproovedFarmersell;
  } 
  GoBack()
  {
    this.ViewDetails=false;
    this.Adminfarmersellrequestapprove=true;
  }
  ApproveSellRequest()
  {
  
   this.FSRequest.Approvefarmerselldata(this.FarmerSellID).subscribe((data)=>
   {
     window.alert(data);
     this.GoBack();
     this.Farmersellapprovalgetdata();

   },
   (error)=>{window.alert(error.error.Message);})
  }


}
