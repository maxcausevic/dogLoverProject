package com.mcausevic.dogLoverProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.mcausevic.dogLoverProject.models.Comment;
import com.mcausevic.dogLoverProject.repos.CommentRepo;


@Service
public class CommentService {
	private final CommentRepo commentRepo;
    public CommentService(CommentRepo commentRepo) {
        this.commentRepo = commentRepo;
    }
    
    public List<Comment> allComments() {
        return commentRepo.findAll();
    }

    public Comment createComment(Comment c) {
        return commentRepo.save(c);
    }

    public Comment findComment(Long id) {
        Optional<Comment> optionalComment = commentRepo.findById(id);
        if(optionalComment.isPresent()) {
            return optionalComment.get();
        } else {
            return null;
        }
    }
	
	public void deleteComment(Long id) {
		Optional<Comment> optionalComment = commentRepo.findById(id);
		if(optionalComment.isPresent()) {
			commentRepo.deleteById(id);
            return;
        } else {
            return;
        }
	}
}
