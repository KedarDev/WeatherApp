package com.bptn.weatherapp.jpa;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity // @Entity tells us this class will be our User table in our DB
@Table(name="\"User\"") // Tells us the name of the DB table
public class User implements Serializable { // Serializable is an interface that tells the compiler this class is serializable & can save,store,or send files 
	
	private static final long serialVersionUID = 1L;  // Unique identifier used in the serialization & deserialization processes
	
	@Column(name="\"firstName\"") // @Column maps the annotated field to a column in the DB
	private String firstName;
		
	@Column(name="\"lastName\"")
	private String lastName;

	private String username;

	@JsonProperty(access = Access.WRITE_ONLY)
	private String password;
		
	private String phone;

	@Column(name="\"emailId\"")
	private String emailId;
		
	@Column(name="\"emailVerified\"")
	private Boolean emailVerified;
		
	@Column(name="\"createdOn\"")
	private Timestamp createdOn;

	@JsonIgnore // This annotation ignores the property during the serialization/deserialization
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER) // Mapped by user loaded with urgency 
	private List<Weather> weathers;
	
	@Id // tells us that this is a PK
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="\"userId\"")
	@JsonProperty(access = Access.WRITE_ONLY)
	private Integer userId;
	
	// constructor 
	public User() {
	}

	// GETTERS & SETTERS
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public Boolean getEmailVerified() {
		return emailVerified;
	}

	public void setEmailVerified(Boolean emailVerified) {
		this.emailVerified = emailVerified;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public void setWeathers(List<Weather> weathers) {
		this.weathers = weathers;
	}
	
	public Integer getUserId() {
		return userId;
	}
	
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public List<Weather> getWeathers() {
		return weathers;
	}

	// toString()
	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName + ", username=" + username + ", password="
				+ password + ", phone=" + phone + ", emailId=" + emailId + ", emailVerified=" + emailVerified
				+ ", createdOn=" + createdOn + ", weathers=" + weathers + ", userId=" + userId + "]";
	}
	
}