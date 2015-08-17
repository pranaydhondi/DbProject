package login;

public class Data implements Comparable<Data>{
	public String email;
	public String url;
	public String profilefor;
	public String name;
	public String age;
	public String height;
	public String religion;
	public String zodiac;
	public String location;
	public String accept="";
	public int percent;
	
	public Data(){
		
	}
	public int compareTo(Data comparestu) {
		 int comp=((Data)comparestu).percent;
		 return comp-this.percent;
		
	}
}