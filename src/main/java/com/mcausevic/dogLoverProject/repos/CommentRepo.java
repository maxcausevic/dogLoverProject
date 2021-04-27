package com.mcausevic.dogLoverProject.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mcausevic.dogLoverProject.models.Comment;

@Repository
public interface CommentRepo extends CrudRepository<Comment, Long> {
	
	List<Comment> findAll();
	
	void deleteById(Long id);
	
	Comment save(Comment x);
	
	Optional<Comment> findById(Long id);
}
