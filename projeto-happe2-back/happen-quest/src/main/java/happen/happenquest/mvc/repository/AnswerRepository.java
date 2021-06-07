package happen.happenquest.mvc.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import happen.happenquest.mvc.model.Answer;

@Repository
public interface AnswerRepository extends CrudRepository<Answer, Integer> {

}
