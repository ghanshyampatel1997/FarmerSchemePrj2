import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminBidderRegiApprovalComponent } from './admin-bidder-regi-approval.component';

describe('AdminBidderRegiApprovalComponent', () => {
  let component: AdminBidderRegiApprovalComponent;
  let fixture: ComponentFixture<AdminBidderRegiApprovalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminBidderRegiApprovalComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminBidderRegiApprovalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
