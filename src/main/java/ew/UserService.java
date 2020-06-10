package ew;

import java.sql.ResultSet;

public interface UserService {
	String login(String name,String password);
	String register(String name,String password,String email);
	User_info get_user_info(String name);
	ResultSet get_word(int id,int word_num,int page);
	ResultSet get_wrong_word(int id,int page_action);
	ResultSet get_zhan_word(int id,int page_action);
	ResultSet get_exam_word(int kind,int id,int num_per_day,int word_num);
	ResultSet get_random_word(int id);
	boolean delete(int id,String word);
	boolean undelete(int id,String plan,String word);
	boolean insert_word(int id,String word);
	boolean uninsert_word(int id,String word);
	boolean plan_setting(String sign,int id,String plan,int num_per_day);
	boolean finish_study(int id,int word_num,int day_num);
	int get_max_id(String tablename);
}
