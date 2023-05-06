package com.bptn.weatherapp.domain;

import java.util.Date;
import org.springframework.http.HttpStatus;
import java.text.SimpleDateFormat;

public class HttpResponse {
 
	Date timeStamp;
	int httpStatusCode; // 200, 201, 400, 500
	HttpStatus httpStatus;
	String reason;
	String message;


public HttpResponse(int httpStatusCode, HttpStatus httpStatus, String reason, String message) {
    this.timeStamp = new Date();
    this.httpStatusCode = httpStatusCode;
    this.httpStatus = httpStatus;
    this.reason = reason;
    this.message = message;
}

/**
 * @return the timeStamp
 */
public Date getTimeStamp() {
	return timeStamp;
}

/**
 * @return the httpStatusCode
 */
public int getHttpStatusCode() {
	return httpStatusCode;
}

/**
 * @return the httpStatus
 */
public HttpStatus getHttpStatus() {
	return httpStatus;
}

/**
 * @return the reason
 */
public String getReason() {
	return reason;
}

/**
 * @return the message
 */
public String getMessage() {
	return message;
}

@Override
public String toString() {
		
		String timeStamp = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(this.timeStamp);
		return "HttpResponse [timeStamp=" + timeStamp + ", httpStatusCode=" + httpStatusCode + ", httpStatus="
				+ httpStatus + ", reason=" + reason + ", message=" + message + "]";
}
}

