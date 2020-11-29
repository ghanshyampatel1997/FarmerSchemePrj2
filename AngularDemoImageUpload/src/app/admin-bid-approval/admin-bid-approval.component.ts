import { Component, OnInit } from '@angular/core';
import { BiddingStatusService } from 'src/Services/AdminBidApproval.Service';

@Component({
  selector: 'app-admin-bid-approval',
  templateUrl: './admin-bid-approval.component.html',
  styleUrls: ['./admin-bid-approval.component.css']
})
export class AdminBidApprovalComponent implements OnInit {

  biddingstat;
  ViewDetails;
  Biddingdata;
   constructor(private BSRequest: BiddingStatusService) { }
 
   ngOnInit(): void {
    this.biddingstat=true;
    this.ViewDetails=false;
    this.BidStatusapprovalgetdata();
   }
  
  BidStatusapprovalgetdata(){
    this.BSRequest.GetBiddingStatus().subscribe((data)=>
    {this.Biddingdata=data;console.log(data);console.table(data);});
    
  }
  BidID;
  bidAmount;
  ApprovedBid;
  date;
  Biddingdate;
  fullname;
  cropType;
  CropId;
  quantity;
  cropname;
  MSP;
  
 
  Viewdata(b)
  {
    this.biddingstat=false;
    this.ViewDetails=true;
    this.BidID=b.BidID;
    this.bidAmount=b.bidAmount;
    this.ApprovedBid=b.ApprovedBid;
    this.date=b.date;
    this.Biddingdate=b.Biddingdate;
    this.fullname=b.fullname;
    this.cropType=b.cropType;
    this.quantity=b.quantity;
    this.cropname=b.cropname;
    this.MSP=b.MSP;
 
   }
   GoBack()
   {
     this.ViewDetails=false;
     this.biddingstat=true;
   }
   ApproveBidRequest()
   {
   
    this.BSRequest.ApproveBidStatusdata(this.BidID).subscribe((data)=>
    {
      window.alert(data);
      this.GoBack();
      this.BidStatusapprovalgetdata();
 
    },
    (error)=>{window.alert(error.error.Message);})
   }
 
 }
 