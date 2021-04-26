package com.mcausevic.dogLoverProject.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mcausevic.dogLoverProject.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long>{
	List<User>findAll();

	User findByEmail(String email);
	 void deleteById(Long id);
	 User save(User x);
	 Optional<User> findById(Long id);
}
