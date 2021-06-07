import { Component, OnInit, Input, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { DataService } from 'src/app/services/data/data.service';
import { PerguntasService } from 'src/app/services/perguntas/perguntas.service';

@Component({
  selector: 'app-perguntas',
  templateUrl: './perguntas.component.html',
  styleUrls: ['./perguntas.component.css']
})
export class PerguntasComponent implements OnInit, OnDestroy {
  resposta = {
    participantid: '',
    cat1: '',
    cat2: '',
    cat3: '',
    cat4: '',
    cat5: '',
    cat6: '',
    cat7: '',
    cat8: '',
    cat9: '',
    cat10: ''
  };

  peso = [0, 0, 0, 0, 0];

  categoria = 0;

  message = '';

  submited2: boolean;
  subscription: Subscription;

  @Input() participantid: string;

  constructor(private perguntasService: PerguntasService, private data: DataService) { }

  ngOnInit(): void {
    this.subscription = this.data.currentSubmited2.subscribe(submited2 => this.submited2 = submited2)
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }
  
  saveResposta(): void {
    const data = {
      participantid: this.participantid,
      cat1: this.resposta.cat1,
      cat2: this.resposta.cat2,
      cat3: this.resposta.cat3,
      cat4: this.resposta.cat4,
      cat5: this.resposta.cat5,
      cat6: this.resposta.cat6,
      cat7: this.resposta.cat7,
      cat8: this.resposta.cat8,
      cat9: this.resposta.cat9,
      cat10: this.resposta.cat10,
    };

    this.perguntasService.create(data)
      .subscribe(
        response => {
          console.log(response);
          this.participantid = response.participantid
          const respostas: Array<string> = [
            response.cat1,
            response.cat2,
            response.cat3,
            response.cat4,
            response.cat5,
            response.cat6,
            response.cat7,
            response.cat8,
            response.cat9,
            response.cat10];

          var peso: Array<any> = [
            respostas.filter(x => x === '1').length,
            respostas.filter(x => x === '2').length,
            respostas.filter(x => x === '3').length,
            respostas.filter(x => x === '4').length,
            respostas.filter(x => x === '5').length,
          ]

          this.peso = peso

          var max = Math.max.apply(Math, this.peso.map((i) => i));
          var maxIndex = this.peso.indexOf(max);
          this.categoria = maxIndex
          this.submited2 = true;
        },
        error => {
          this.message = error.error
          console.log(error);
          
        });
  }

  getCategoriaDoParticipante(): any {
    var max = Math.max.apply(Math, this.peso.map((i) => i));
    var maxIndex = this.peso.indexOf(max);
    this.categoria = maxIndex
  }

}
