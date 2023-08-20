package api.Utility;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class GenerateData {

	public static String getEmail() {
		String prefix = "SkyEmail";
		String provider = "@gmail.com";

// This part int random =  (int) is type casted 
// so we can have the numbers as integer not double 

		int random = (int) (Math.random() * 10000);
//		double random =  (Math.random() * 10000);
		String email = prefix + random + provider;
		return email;

	}

// More sophisticated EmailGenerator
	public static class EmailGenerator {

		public static Set<String> generatedEmails = new HashSet<>();
		public static String pre = "Auto_email";
		public static String Pro = "@tekschool.us";

		public static String getEmail() {
			int random = (int) (Math.random() * 10000);
			String email = pre + random + Pro;

			while (generatedEmails.contains(email)) {
				random = (int) (Math.random() * 10000);
				email = pre + random + Pro;
			}

			generatedEmails.add(email);
			return email;
		}

	}

	

//	GetPhoneNumber
	public static Set<String> gNum = new HashSet<>();

	public static String getPhoneNumber() {

		String phoneNumber = "202-";

		for (int i = 0; i < 7; i++) {
			phoneNumber += (int) (Math.random() * 10);
			if (!gNum.contains(phoneNumber)) {
				gNum.add(phoneNumber);
//	                break;
			}
		}
		return phoneNumber;
	}

//	Get Address
	public static Set<String> gAdd = new HashSet<>();

	public static String getAddress() {

		String address = "202";

		for (int i = 0; i < 7; i++) {
			address += (int) (Math.random() * 10);
			if (!gAdd.contains(address)) {
				gAdd.add(address);

			}
		}
		return address;

	}


// Random Year
	
	    public static  int generateRandomYear() {
	        Random random = new Random();
	        int maxYear = 9999;  // Maximum 4-digit year
	        int minYear = 1970;  // Minimum year
	        
	        return random.nextInt(maxYear - minYear + 1) + minYear;
	    }

	
	public static void main(String[] args) {

		String email = EmailGenerator.getEmail();
		System.out.println(email);
		int randomYear = generateRandomYear();
        System.out.println("Random 4-digit year above 1970: " + randomYear);
	}
}
