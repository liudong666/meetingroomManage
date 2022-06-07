package service;

import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;

public interface JwtService {
	
	/**
	 * 创建token，自定义的Claim为staff_number
	 * 使用场景：用户登录后，返回token，前端保存token
	 * @param staff_number
	 * @return
	 * @throws JWTCreationException
	 */
	String create(String staff_number) throws JWTCreationException;
	
	/**
	 * 验证前端提交的token
	 * 使用场景：需要验证用户身份，获取用户staff_number的时候
	 * @param token
	 * @return 验证失败返回null，验证成功返回staff_number
	 * @throws JWTVerificationException
	 */
	String getStaffNum(String token) throws JWTVerificationException;
}
