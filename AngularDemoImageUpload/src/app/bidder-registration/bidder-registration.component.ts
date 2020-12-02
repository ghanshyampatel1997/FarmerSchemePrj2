import { NullTemplateVisitor } from '@angular/compiler';
import { Component, OnInit } from '@angular/core';
import {  NgModel} from '@angular/forms';
import { BidderRegisterService } from 'src/Services/BidderRegister.Service';


@Component({
  selector: 'app-bidder-registration',
  templateUrl: './bidder-registration.component.html',
  styleUrls: ['./bidder-registration.component.css']
})
export class BidderRegistrationComponent implements OnInit {

  imageUrl1: string = "/assets/img/default-image.png";
  imageUrl2: string = "/assets/img/default-image.png";
  imageUrl3: string = "/assets/img/default-image.png";
  fileToUpload1: File = null;
  fileToUpload2: File = null;
  fileToUpload3: File = null;
 

  constructor(private BidRegiService:BidderRegisterService) { }

  ngOnInit(): void {
  }
  handleFileInput1(file1: FileList) {
    this.fileToUpload1 = file1.item(0);

    //Show image preview
    var reader = new FileReader();
    reader.onload = (event:any) => {
      this.imageUrl1 = event.target.result;
    }
    reader.readAsDataURL(this.fileToUpload1);
  }

  handleFileInput2(file2: FileList) {
    this.fileToUpload2 = file2.item(0);

    //Show image preview
    var reader = new FileReader();
    reader.onload = (event:any) => {
      this.imageUrl2 = event.target.result;
    }
    reader.readAsDataURL(this.fileToUpload2);
  }

  handleFileInput3(file3: FileList) {
    this.fileToUpload3 = file3.item(0);

    //Show image preview
    var reader = new FileReader();
    reader.onload = (event:any) => {
      this.imageUrl3 = event.target.result;
    }
    reader.readAsDataURL(this.fileToUpload3);
  }
massage;
  OnSubmit(Fullname,ContactNo,Emailid,Address1,Address2,City,State,Pincode,BankAccountno,IFSCCode,Image1,Image2,Image3,Password,CPassword){
   debugger;
    if(Password.value != CPassword.value)
   {
     window.alert("Passsword and Confirm password are not maching.");
   }
   else{
    this.BidRegiService.postFile(Fullname.value,ContactNo.value,Emailid.value,Address1.value,Address2.value,City.value,State.value,Pincode.value,BankAccountno.value,IFSCCode.value,Password.value,this.fileToUpload1,this.fileToUpload2,this.fileToUpload3).subscribe(
      (data) =>{this.massage=data;
        // window.alert(this.massage);
        // Fullname.value = null;
        // ContactNo.value = null;
        // Emailid.value = null;
        // Address1.value=null;
        // Address2.value=null;
        // City.value=null;
        // State.value=null;
        // Pincode.value=null;
        // BankAccountno.value=null;
        // IFSCCode.value=null;
        // Image1.value=null;
        // Image2.value=null;
        // Image3.value=null;
        // Password.value=null;
        // CPassword.value=null;
        // this.imageUrl1 = "/assets/img/default-image.png";
        // this.imageUrl2 = "/assets/img/default-image.png";
        // this.imageUrl3 = "/assets/img/default-image.png";
      },
      (error)=>
      {
        window.alert(error.error.Message);
      }
    );
   }
  }

}
