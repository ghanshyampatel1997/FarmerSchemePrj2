import { Component, OnInit } from '@angular/core';
import {Route, Router} from '@angular/router';
import { NgForm } from '@angular/forms';
import { UploadImageService } from 'src/Services/upload-image.service';

@Component({
  selector: 'app-farmer-crop-sell-request',
  templateUrl: './farmer-crop-sell-request.component.html',
  styleUrls: ['./farmer-crop-sell-request.component.css'],
  providers:[UploadImageService]
})
export class FarmerCropSellRequestComponent implements OnInit {
  farmeroption=true;
  fsellrequestvalue;
  SoldcropHistoryValue;
  MarketPlaceValue;
  imageUrl: string = "/assets/img/default-image.png";
  fileToUpload: File = null;


  constructor(private imageService : UploadImageService,private router:Router) { }

  ngOnInit(): void {
    this.farmeroption=true;
    this.fsellrequestvalue=false;
    this.SoldcropHistoryValue=false;
    this.MarketPlaceValue=false;
    this.getCropsNames();
  }
 cropdata;
  getCropsNames()
  {
    this.imageService.getcropnamedata().subscribe((data)=>
    {
      this.cropdata=data;
    });
  }
  sellrequest()
  {
    this.farmeroption=false;
    this.fsellrequestvalue=true;
  }
  cropHistoryrequest()
  {
    this.router.navigate(['/SoldHistory']);
  }

  MarketPlacerequest()
  {
    this.router.navigate(['/ViewMarketPlace']);
  }

  handleFileInput(file: FileList) {
    this.fileToUpload = file.item(0);

    //Show image preview
    var reader = new FileReader();
    reader.onload = (event:any) => {
      this.imageUrl = event.target.result;
    }
    reader.readAsDataURL(this.fileToUpload);
  }
  
userid=Number(sessionStorage.getItem('id'));
  OnSubmit(Cropetype,CropeName,Fertilizertype,Quantity,Image){
    debugger;
   this.imageService.postFile(Cropetype.value,CropeName.value,Fertilizertype.value,Quantity.value,this.userid,this.fileToUpload).subscribe(
     (data) =>{
       window.alert(data);
       console.log('done');
       Cropetype.value = null;
       CropeName.value = null;
       Fertilizertype.value = null;
       Quantity.value = null;
       Image.value = null;
       this.imageUrl = "/assets/img/default-image.png";
     },
     (error)=>
     {
       window.alert(error.error.Message);
     }
   );
  }
}

