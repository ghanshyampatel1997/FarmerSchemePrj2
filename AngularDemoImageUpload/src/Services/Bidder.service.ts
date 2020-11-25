import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({ providedIn: "root" })
export class BidderService {

  constructor(private http : HttpClient) { }

  readonly endpoint = 'https://localhost:44334/api/Bidding';
  getMarketData()
  {
    return this.http.get(this.endpoint);
  }
  
  PostBidAmount(bidclass:any)
  {
    //this.bidclass2=this.fillbidclass(FarmerSellID,bidAmount)
    return this.http.post(this.endpoint,bidclass)
      .subscribe(
        result => {
          window.alert(result);

        },
        error => {
          console.log('There was an error: ')
        }
      );
    //return this.http.post(this.endpoint+"?FarmerSellID="+FarmerSellID+"&bidAmount="+bidAmount);
  }

}