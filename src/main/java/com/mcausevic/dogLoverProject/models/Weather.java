package com.mcausevic.dogLoverProject.models;

import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Weather {
	
	@JsonProperty("main")
	private Map<String, Double> main;

	public Weather() {
	}

	public Map<String, Double> getMain() {
		return main;
	}

	public void setMain(Map<String, Double> main) {
		this.main = main;
	}

	@Override
	public String toString() {
		return "Weather [main=" + main + "]";
	}
	
	
	
}
