package com.pjatk.dao;

import java.util.List;
import java.util.Map;

import com.pjatk.models.Request;
import com.pjatk.models.Vacation;
/**
 * @author Yuliia Likhytska
 */
public interface RequestDAO {
	public Map<Request, List<Vacation>> getRequests();
	public void rejectRequest(Request request);
	void approveRequest(Request request);
	public int getLoggedUserId();
}
