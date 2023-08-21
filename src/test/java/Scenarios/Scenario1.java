package Scenarios;

import com.intuit.karate.junit5.Karate;

public class Scenario1 {

	@Karate.Test
	public Karate runTime() {
		return Karate.run("classpath:features")
				.tags("Smoke");
		
		

	}

	

}
