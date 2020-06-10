package ew;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Handle_word {

	String random_string(String str) {
		StringBuilder re = new StringBuilder(str);
		int length = str.length();
		int half_length = length/2;
		Random r = new Random();
		List<Integer> list = new ArrayList<Integer>();
		for(int i=0;i<half_length;i++) {
			int a = r.nextInt(length);
			while(list.contains(a)) {
				a = r.nextInt(length);
			}
			list.add(a);
			int x = r.nextInt(26)+97;
			re.setCharAt(a, (char)x);
		}
		return re.toString();
	}
	
	String random_split(String str) {
		StringBuilder re = new StringBuilder(str);
		int length = str.length();
		int half_length = length/2;
		Random r = new Random();
		int a =r.nextInt(length-half_length)+1;
		String split_string = str.substring(a,a+half_length);
		for(int i=a;i<a+half_length;i++) {
			re.setCharAt(i, '_');
		}
		return re.toString()+" "+split_string;
	}
}
