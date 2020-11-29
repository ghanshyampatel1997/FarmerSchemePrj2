import { Component, OnInit } from '@angular/core';
import { NgModel} from '@angular/forms';
import { InsuranceService } from 'src/Services/Insurance.Service';
import { InsuranceForm } from '../Models/Insurance.model';


@Component({
  selector: 'app-insurance-application',
  templateUrl: './insurance-application.component.html',
  styleUrls: ['./insurance-application.component.css']
})
export class InsuranceApplicationComponent implements OnInit {
  Calculate;
  constructor(private Inservice:InsuranceService) {}

  ngOnInit(): void {
    this.Calculate=false;
  }

//Calculate method
SumInsuredperHectare;
SharePremium;
PremiumAmount;
CropName1;
Area;
SumInsured1;
time;
currentYear;
Insurance:InsuranceForm=new InsuranceForm();
  CalculateInsurance(season,year,cropname,suminsured,area){
    debugger;
    if(season.value=="Choose")
    {
      window.alert("Choose correct season.")
    }
    else{
      this.currentYear= new Date().getFullYear();
      this.time=Number(this.currentYear);
      
      if(year.value<this.time)
      {
        window.alert("Year has to be graeter or equal to current year.")
      }
      else{
        this.Calculate=true;
        this.SumInsuredperHectare=(suminsured.value/(area.value));
        if(season.value=="Kharif"){this.SharePremium=2};
        if(season.value=="Zaid"){this.SharePremium=1};
        if(season.value=="Rabi"){this.SharePremium=1.5};
        if(season.value=="Annual"){this.SharePremium=5};
        this.PremiumAmount=(suminsured.value)*(this.SharePremium)/100;
        this.CropName1=cropname.value;
        this.Area=area.value;
        this.SumInsured1=suminsured.value;
      }
    }
  
  }
  Result;

  //postmethod
  AddInsuranceForm(season,year,cropname,suminsured,area){
  debugger;
  this.Insurance.season=season.value;
  this.Insurance.year=year.value;
  this.Insurance.cropname=cropname.value;
  this.Insurance.SumInsured=suminsured.value;
  this.Insurance.Area=area.value;
  this.Insurance.Userid=2;
  console.log(this.Insurance);
  this.Inservice.InsertInsuranceForm(this.Insurance).subscribe((data) => { this.Result = data;
    window.alert(this.Result);
  },
  (error)=>
  {
    window.alert(error.error.Message);
  })

  } 


}
