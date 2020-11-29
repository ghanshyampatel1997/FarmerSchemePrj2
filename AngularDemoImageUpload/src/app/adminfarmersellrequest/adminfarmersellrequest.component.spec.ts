import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminfarmersellrequestComponent } from './adminfarmersellrequest.component';

describe('AdminfarmersellrequestComponent', () => {
  let component: AdminfarmersellrequestComponent;
  let fixture: ComponentFixture<AdminfarmersellrequestComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminfarmersellrequestComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminfarmersellrequestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
