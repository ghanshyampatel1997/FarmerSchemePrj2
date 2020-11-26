import { ValueConverter } from '@angular/compiler/src/render3/view/template';
import { Component, OnInit } from '@angular/core';
import { BidderService } from '../../Services/Bidder.service';

@Component({
  selector: 'app-bidder',
  templateUrl: './bidder.component.html',
  styleUrls: ['./bidder.component.css']
})
export class BidderComponent implements OnInit {
  
  bidclass:any=[];
  constructor(private bidderservice:BidderService) { 
    this.bidclass=[];
  }

  ngOnInit(): void {
    
    this.fetchdata();
  }


  MarketData;
  fetchdata()
  {
    this.bidderservice.getMarketData().subscribe((data) =>{
      console.log(data);
      
      this.MarketData=data;
      console.table(data)
    },
    (error)=>
    {
      window.alert(error.error.Message);
    })

  }

  bamount;

  PlaceBidAmount(FarmerSellID,MSP,amount)
  {
    debugger;
   // this.bidclass..farmersellid=FarmerSellID;
    this.bamount=Number(amount);
    if(MSP>this.bamount)
    {
      window.alert("Bid amount has to greater than Minimum selling price.Here Minimum selling price is "+String(MSP));
    }
    else
    {
      this.bidclass.push({"FarmerSellID":FarmerSellID,"amount":this.bamount,"Userid":1})
      //this.bidclass.amount=amount;
      this.bidderservice.PostBidAmount(this.bidclass);
      this.bidclass=[];
      this.fetchdata();
      //this.bidclass2=this.fillbidclass(FarmerSellID,amount)
      //this.bidderservice.PostBidAmount(this.bidclass2)
  
      // this.bidderservice.PostBidAmount(FarmerSellID,amount)
    }
   
  }
}
