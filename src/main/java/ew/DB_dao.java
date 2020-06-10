package ew;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.exceptions.MySQLNonTransientConnectionException;

public class DB_dao {
	Connection conn = null;
	DB_dao(){
		String URL="jdbc:mysql://rm-8vbs59143785dw9bgso.mysql.zhangbei.rds.aliyuncs.com:3306/english_data?useUnicode=true&characterEncoding=utf8";//数据库连接字符串，这里的deom为数据库名
	    String NAME="english_data";//登录名
	    String PASSWORD="ZONGHEshixi123";//密码
	    
	  //1.加载驱动
	    try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("未能成功加载驱动程序，请检查是否导入驱动程序！");
			e.printStackTrace();
		}
	    try {
	    	conn = DriverManager.getConnection(URL, NAME, PASSWORD);
		    System.out.println("获取数据库连接成功！");
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
	int get_max_id(String tablename) throws SQLException {
		String sql_select = "select max(id) from "+tablename;
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql_select);
		rs.next();
		return rs.getInt(1);
	}
	ResultSet select_user_info(String name) throws SQLException {
		String sql_search = "SELECT * from `user` where `username` = '"+name+"'";
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql_search);
		return rs;
	}
	ResultSet get_word(int id,int word_num,int page) throws SQLException {
		String sql_search = "SELECT * from "+id+"_wordtable where id>"+(word_num+(page-1)*10)+" and id<="+(word_num+page*10);
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql_search);
		return rs;
	}
	ResultSet wrong_word(int id,int page)throws SQLException{
		String sql_search = "select * from "+id+"_wrongtable where id>"+((page-1)*10)+" and id<="+(page*10);
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql_search);
		return rs;
	}
	ResultSet zhan_word(int id,int page)throws SQLException{
		String sql_search = "select * from "+id+"_zhantable where id>"+((page-1)*10)+" and id<="+(page*10);
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql_search);
		return rs;
	}
	ResultSet get_exam_word(int kind,int id,int num_per_day,int word_num) throws SQLException {
		String sql_search="";
		if(kind==0) {
			sql_search = "select * from "+id+"_wordtable where id>"+(word_num-num_per_day)+" and id <="+word_num+" order by rand()";
		}
		else if(kind==1) {
			sql_search = "select * from "+id+"_wrongtable ORDER BY weight";
		}
		else {
			sql_search = "select * from "+id+"_wordtable ORDER BY rand()";
		}
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql_search);
		return rs;
	}
	ResultSet get_random_word(int id) throws SQLException {
		String sql_search = " select * from "+id+"_wordtable order by rand() limit 1";
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql_search);
		return rs;
	}
	
	void delete(int id,String word) throws SQLException {
		Statement stmt=conn.createStatement();
		String sql_search = "select count(id) from "+id+"_zhantable";
		ResultSet rs = stmt.executeQuery(sql_search);
		rs.next();
		int inner_id=0;
		if(rs.getInt(1)==0) {
			inner_id=1;
		}
		else {
			sql_search = "select max(id) from "+id+"_zhantable";
			rs = stmt.executeQuery(sql_search);
			rs.next();
			inner_id = rs.getInt(1)+1;
		}
		String sql_insert = "insert into "+id+"_zhantable select * from "+id+"_wordtable where word='"+word+"'";
		String sql_set = "update "+id+"_zhantable set id="+inner_id+" where word='"+word+"'";
		stmt.executeUpdate(sql_insert);
		stmt.executeUpdate(sql_set);
		String sql_delete1 = "delete from "+id+"_wordtable where word='"+word+"'";
		String sql_delete2 = "delete from "+id+"_wrongtable where word='"+word+"'";
		stmt.executeUpdate(sql_delete1);
		stmt.executeUpdate(sql_delete2);
		
	}
	
	void undelete(int id,String plan,String word) throws SQLException {
		Statement stmt = conn.createStatement();
		String sql_delete = "delete from "+id+"_zhantable where word='"+word+"'";
		stmt.executeUpdate(sql_delete);
		String sql_insert = "insert into "+id+"_wordtable select * from "+plan+" where word='"+word+"'";
		stmt.executeUpdate(sql_insert);
	}
	
	//加入错词本
	void insert_word(int id,String word) throws SQLException{
		Statement stmt=conn.createStatement();
		String sql_search = "select count(id) from "+id+"_wrongtable";
		ResultSet rs = stmt.executeQuery(sql_search);
		rs.next();
		int inner_id=0;
		if(rs.getInt(1)==0) {
			inner_id=1;
		}
		else {
			sql_search = "select max(id) from "+id+"_wrongtable";
			rs = stmt.executeQuery(sql_search);
			rs.next();
			inner_id = rs.getInt(1)+1;
		}
		sql_search = "select *from "+id+"_wrongtable where word='"+word+"'";
	    String sql_insert = "insert into "+id+"_wrongtable select *,3 from "+id+"_wordtable where word='"+word+"'";
		rs=stmt.executeQuery(sql_search);
		if(!rs.next()) {
			stmt.executeUpdate(sql_insert);
			String sql_set = "update "+id+"_wrongtable set id="+inner_id+" where word='"+word+"'";
			stmt.executeUpdate(sql_set);
		}
		else {
			int weight = rs.getInt("weight")+1;
			String sql_set = "update "+id+"_wrongtable set weight="+weight+" where word='"+word+"'";
			stmt.executeUpdate(sql_set);
		}
	}
	
	//从错词本中移除
	void uninsert_word(int id,String word) throws SQLException {
		String sql_search = "select * from "+id+"_wrongtable where word ='"+word+"'";
	    Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql_search);
		if(rs.next()) {
			int weight= rs.getInt("weight");
			if(weight==1) {
				String sql_delete = "delete from "+id+"_wrongtable where word ='"+word+"'";
				stmt.executeUpdate(sql_delete);
			}
			String sql_set = "update "+id+"_wrongtable set weight="+(weight-1)+" where word='"+word+"'";
			stmt.executeUpdate(sql_set);
		}
	}
	
	void plan_settings(int id,int num_per_day) throws SQLException {
		String setting = "update user set num_per_day="+num_per_day+" where id="+id;
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(setting);
		}catch(SQLException e) {
			throw e;
		}	
	}
	
	void plan_settings_entire(int id,String plan,int num_per_day) throws SQLException {
		String setting1 = "update user set plan='"+plan+"',num_per_day="+num_per_day+",day_num=0,word_num=0 where id="+id;
		String setting2 = "delete from "+id+"_wordtable";
		String setting3 = "delete from "+id+"_wrongtable";
		String setting4 = "delete from "+id+"_zhantable";
		String setting5 = "insert into "+id+"_wordtable select * from "+plan;
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(setting1);
			stmt.executeUpdate(setting2);
			stmt.executeUpdate(setting3);
			stmt.executeUpdate(setting4);
			stmt.executeUpdate(setting5);
		}catch(SQLException e) {
			throw e;
		}	
	}

	void finish_study(int id,int word_num,int day_num) throws SQLException {
		String sql_set = "update user set word_num="+word_num+",day_num="+day_num+" where id="+id;
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql_set);
	}
	
	boolean register_insert(String name,String password,String email) throws SQLException {

		int wrong_num=0;
		while(true) {
			try {
				String sql_insert="insert into `user`(`username`,`emailaddress`,`password`,`plan`,`num_per_day`,`day_num`,`word_num`,`rank`,`ranktag`) values(?,?,?,?,?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(sql_insert);
				pst.setString(1, name);
				pst.setString(2, email);
				pst.setString(3, password);
				pst.setString(4, "none");
				pst.setInt(5, 0);
				pst.setInt(6, 0);
				pst.setInt(7, 0);
				pst.setInt(8, 500);
				pst.setInt(9, 1);
				if(pst.executeUpdate()!=1) {
					return false;
				}
				else {
					ResultSet rs = select_user_info(name);
					rs.next();
					String id = rs.getString("id");
					Statement stmt = conn.createStatement();
					//建立用户单词表
				    String create_sql1 = "create table if not exists "+id+"_wordtable(\r\n" + 
				    		"id int primary key,\r\n" + 
				    		"word varchar(255),\r\n" + 
				    		"pronounce varchar(255),\r\n" + 
				    		"meaning varchar(255),\r\n" + 
				    		"sentence varchar(1000),\r\n" + 
				    		"transformation varchar(255)\r\n" + 
				    		")CHARACTER SET utf8 COLLATE utf8_general_ci;";		    		
				    stmt.execute(create_sql1);
				    //建立用户错词表
				    String create_sql2 = "create table if not exists "+id+"_wrongtable(\r\n" + 
				    		"id int ,\r\n" + 
				    		"word varchar(255),\r\n" + 
				    		"pronounce varchar(255),\r\n" + 
				    		"meaning varchar(255),\r\n" + 
				    		"sentence varchar(1000),\r\n" + 
				    		"transformation varchar(255),\r\n" + 
				    		"weight int \r\n" +
				    		")CHARACTER SET utf8 COLLATE utf8_general_ci;";
				    stmt.execute(create_sql2);
				  //建立用户斩词表
				    String create_sql3 = "create table if not exists "+id+"_zhantable(\r\n" + 
				    		"id int ,\r\n" + 
				    		"word varchar(255) primary key,\r\n" + 
				    		"pronounce varchar(255),\r\n" + 
				    		"meaning varchar(255),\r\n" + 
				    		"sentence varchar(1000),\r\n" + 
				    		"transformation varchar(255)\r\n" + 
				    		")CHARACTER SET utf8 COLLATE utf8_general_ci;";
				    stmt.execute(create_sql3);
				    return true;
				}
			}catch(SQLException e) {
				throw e;
			}
		}
	}
}
