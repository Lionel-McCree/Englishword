package ew;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class User_info {
	User_info(DB_dao db_dao,String username) throws SQLException{
		ResultSet rs = db_dao.select_user_info(username);
		rs.next();
		this.id=rs.getInt("id");
		this.plan=rs.getString("plan");
		this.num_per_day=rs.getInt("num_per_day");
		this.day_num=rs.getInt("day_num");
		this.word_num=rs.getInt("word_num");
		this.rank=rs.getInt("rank");
		this.wrong_num=db_dao.get_max_id(this.id+"_wrongtable");
		this.zhan_num=db_dao.get_max_id(this.id+"_zhantable");
		this.ranktag=rs.getInt("ranktag");
	}
	int get_id() {
		return id;
	}
	String get_plan() {
		return plan;
	}
	int get_num_per_day() {
		return num_per_day;
	}
	int get_day_num() {
		return day_num;
	}
	int get_word_num() {
		return word_num;
	}
	int get_rank() {
		return rank;
	}
	int get_wrong_num() {
		return wrong_num;
	}
	int get_zhan_num() {
		return zhan_num;
	}
	int get_ranktag() {
		return ranktag;
	}
	
	
	void set_plan(String plan) {
		this.plan=plan;
	}
	
	void set_num_per_day(int num_per_day) {
		this.num_per_day=num_per_day;
	}
	
	void set_day_num(int day_num) {
		this.day_num=day_num;
	}
	
	void set_word_num(int word_num) {
		this.word_num=word_num;
	}
	void set_wrong_num(int wrong_num) {
		this.wrong_num=wrong_num;
	}
	void set_zhan_num(int zhan_num) {
		this.zhan_num=zhan_num;
	}
	void set_ranktag(int ranktag) {
		this.ranktag=ranktag;
	}
    String plan;
    private int id,num_per_day,day_num,word_num,rank,wrong_num,zhan_num,ranktag;
}
