package com.hackathon.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionController {

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public ModelAndView handleError405(HttpServletRequest request, Exception e) {
        ModelAndView mav = new ModelAndView("/exceptions/405");
        mav.addObject("exception", e);  
        //mav.addObject("errorcode", "405");
        return mav;
    }
    
    @ExceptionHandler(DataIntegrityViolationException.class)
    public ModelAndView test(){
    	ModelAndView mav = new ModelAndView("redirect:/register.do");
    	return mav;
    }
}