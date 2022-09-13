package com.codingdojo.project.gymtracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.project.gymtracker.models.GymDay;

@Repository
public interface GymDayRepository extends CrudRepository<GymDay, Long> {
	
	List<GymDay> findAll();

}
