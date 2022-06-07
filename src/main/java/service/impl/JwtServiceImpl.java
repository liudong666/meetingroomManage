package service.impl;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;

import service.JwtService;

@Service
public class JwtServiceImpl implements JwtService {

	/**
	 * 创建token，自定义的Claim为staff_number
	 * 
	 * @param staff_number
	 * @return
	 * @throws JWTCreationException
	 */
	public String create(String staff_number) throws JWTCreationException {
		String token = null;
		// 自定义的claim为staff_number
		try {
			Algorithm algorithm = Algorithm.HMAC256("14-602");
			token = JWT.create().withClaim("staff_number", staff_number).sign(algorithm);
		} catch (JWTCreationException exception) {
			// Invalid Signing configuration / Couldn't convert Claims.
			// 考虑给前端的状态码
		}
		return token;
	}

	/**
	 * 验证前端提交的token 使用场景：需要验证用户身份，获取用户staff_number的时候
	 * 
	 * @param token
	 * @return 验证失败返回null，验证成功返回staff_number
	 * @throws JWTVerificationException
	 */
	public String getStaffNum(String token) throws JWTVerificationException {
		String staff_number = null;
		try {
			Algorithm algorithm = Algorithm.HMAC256("14-602");
			JWTVerifier verifier = JWT.require(algorithm).build(); // Reusable verifier instance
			DecodedJWT jwt = verifier.verify(token);
			Map<String, Claim> claim = jwt.getClaims();
			staff_number = claim.get("staff_number").asString();
		} catch (JWTVerificationException exception) {
			// Invalid signature/claims
		}
		return staff_number;
	}
}
