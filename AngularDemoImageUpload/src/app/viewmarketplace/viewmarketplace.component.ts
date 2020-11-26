import { Component, OnInit } from '@angular/core';
import { ViewMarketPlaceservice } from 'src/Services/viewmarketplace.service';
import { ViewMarketPlace } from '../Models/Viewmarket.Model';

@Component({
  selector: 'app-viewmarketplace',
  templateUrl: './viewmarketplace.component.html',
  styleUrls: ['./viewmarketplace.component.css']
})
export class ViewmarketplaceComponent implements OnInit {

  constructor(private VMservice:ViewMarketPlaceservice) { }

  ngOnInit(): void {
    this.getViewMarketplacedata();
  }
  ViewMarketplacedata:ViewMarketPlace;
  getViewMarketplacedata()
  {
   this.VMservice.GetViewMarketplace().subscribe((data)=>{this.ViewMarketplacedata=data;
    console.table(data)},
    (error)=>
    {
      window.alert(error.error.Message);
    })
   }

}
