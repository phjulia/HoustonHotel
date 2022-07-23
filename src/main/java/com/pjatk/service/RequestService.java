package com.pjatk.service;

import java.util.List;
import java.util.Map;

import com.pjatk.models.Request;
import com.pjatk.models.Vacation;
/**
 * @author Yuliia Likhytska
 */
public interface RequestService {
	public Map<Request, List<Vacation>> getRequests();
	public void rejectRequest(Request request);
	public void approveRequest(Request request);
}
