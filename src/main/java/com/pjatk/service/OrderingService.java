package com.pjatk.service;

import java.util.List;



import com.pjatk.models.Ordering;


public interface OrderingService {
	
	public List<Ordering> getOrderings();
	public void assignOrdering(Ordering ordering);
	public Ordering getOrdering(int id);
	public void addOrdering(Ordering ordering);
}
