package com.mcausevic.dogLoverProject.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.mcausevic.dogLoverProject.models.User;
import com.mcausevic.dogLoverProject.repos.UserRepo;

@Service
public class UserService {
private final UserRepo userRepo;
	
	public UserService(UserRepo userRepo) {
		this.userRepo = userRepo;
	}
	 public User registerUser(User user) {
	        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
	        user.setPassword(hashed);
	        return userRepo.save(user);
	    }
	 public boolean authenticateUser(String email, String password) {
	        User user = userRepo.findByEmail(email);
	        if(user == null) {
	            return false;
	        } else {
	            if(BCrypt.checkpw(password, user.getPassword())) {
	                return true;
	            } else {
	                return false;
	            }
	        }
	    }
	 public User findByEmail(String email) {
	        return userRepo.findByEmail(email);
	    }
	 public User findUserById(Long id) {
	    	Optional<User> u = userRepo.findById(id);
	    	
	    	if(u.isPresent()) {
	            return u.get();
	    	} else {
	    	    return null;
	    	}
	    }
	 public List<User>allUsers(){
			return userRepo.findAll();
		}
		public User createUsers(User u) {
			return userRepo.save(u);
		}
		 public void deleteUser(Long id) {
	    		User user1 = findUserById(id);
	    		userRepo.delete(user1);
	    		
	    	}
}
