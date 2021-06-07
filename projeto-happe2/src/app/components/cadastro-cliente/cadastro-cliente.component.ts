import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { ClienteService } from 'src/app/services/cliente/cliente.service';
import { DataService } from 'src/app/services/data/data.service';

@Component({
  selector: 'app-cadastro-cliente',
  templateUrl: './cadastro-cliente.component.html',
  styleUrls: ['./cadastro-cliente.component.css']
})
export class CadastroClienteComponent implements OnInit, OnDestroy {
  cliente = {
    participantid: '',
    name: '',
	  email: '',
	  telephone: '',
	  companyname: '',
	  companyincome: '',
	  totalemployee: '',
	  rhemployee: ''
  };

  participantid = null;

  message = '';

  submited1: boolean;
  subscription: Subscription;

  constructor(private clienteService: ClienteService, private data: DataService) { }

  ngOnInit(): void {
    this.subscription = this.data.currentSubmited1.subscribe(submited1 => this.submited1 = submited1)
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }

  saveCliente(): void {
    const data = {
      name: this.cliente.name,
      email: this.cliente.email,
      telephone: this.cliente.telephone,
      companyname: this.cliente.companyname,
      companyincome: this.cliente.companyincome,
      totalemployee: this.cliente.totalemployee,
      rhemployee: this.cliente.rhemployee
    };

    this.clienteService.create(data)
      .subscribe(
        response => {
          console.log(response);
          this.participantid = response.participantid
          this.submited1 = true;
          console.log(this.submited1)
        },
        error => {
          this.message = error.error
          console.log(error);
          
        });
  }

  getParticipantId() {
    return this.participantid
  }

  newCliente(): void {
    this.submited1 = false;
    this.cliente = {
      participantid: '',
      name: '',
      email: '',
      telephone: '',
      companyname: '',
      companyincome: '',
      totalemployee: '',
      rhemployee: ''
    };
  }

}
