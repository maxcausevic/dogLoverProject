package com.mcausevic.dogLoverProject.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="users")
public class User {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Long id;
		
		@NotNull
		@Size(min=2, max=35)
		private String firstName;
		
		@NotNull
		@Size(min=2, max=35)
		private String lastName;
		
		 @NotNull
		 @Email(message="Email must be valid")
		 private String email;
		 
		@NotNull
		@Size(min=5, message="City must be greater than 3 characters.")
		private String city;
		
		 @NotNull
		 private String state;
		 
		 @NotNull
		 @Size(min=5, message="Password must be greater than 5 characters")
		 private String password;
		 
		 @Column(nullable=true, length=64)
		 private ArrayList<String> pictures;
		 
		 @Transient
		 private String passwordConfirmation;
		 
		@Column(updatable=false)
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date createdAt;
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date updatedAt;
		    
	    @OneToMany(mappedBy="host", fetch = FetchType.LAZY)
	    private List<Playdate> playdates;
		
		@OneToMany(mappedBy="postedBy", fetch = FetchType.LAZY)
	    private List<Comment> comments;
		
		@ManyToMany(fetch = FetchType.LAZY)
	    @JoinTable(
	        name = "playdates_users", 
	        joinColumns = @JoinColumn(name = "playdate_id"), 
	        inverseJoinColumns = @JoinColumn(name = "user_id")
	    )
	    private List<Playdate> playdatesAttending;
		 
		    public User() {
		    	
		    }
		    public User(String firstName, String lastName, String email, String city, String state, String password) {
		    	this.firstName = firstName;
		    	this.lastName = lastName;
		    	this.email = email;
		    	this.password = password;
		    	this.city = city;
		    	this.state = state;
		    }
			public Long getId() {
				return id;
			}
			public String getCity() {
				return city;
			}
			public void setCity(String city) {
				this.city = city;
			}
			public List<Playdate> getPlaydates() {
				return playdates;
			}
			public void setPlaydates(List<Playdate> playdates) {
				this.playdates = playdates;
			}
			public List<Comment> getComments() {
				return comments;
			}
			public void setComments(List<Comment> comments) {
				this.comments = comments;
			}
			public List<Playdate> getPlaydatesAttending() {
				return playdatesAttending;
			}
			public void setPlaydatesAttending(List<Playdate> playdatesAttending) {
				this.playdatesAttending = playdatesAttending;
			}
			public void setId(Long id) {
				this.id = id;
			}
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
			public String getEmail() {
				return email;
			}
			public void setEmail(String email) {
				this.email = email;
			}
			
			public String getState() {
				return state;
			}
			public void setState(String state) {
				this.state = state;
			}
			public String getPassword() {
				return password;
			}
			public void setPassword(String password) {
				this.password = password;
			}
			public String getPasswordConfirmation() {
				return passwordConfirmation;
			}
			public void setPasswordConfirmation(String passwordConfirmation) {
				this.passwordConfirmation = passwordConfirmation;
			}
			public Date getCreatedAt() {
				return createdAt;
			}
			public void setCreatedAt(Date createdAt) {
				this.createdAt = createdAt;
			}
			public Date getUpdatedAt() {
				return updatedAt;
			}
			public void setUpdatedAt(Date updatedAt) {
				this.updatedAt = updatedAt;
			}
		    
			
			@PrePersist
			    protected void onCreate(){
			        this.createdAt = new Date();
			    }
			    @PreUpdate
			    protected void onUpdate(){
			        this.updatedAt = new Date();
			    }
				public ArrayList<String> getPictures() {
					return pictures;
				}
				public void setPictures(ArrayList<String> pictures) {
					this.pictures = pictures;
				}
		
			    
	}


