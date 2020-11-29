import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminClaimApprovalComponent } from './admin-claim-approval.component';

describe('AdminClaimApprovalComponent', () => {
  let component: AdminClaimApprovalComponent;
  let fixture: ComponentFixture<AdminClaimApprovalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminClaimApprovalComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminClaimApprovalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
