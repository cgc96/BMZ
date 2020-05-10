<<<<<<< HEAD
package org.justking.homepage.member.db;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String pw;
	private String email;
	private String nickname;
	private Date reg_date;
	private Date log_date;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getLog_date() {
		return log_date;
	}

	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}


	public String getNickName() {
		return nickname;
	}

	public void setNickName(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", email=" + email + ", nickname=" + nickname + ", reg_date="
				+ reg_date + ", log_date=" + log_date + "]";
	}
	

=======
package org.justking.homepage.member.db;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String pw;
	private String email;
	private String nickname;
	private Date reg_date;
	private Date log_date;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getLog_date() {
		return log_date;
	}

	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}


	public String getNickName() {
		return nickname;
	}

	public void setNickName(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", email=" + email + ", nickname=" + nickname + ", reg_date="
				+ reg_date + ", log_date=" + log_date + "]";
	}
	

>>>>>>> master
}