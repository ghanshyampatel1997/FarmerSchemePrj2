import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class FarmerRegisterService {

  constructor(private http : HttpClient) { }

  postFile(Fullname: string,ContactNo: string,Emailid: string,Address1: string,Address2: string,City: string,State: string,
    Pincode: Number,LArea: string,LAddress: string,LPincode: Number,BankAccountno: Number,IFSCCode: string,
    Password: string,fileToUpload1: File,fileToUpload2: File,fileToUpload3: File) {
    const endpoint = 'https://localhost:44334/api/FarmerRegister';
    const formData: FormData = new FormData();
    // formData.append('Usertype', Usertype);
    formData.append('Fullname', Fullname);
    formData.append('ContactNo', ContactNo);
    formData.append('Emailid', Emailid);
    formData.append('Address1', Address1);
    formData.append('Address2', Address2);
    formData.append('City', City);
    formData.append('State', State);
    formData.append('Pincode', String(Pincode));
    formData.append('LArea',LArea);
    formData.append('LAddress', LAddress);
    formData.append('LPincode', String(LPincode));
    formData.append('BankAccountno', String(BankAccountno));
    formData.append('IFSCCode', IFSCCode);
    formData.append('Password', Password);
    formData.append('Image1', fileToUpload1, fileToUpload1.name);
    formData.append('Image2', fileToUpload2, fileToUpload2.name);
    formData.append('Image3', fileToUpload3, fileToUpload3.name);
    return this.http
      .post(endpoint, formData);
  }

}
