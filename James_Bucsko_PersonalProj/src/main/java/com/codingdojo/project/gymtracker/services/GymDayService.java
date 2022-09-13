package com.codingdojo.project.gymtracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.project.gymtracker.models.GymDay;
import com.codingdojo.project.gymtracker.repositories.GymDayRepository;

@Service
public class GymDayService {
	@Autowired
	private GymDayRepository grepo;
	
	public GymDay findById(Long id) {
		Optional<GymDay> result = grepo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<GymDay> allGymDays(){
		return grepo.findAll();
	}

	
	public GymDay create(GymDay gymday) {
		return grepo.save(gymday);
	}
	
	public GymDay update(GymDay gymday) {
		return grepo.save(gymday);
	}
	
	public void delete(Long id) {
		grepo.deleteById(id);
	}

}
