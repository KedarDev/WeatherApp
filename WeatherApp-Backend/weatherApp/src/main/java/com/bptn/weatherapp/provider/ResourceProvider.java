package com.bptn.weatherapp.provider;

import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import com.bptn.weatherapp.provider.factory.YamlPropertySourceFactory;
import org.springframework.beans.factory.annotation.Value;


@Component
@PropertySource(value = "classpath:config.yml", factory = YamlPropertySourceFactory.class)
public class ResourceProvider {
	
	@Value("${jwt.secret}")
	private String jwtSecret;

	@Value("${jwt.expiration}")
	private long jwtExpiration;

	@Value("${jwt.issuer}")
	private String jwtIssuer;
		
	@Value("${jwt.audience}")
	private String jwtAudience;

	@Value("${jwt.prefix}")
	private String jwtPrefix;

	@Value("${jwt.excluded.urls}")
	private String[] jwtExcludedUrls;

	@Value("${api.key}")
	private String apiKey;

	@Value("${api.base.url}")
	private String apiBaseUrl;

	@Value("${client.url}")
	private String clientUrl;
	    
	@Value("${client.email.verify.param}")
	private String clientVerifyParam;

	@Value("${client.email.verify.expiration}")
	private long clientVerifyExpiration;
	    
	@Value("${client.email.reset.param}")
	private String clientResetParam;

	@Value("${client.email.reset.expiration}")
	private long clientResetExpiration;

	/**
	 * @return the jwtSecret
	 */
	public String getJwtSecret() {
		return jwtSecret;
	}

	/**
	 * @return the jwtExpiration
	 */
	public long getJwtExpiration() {
		return jwtExpiration;
	}

	/**
	 * @return the jwtIssuer
	 */
	public String getJwtIssuer() {
		return jwtIssuer;
	}

	/**
	 * @return the jwtAudience
	 */
	public String getJwtAudience() {
		return jwtAudience;
	}

	/**
	 * @return the jwtPrefix
	 */
	public String getJwtPrefix() {
		return jwtPrefix;
	}

	/**
	 * @return the jwtExcludedUrls
	 */
	public String[] getJwtExcludedUrls() {
		return jwtExcludedUrls;
	}

	/**
	 * @return the apiKey
	 */
	public String getApiKey() {
		return apiKey;
	}

	/**
	 * @return the apiBaseUrl
	 */
	public String getApiBaseUrl() {
		return apiBaseUrl;
	}

	/**
	 * @return the clientUrl
	 */
	public String getClientUrl() {
		return clientUrl;
	}

	/**
	 * @return the clientVerifyParam
	 */
	public String getClientVerifyParam() {
		return clientVerifyParam;
	}

	/**
	 * @return the clientVerifyExpiration
	 */
	public long getClientVerifyExpiration() {
		return clientVerifyExpiration;
	}

	/**
	 * @return the clientResetParam
	 */
	public String getClientResetParam() {
		return clientResetParam;
	}

	/**
	 * @return the clientResetExpiration
	 */
	public long getClientResetExpiration() {
		return clientResetExpiration;
	}
}




