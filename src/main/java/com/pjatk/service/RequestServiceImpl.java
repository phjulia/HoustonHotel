package com.pjatk.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjatk.dao.RequestDAO;
import com.pjatk.models.Request;
import com.pjatk.models.Vacation;
/**
 * @author Yuliia Likhytska
 */
@Service
public class RequestServiceImpl implements RequestService{

	@Autowired
	RequestDAO requestDAO;
	
	@Override
	public Map<Request,List<Vacation>> getRequests() {
		return requestDAO.getRequests();
	}
	
	public void rejectRequest(Request request) {
		requestDAO.rejectRequest(request);
	}

	@Override
	public void approveRequest(Request request) {
		requestDAO.approveRequest(request);
		
	}

}
