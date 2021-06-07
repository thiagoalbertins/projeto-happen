package happen.happenquest.mvc.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import happen.happenquest.mvc.model.Participant;

@Repository
public interface ParticipantRepository extends CrudRepository<Participant, Integer>{

}
