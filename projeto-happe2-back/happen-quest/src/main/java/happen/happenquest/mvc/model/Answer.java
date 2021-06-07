package happen.happenquest.mvc.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

import happen.happenquest.mvc.repository.ParticipantRepository;

@Entity
@Table(name="answers")
public class Answer {
	
//	@Autowired
//	private ParticipantRepository participantRepo; 
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) //AUTO Mysql -> IDENTITY Postgresql
	private Integer answersid;
	
//	@ManyToOne(fetch = FetchType.LAZY, cascade=CascadeType.REFRESH)
//	@JoinColumn(name="participantid", nullable = false)
//	private Participant participant;
	
	private Integer participantid;
	
	private String cat1;
	private String cat2;
	private String cat3;
	private String cat4;
	private String cat5;
	private String cat6;
	private String cat7;
	private String cat8;
	private String cat9;
	private String cat10;
	
	public Integer getAnswersid() {
		return answersid;
	}
	public void setAnswersid(Integer answersid) {
		this.answersid = answersid;
	}
//	public Participant getParticipant() {
//		return participantRepo.findById(this.getParticipantid()).get();
//	}
//	public void setParticipant(Participant participant) {
//		this.participant = participant;
//	}
	public String getCat1() {
		return cat1;
	}
	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}
	public String getCat2() {
		return cat2;
	}
	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}
	public String getCat3() {
		return cat3;
	}
	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}
	public String getCat4() {
		return cat4;
	}
	public void setCat4(String cat4) {
		this.cat4 = cat4;
	}
	public String getCat5() {
		return cat5;
	}
	public void setCat5(String cat5) {
		this.cat5 = cat5;
	}
	public String getCat6() {
		return cat6;
	}
	public void setCat6(String cat6) {
		this.cat6 = cat6;
	}
	public String getCat7() {
		return cat7;
	}
	public void setCat7(String cat7) {
		this.cat7 = cat7;
	}
	public String getCat8() {
		return cat8;
	}
	public void setCat8(String cat8) {
		this.cat8 = cat8;
	}
	public String getCat9() {
		return cat9;
	}
	public void setCat9(String cat9) {
		this.cat9 = cat9;
	}
	public String getCat10() {
		return cat10;
	}
	public void setCat10(String cat10) {
		this.cat10 = cat10;
	}
	public Integer getParticipantid() {
		return participantid;
	}
	public void setParticipantid(Integer participantid) {
		this.participantid = participantid;
	}
	
}
