import { Component, OnInit } from '@angular/core';
import { Farmerregisterdataservice } from 'src/Services/Farmerregi.service';

@Component({
  selector: 'app-admin-farmer-regi',
  templateUrl: './admin-farmer-regi.component.html',
  styleUrls: ['./admin-farmer-regi.component.css']
})
export class AdminFarmerRegiComponent implements OnInit {
  Farmerregister;
  Farmerregi;
  ViewDetails;
  constructor(private Fregiservice:Farmerregisterdataservice) { }

  ngOnInit(): void {
    this.Farmerregister=true;
    this.Farmerregi=false;
    this.ViewDetails=false;

  }
  
  Farmerregisterdataresult;
  pq;
  Farmerregiapproval(){
    this.Farmerregister=false;
    this.Farmerregi=true;
    this.Fregiservice.Getfarmerregisterdata().subscribe((data)=>
    {this.Farmerregisterdataresult=data;console.log(data);console.table(data);
      this.pq=this.Farmerregisterdataresult;console.log(this.pq);});
    
  }
  UserEmailId;
  ContactNo_;
  address1;
  address2;
  city;
  state;
  pincode;
  pancardDocument;
  aadharCardDocument;
  certificate;
  IFSCCode;
  BankAccountNo;
  landArea;
  landAddress;
  landPinCode;

  Viewdata(d)
  {
    debugger;
    this.Farmerregi=false;
    this.ViewDetails=true;
    this.UserEmailId=d.UserEmailId;
    this.ContactNo_=d.ContactNo_;
    this.address1=d.address1;
    this.address2=d.address2;
    this.city=d.city;
    this.state=d.state;
    this.pincode=d.pincode;
    this.pancardDocument=d.pancardDocument;
    this.aadharCardDocument=d.aadharCardDocument;
    this.certificate=d.certificate;
    this.IFSCCode=d.IFSCCode;
    this.BankAccountNo=d.BankAccountNo;
    this.landArea=d.landArea;
    this.landAddress=d.landAddress;
    this.landPinCode=d.landPinCode;

  }
  GoBack()
  {
    this.ViewDetails=false;
    this.Farmerregi=true;
  }
}
