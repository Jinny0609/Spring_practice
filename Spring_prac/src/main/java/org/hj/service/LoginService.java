package org.hj.service;

import org.hj.model.LoginVO;

public interface LoginService {
	public void memreg(LoginVO member);
	public LoginVO login(LoginVO member);
	public LoginVO memdetail(LoginVO login);
	public void memberModify(LoginVO login);
	public void memberRemove(LoginVO login);
}
