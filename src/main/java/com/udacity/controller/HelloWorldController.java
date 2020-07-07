package com.udacity.controller;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@EnableAutoConfiguration
public class HelloWorldController
{
    @RequestMapping("/udacity/")
    @ResponseBody
    public String sayHello()
    {
        return "Hello Udacity, My name is Peter Molokwu and this is my fnal Captone project on Udacity's Nano program Cloud DevOps Engineer";
    }
}
