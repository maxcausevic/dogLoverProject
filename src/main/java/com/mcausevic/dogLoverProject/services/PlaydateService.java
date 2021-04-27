package com.mcausevic.dogLoverProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.mcausevic.dogLoverProject.models.Playdate;
import com.mcausevic.dogLoverProject.repos.PlaydateRepo;


@Service
public class PlaydateService {
	
	private final PlaydateRepo playdateRepo;
    public PlaydateService(PlaydateRepo playdateRepo) {
        this.playdateRepo = playdateRepo;
    }
    
    public List<Playdate> allPlaydates() {
        return playdateRepo.findAll();
    }

    public Playdate createPlaydate(Playdate p) {
        return playdateRepo.save(p);
    }

    public Playdate findPlaydate(Long id) {
        Optional<Playdate> optionalPlaydate = playdateRepo.findById(id);
        if(optionalPlaydate.isPresent()) {
            return optionalPlaydate.get();
        } else {
            return null;
        }
    }

	public Playdate updatePlaydate(Playdate p) {
            return playdateRepo.save(p);
    }
	
	public void deletePlaydate(Long id) {
		Optional<Playdate> optionalPlaydate = playdateRepo.findById(id);
		if(optionalPlaydate.isPresent()) {
			playdateRepo.deleteById(id);
            return;
        } else {
            return;
        }
	}

}
