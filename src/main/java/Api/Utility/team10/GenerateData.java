package Api.Utility.team10;

public class GenerateData {
	public static String getEmail() {

		String prefix = "team10_email";
		String provider = "@gmail.com";
		int random = (int) (Math.random() * 10000);
		String email = prefix + random + provider;
		return email;
	}
// public static void main(String[] args) {
//	 GenerateData data= new GenerateData();
//	 System.out.println(data.getEmail());
//}
// 
	public static String getPhoneNumber() {

		String phoneNumber = "2";
		for (int i = 0; i < 9; i++) {
			phoneNumber += (int) (Math.random() * 10);
		}
		return phoneNumber;
}
}