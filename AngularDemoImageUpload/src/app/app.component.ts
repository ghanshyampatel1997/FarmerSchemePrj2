import { Component } from '@angular/core';
import{Router} from '@angular/router'

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'DemoImageUpload';

  loginsessionuser;
  Rolltype;
  UserFarmer;
  UserBidder;
  UserAdmin;
  username;
  constructor(private router:Router)
  {

  }
  //part of angular life cycle hook,callback method that performs change -detection
  ngDoCheck()
  {
    if(sessionStorage.getItem('email'))//localStorage.getItem('email'))
    {
      this.loginsessionuser=true;
     this.username= sessionStorage.getItem('email');
     this.Rolltype=sessionStorage.getItem('roll')
     if(this.Rolltype=='admin')
     {
      this.UserAdmin=true;
     }
    else if(this.Rolltype=='farmer')
      {
        this.UserFarmer=true;
      }
    else if(this.Rolltype=='bidder')
      {
        this.UserBidder=true;
      }

    }
    else{
      this.loginsessionuser=false;
    }
  }

  logOff()
  {
    //localStorage.clear();
    //this.loginsession=false;
    sessionStorage.clear();
   this.loginsessionuser=false;
   this.UserFarmer=false;
   this.UserBidder=false;
   this.UserAdmin=false;
    this.router.navigate(['/Home']);

  }

}
