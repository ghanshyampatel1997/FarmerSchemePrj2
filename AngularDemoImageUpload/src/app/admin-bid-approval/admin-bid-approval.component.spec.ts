import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminBidApprovalComponent } from './admin-bid-approval.component';

describe('AdminBidApprovalComponent', () => {
  let component: AdminBidApprovalComponent;
  let fixture: ComponentFixture<AdminBidApprovalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminBidApprovalComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminBidApprovalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
