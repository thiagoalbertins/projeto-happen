package happen.happenquest.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;


import happen.happenquest.mvc.model.Participant;
import happen.happenquest.mvc.repository.ParticipantRepository;

@Controller
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping(path="/participant")
public class ParticipantController {

	@Autowired
	private ParticipantRepository participantRepo;

//	@PostMapping(path="/new")
//	public @ResponseBody String newParticipant (
//			@RequestBody Participant participant)
//	{
//		participantRepo.save(participant);
//		return "Participant: New Register Created\n";
//	}
	
	@PostMapping(path = "/add")
	public ResponseEntity addNewCliente(@RequestBody Participant participant) {
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
		
		Participant p = new Participant();
		p.setName(participant.getName());
		p.setEmail(participant.getEmail());
		p.setTelephone(participant.getTelephone());
		p.setCompanyname(participant.getCompanyname());
		p.setCompanyincome(participant.getCompanyincome());
		p.setTotalemployee(participant.getTotalemployee());
		p.setRhemployee(participant.getRhemployee());
		participantRepo.save(p);

		return new ResponseEntity<>(p, HttpStatus.CREATED);
	}

//	@GetMapping(path="/list")
//	public @ResponseBody Iterable<Participant> listParticipants() {
//		return participantRepo.findAll();
//	}

//	@DeleteMapping(path="/del/{id}")
//	@ResponseStatus(code=HttpStatus.ACCEPTED)
//	public @ResponseBody String  deleteParticipant(@PathVariable Integer id)
//	{
//
//		if (participantRepo.findById(id) == null) {
//			return "ID " + id +" Not found";
//		}
//
//		participantRepo.deleteById(id);
//		return "Participant: Register "+id+" Deleted";
//	}
	
//	@GetMapping(path="/find/{id}")
//	public @ResponseBody Participant getById(
//			@PathVariable Integer id)
//	{
//
//		return participantRepo.findById(id).get();
//	}
	
	@GetMapping(path = "/{id}")
	public @ResponseBody ResponseEntity<Participant> returnParticipant(@PathVariable Integer id) {

		return ResponseEntity.ok()
				.body(participantRepo.findById(id).orElseThrow());
	}
	
	@GetMapping(path = "/all")
	public ResponseEntity<List<Participant>> getAllClientes(@RequestParam(required = false) String nome) {
		try {
			List<Participant> clientes = new ArrayList<Participant>();

			if (nome == null)
				participantRepo.findAll().forEach(clientes::add);
			
//			else
//				participantRepo.findByNomeContaining(nome).forEach(clientes::add);

			if (clientes.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}

			return new ResponseEntity<>(clientes, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
