import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm:FormGroup;

  form = new FormGroup({
    userid: new FormControl('',Validators.required),
    password: new FormControl('',[Validators.required,Validators.minLength(6)])
  })
  constructor() { }

  ngOnInit(): void {
  }

}
