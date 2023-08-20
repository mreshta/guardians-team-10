package api.utility.data;

public class GenerateData {
	
	public static String getEmail() {
		
		String prefix = "Java.tester";
		String provider = "@gmail.us";
		int random = (int)(Math.random()* 10000);
		String email = prefix + random + provider;
		return email;
	}
	public static void main(String[]args) {

		System.out.println(getEmail());
	}

	
	public static String getPhoneNumber() {
		String phoneNumber = "2";
		for(int i = 0 ; i < 9 ; i++) {
			phoneNumber +=(int)(Math.random()*10);
			
		}
		
		return phoneNumber;
	}
	
	public static String getAddress() {
		
		String prefix =" Main st";
		String provider =" Alexandria, Va";
		int random = (int)(Math.random()* 4);
		int zipCode = (int)(Math.random() *5);
		String autoAddress = random + prefix + zipCode + provider;
		return autoAddress;
		
		
	}
}
