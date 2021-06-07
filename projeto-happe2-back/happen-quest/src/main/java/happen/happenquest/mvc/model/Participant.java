package happen.happenquest.mvc.model;

import lombok.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name="participants")
public class Participant {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) //AUTO Mysql -> IDENTITY Postgresql
	@Getter @Setter private Integer participantid;
	
	@Getter @Setter private String name;
	
	@Getter @Setter private String email;
	
	@Getter @Setter private String telephone;
	
	@Getter @Setter private String companyname;
	
	@Getter @Setter private String companyincome;
	
	@Getter @Setter private Integer totalemployee;
	
	@Getter @Setter private Integer rhemployee;
	
	public Integer getParticipantid() {
		return participantid;
	}

	public void setParticipantid(Integer participantid) {
		this.participantid = participantid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getCompanyincome() {
		return companyincome;
	}

	public void setCompanyincome(String companyincome) {
		this.companyincome = companyincome;
	}

	public Integer getTotalemployee() {
		return totalemployee;
	}

	public void setTotalemployee(Integer totalemployee) {
		this.totalemployee = totalemployee;
	}

	public Integer getRhemployee() {
		return rhemployee;
	}

	public void setRhemployee(Integer rhemployee) {
		this.rhemployee = rhemployee;
	}

//	public List<Answer> getAnswers() {
//		return answers;
//	}
//
//	public void setAnswers(List<Answer> answers) {
//		this.answers = answers;
//	}
//
//	@OneToMany(fetch = FetchType.LAZY, mappedBy="participants",cascade=CascadeType.REFRESH)
//	@Getter @Setter private List<Answer> answers = new ArrayList<>();
}
