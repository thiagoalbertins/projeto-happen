package happen.happenquest.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import happen.happenquest.mvc.model.Answer;
import happen.happenquest.mvc.repository.AnswerRepository;
import happen.happenquest.mvc.repository.ParticipantRepository;

@Controller
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping(path="/answer")
public class AnswerController {
	

	@Autowired
	private AnswerRepository answerRepo;
	
	@Autowired
	private ParticipantRepository participantRepo;

	@PostMapping(path="/new")
	public @ResponseBody String newAnswer (
			@RequestBody Answer answer)
	{
		answerRepo.save(answer);
		return "Answer: New Register Created\n";
	}
	
	@PostMapping(path = "/add")
	public ResponseEntity addNewAnswer(@RequestBody Answer answer) {
//		if (clienteRepository.existsByCpf(cliente.getCpf())) {
//			return new ResponseEntity<>("JÃ¡ existe um cliente cadastrado com o CPF informado!", HttpStatus.BAD_REQUEST);
//		}
//		
//		if (participant.getNome() == null || cliente.getNome().length() == 0) {
//			return new ResponseEntity<>("Favor informar um nome vÃ¡lido!",HttpStatus.BAD_REQUEST);
//		}
//
//		if (cliente.getCpf() == null || cliente.getCpf().length() != 11) {
//			return new ResponseEntity<>("Favor informar um CPF vÃ¡lido!", HttpStatus.BAD_REQUEST);
//		}
//
//		if (cliente.getEmail() == null || !cliente.getEmail().contains("@")) {
//			return new ResponseEntity<>("Favor informar um email vÃ¡lido!",HttpStatus.BAD_REQUEST);
//		}
//		
//		if (cliente.getTelefone().length() > 13) {
//			return new ResponseEntity<>("Favor informar um telefone vÃ¡lido!",HttpStatus.BAD_REQUEST);
//		}
		
		Answer a = new Answer();
		a.setParticipantid(answer.getParticipantid());
		a.setCat1(answer.getCat1());
		a.setCat2(answer.getCat2());
		a.setCat3(answer.getCat3());
		a.setCat4(answer.getCat4());
		a.setCat5(answer.getCat5());
		a.setCat6(answer.getCat6());
		a.setCat7(answer.getCat7());
		a.setCat8(answer.getCat8());
		a.setCat9(answer.getCat9());
		a.setCat10(answer.getCat10());
		answerRepo.save(a);

		return new ResponseEntity<>(a, HttpStatus.CREATED);
	}

	@GetMapping(path="/list")
	public @ResponseBody Iterable<Answer> listAnswers() {
		return answerRepo.findAll();
	}
	
	@GetMapping(path="/find/{id}")
	public @ResponseBody Answer getById(
			@PathVariable Integer id)
	{

		return answerRepo.findById(id).get();
	}
	
}
