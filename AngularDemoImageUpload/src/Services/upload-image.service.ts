import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class UploadImageService {

  constructor(private http : HttpClient) { }

  postFile(Cropetype: string,CropeName: string,Fertilizertype: string,Quantity: string, fileToUpload: File) {
    const endpoint = 'https://localhost:44334/api/AngFarmerCropSellRequests';
    const formData: FormData = new FormData();
    formData.append('Crope type', Cropetype);
    formData.append('Crope Name', CropeName);
    formData.append('Fertilizer type', Fertilizertype);
    formData.append('Quantity', Quantity);
    formData.append('Image', fileToUpload, fileToUpload.name);
    return this.http
      .post(endpoint, formData);
  }

  getcropnamedata()
  {
    return this.http.get("https://localhost:44334/api/Cropprices");
  }
}
