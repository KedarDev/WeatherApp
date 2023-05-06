package com.bptn.weatherapp.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bptn.weatherapp.provider.ResourceProvider;
import static com.auth0.jwt.algorithms.Algorithm.HMAC512;
import java.util.Date;
import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;

@Component
public class JwtService {
	final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	ResourceProvider provider;

	// Method generates JWT token for a username with expiration time
	public String generateJwtToken(String username, long expiration) {

		return JWT.create().withIssuer(this.provider.getJwtIssuer()).withAudience(this.provider.getJwtAudience())
				.withIssuedAt(new Date()).withSubject(username)
				.withExpiresAt(new Date(System.currentTimeMillis() + expiration))
				.sign(HMAC512(this.provider.getJwtSecret()));
	}

	// Method takes token string as input and verifies its authenticity
	public DecodedJWT verifyJwtToken(String token) {

		return JWT.require(HMAC512(this.provider.getJwtSecret())).withIssuer(this.provider.getJwtIssuer()).build()
				.verify(token);
	}

	// Method used to extract the subject claim from the token
	public String getSubject(String token) {

		return JWT.require(HMAC512(this.provider.getJwtSecret())).withIssuer(this.provider.getJwtIssuer()).build()
				.verify(token).getSubject();
	}

}
