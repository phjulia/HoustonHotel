package com.pjatk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjatk.dao.OrderingDAO;
import com.pjatk.models.Ordering;
import com.pjatk.models.Ordering;

@Service
public class OrderingServiceImpl implements OrderingService{


	@Autowired
	private OrderingDAO orderingDAO;

	@Override
	public List<Ordering> getOrderings() {
		return orderingDAO.getOrderings();
		 
	}
	
	@Override
	public void assignOrdering(Ordering ordering) {
		orderingDAO.assignOrdering(ordering);
		
	}
	
	@Override
	public Ordering getOrdering(int id) {
		return orderingDAO.getOrdering(id);
	}
	
	
	
	
	
	@Override
	public void addOrdering(Ordering ordering) {
		orderingDAO.addOrdering(ordering);
	}

	  

}
