package com.mcausevic.dogLoverProject.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mcausevic.dogLoverProject.models.Playdate;

@Repository
public interface PlaydateRepo extends CrudRepository<Playdate, Long>{

	List<Playdate> findAll();
	
	void deleteById(Long id);
	
	Playdate save(Playdate x);
	
	Optional<Playdate> findById(Long id);
}
