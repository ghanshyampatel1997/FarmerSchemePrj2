import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ForgetPasswordservice } from 'src/Services/ForgetPassword.service';
import { LoginService } from 'src/Services/Login.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm:FormGroup;

  form = new FormGroup({
    usertype:new FormControl('',Validators.required),
    userid: new FormControl('',Validators.required),
    password: new FormControl('',[Validators.required,Validators.minLength(5)])
  })

  form2 = new FormGroup({
    mailid:new FormControl('',Validators.required),
     })
  constructor(private loginservice:LoginService,private router:Router,private forgetpassservice:ForgetPasswordservice) { }
  Loginformpart;
  forgetpasswordpart;
  registeroption;
  ngOnInit(): void {
    this.Loginformpart=true;
    this.forgetpasswordpart=false;
    this.registeroption=false;

  }
usertype
  onSubmit()
  {
    debugger;
    console.log(this.form);
    this.loginservice.GetLoginUserType(this.form.value).subscribe((data)=>
    {
      this.usertype=data;
      console.log(data);

      sessionStorage.setItem('roll',this.usertype[0]);
      sessionStorage.setItem('email',this.usertype[1]);
      sessionStorage.setItem('id',this.form.value.userid);
      this.router.navigate(['/Home']);
    },
    (error)=>{window.alert(error.error.Message)});
  }
  newuser()
  {
    this.registeroption=true;
  }
  FarmerRegister()
  {
    this.router.navigate(['/FarmerRegister']);
  }
  BidderRegister()
  {
    this.router.navigate(['/BidderRegister']);
  }

  forgetpassword()
  {
    this.Loginformpart=false;
    this.forgetpasswordpart=true;
  }
  passw;

  forgetPassSubmit()
  {
    debugger;
    this.forgetpassservice.getPassMail(this.form2.value).subscribe((data)=>
    {this.passw=data;
      if(this.passw=="Invalid Email Id")
      {
        window.alert(this.passw);
      }
      else{
        window.alert("Your Password is sent in mail to your provided Email id "+this.form2.value.mailid);
      this.Loginformpart=true;
      this.forgetpasswordpart=false;
      this.registeroption=false;
      }
    
    },
    (error)=>
    {
      window.alert(error.error.Message);
    })
  }

}
