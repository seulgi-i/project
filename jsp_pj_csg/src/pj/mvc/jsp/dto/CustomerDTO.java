package pj.mvc.jsp.dto;

import java.sql.Date;
import java.sql.Timestamp;

//DTO(Data Transfer Object) : setter -> 멤버변수 -> getter
//멤버변수 = 컬럼명 = input태그명
public class CustomerDTO {
	private String id;
	private String password;
	private String name;
	private Date birthday;
	private String address;
	private String hp;
	private String email;
	private Timestamp regDate;
	
	public CustomerDTO() {
		
	}

	public CustomerDTO(String id, String password, String name, Date birthday, String address, String hp, String email,
			Timestamp regDate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.address = address;
		this.hp = hp;
		this.email = email;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "CustoemrDTO [id=" + id + ", password=" + password + ", name=" + name + ", birthday=" + birthday
				+ ", address=" + address + ", hp=" + hp + ", email=" + email + ", regDate=" + regDate + "]";
	}
	
	
}
