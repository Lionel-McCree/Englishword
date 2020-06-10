package ew;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.stereotype.Service;



@Service
public class us implements UserService {
	
	DB_dao db_dao;
	us(){
		db_dao = new DB_dao();
	}

	@Override
	public String login(String name, String password) {
		int num=0;
		while(true) {
			num++;
			try {
				ResultSet rs = db_dao.select_user_info(name);
				if(!rs.next()) {
					return "用户不存在";
				}
				else {
					if(rs.getString("password").equals(password)) {
						return "success";
					}
					else return "密码错误，请重新输入";
				}
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return "数据库出现问题，给您带来不便请谅解";
			}
		}
		
	}
	
	@Override
	public String register(String name,String password,String email) {
		int num=0;
		while(true) {
			try {
				ResultSet rs = db_dao.select_user_info(name);
				if(!rs.next()) {
					if(db_dao.register_insert(name, password, email)) {				
						return "success";
					}
					else {
						db_dao = new DB_dao();
						return "数据库出现问题，给您带来不便请谅解";
					}
				}
				else {
					return "用户名已存在，请重新输入";
				}
			} catch (SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}			
				else return "数据库出现问题，给您带来不便请谅解";
			}
		}
		
	}
	
	@Override
	public User_info get_user_info(String username) {
		int num=0;
		while(true) {
			num++;
			try {
				User_info User_info = new User_info(db_dao,username);
				return User_info;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return null;
			}
		}
	}
	
	@Override
	public ResultSet get_word(int id,int word_num,int page) {
		int num=0;
		while(true) {
			num++;
			try {
				ResultSet rs= db_dao.get_word(id, word_num, page);
				return rs;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return null;
			}
		}
	}
	
	@Override
	public ResultSet get_wrong_word(int id,int page_action) {
		int num=0;
		while(true) {
			num++;
			try {
				ResultSet rs= db_dao.wrong_word(id, page_action);
				return rs;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return null;
			}
		}
	}
	
	@Override
	public ResultSet get_zhan_word(int id,int page_action) {
		int num=0;
		while(true) {
			num++;
			try {
				ResultSet rs= db_dao.zhan_word(id, page_action);
				return rs;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return null;
			}
		}
	}

	@Override
	public boolean delete(int id,String word) {
		int num=0;
		while(true) {
			num++;
			try {
				db_dao.delete(id, word);
				return true;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return false;
			}
		}
	}
	
	@Override
	public boolean undelete(int id, String plan, String word) {
		int num=0;
		while(true) {
			num++;
			try {
				db_dao.undelete(id, plan, word);
				return true;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return false;
			}
		}
	}
	
	@Override
	public boolean insert_word(int id,String word) {
		int num=0;
		while(true) {
			num++;
			try {
				db_dao.insert_word(id, word);
				return true;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return false;
			}
		}
	}
	
	@Override
	public boolean uninsert_word(int id,String word) {
		int num=0;
		while(true) {
			num++;
			try {
				db_dao.uninsert_word(id, word);
				return true;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return false;
			}
		}
	}
	
	@Override
	public boolean plan_setting(String sign,int id,String plan,int num_per_day) {
		int num=0;
		while(true) {
			num++;
			try {
				if(sign.equals("t")) {
					db_dao.plan_settings_entire(id, plan, num_per_day);
				}
				else {
					db_dao.plan_settings(id, num_per_day);
				}
				return true;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return false;
			}
		}
	}

	@Override
	public boolean finish_study(int id, int word_num, int day_num) {
		int num=0;
		while(true) {
			num++;
			try {
				db_dao.finish_study(id, word_num, day_num);
				return true;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return false;
			}
		}
	}
	
	@Override
	public ResultSet get_exam_word(int kind,int id,int num_per_day,int word_num) {
		int num=0;
		while(true) {
			num++;
			try {
				ResultSet rs= db_dao.get_exam_word(kind, id, num_per_day, word_num);
				return rs;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return null;
			}
		}
	}
	
	@Override
	public ResultSet get_random_word(int id) {
		int num=0;
		while(true) {
			num++;
			try {
				ResultSet rs= db_dao.get_random_word(id);
				return rs;
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return null;
			}
		}
	}

	@Override
	public int get_max_id(String tablename) {
		int num=0;
		while(true) {
			num++;
			try {
				return db_dao.get_max_id(tablename);
			}catch(SQLException e) {
				if(num<3) {
					e.printStackTrace();
					db_dao = new DB_dao();
					continue;
				}
				else return 0;
			}
		}
	}


}
