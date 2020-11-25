import { Component, OnInit } from '@angular/core';
import { soldhistoryservice } from 'src/Services/soldhistory.service';
import { Soldhistory } from '../Models/soldhistory.model';

@Component({
  selector: 'app-soldhistory',
  templateUrl: './soldhistory.component.html',
  styleUrls: ['./soldhistory.component.css']
})
export class SoldhistoryComponent implements OnInit {

  constructor(private SHservice:soldhistoryservice) { }

  ngOnInit(): void {
    this.getsoldhistorydata();
  }

  soldhistorydata:Soldhistory;
  getsoldhistorydata()
  {
    this.SHservice.Getsoldhistory().subscribe((data)=>{this.soldhistorydata=data;})
  }
}
