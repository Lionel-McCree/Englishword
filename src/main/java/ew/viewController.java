package ew;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class viewController {
	
	
	@Autowired
	public UserService userService;
	
	
	
	
	@RequestMapping("/fight")
	String fight() {
		return "learning_window/fight.jsp";
	}
	@RequestMapping("/test")
	String testui() {
		return "learning_window/index.jsp";
	}
	
	@RequestMapping("/test_fun")
	@ResponseBody
	String te(HttpSession session) {
		int id=(Integer) session.getAttribute("id");
		return id+"";
	}
	
	@RequestMapping("/testfunction")
	@ResponseBody
	boolean testfunction(int id,String word,HttpSession session) {
//		int page = Integer.parseInt(req.getParameter("page"));
//		String plan = (String) session.getAttribute("plan");
//		int word_num = (Integer) session.getAttribute("word_num");
//		ResultSet word_list = userService.get_word(plan, word_num, page);

		String plan = (String) session.getAttribute("plan");
		session.setAttribute("day_num", 10);
		
		System.out.println((Integer)session.getAttribute("day_num"));
		userService.delete(id, word);
		return true;
	}
	
	@RequestMapping("/finish_exam")
	@ResponseBody
	boolean finish_exam(String correct,String wrong,HttpSession session) {
		int id = (Integer)session.getAttribute("id");
		if(!correct.equals("")) {
			String correct_list[]=correct.split(",");
			for(String word:correct_list) {
				userService.uninsert_word(id, word);
			}
		}
		if(!wrong.equals("")) {
			String wrong_list[]=wrong.split(",");
			for(String word:wrong_list) {
				userService.insert_word(id, word);
			}
		}
		User_info ui = (User_info)session.getAttribute("user_info");
		ui.set_zhan_num(userService.get_max_id(id+"_zhantable"));
		ui.set_wrong_num(userService.get_max_id(id+"_wrongtable"));
		session.setAttribute("user_info", ui);
		session.setAttribute("zhan_num", ui.get_zhan_num());
		session.setAttribute("wrong_num", ui.get_wrong_num());
		return false;
	}
	
	@RequestMapping("/exam")
	@ResponseBody
	String exam(int kind,HttpSession session) throws SQLException {
//		System.out.println("测试");
		int id = (Integer)session.getAttribute("id");
		int num_per_day = (Integer)session.getAttribute("num_per_day");
		int word_num = (Integer)session.getAttribute("word_num");
		ResultSet rs = userService.get_exam_word(kind, id, num_per_day, word_num);
		Handle_word h = new Handle_word();
		int num = 0;
		List<Map>  result = new ArrayList<Map>();
		Random r = new Random();
		while(rs.next()&&num<20) {
			String word = rs.getString("word");
			//System.out.println(word);
			String pronounce = rs.getString("pronounce");
			String meaning =  rs.getString("meaning");
			int k = r.nextInt(3);
			if(word.length()<4) {
				while(k==1) {
					k = r.nextInt(3);
				}
			}
			if(k==0) {
				List<String> answer = new ArrayList<String>();
				Map<String,Object> map = new HashMap<String,Object>();
				for(int i=0;i<3;i++) {
					ResultSet randomrs = userService.get_random_word(id);
					randomrs.next();
					answer.add(randomrs.getString("meaning"));
				}
				int correctAnswer = r.nextInt(4)+1;
				answer.add(correctAnswer-1,meaning);
				JSONArray ja1 = JSONArray.fromObject(answer);
				map.put("answers",ja1);
				map.put("question",word+" "+pronounce);
				map.put("correctAnswer",correctAnswer);
				map.put("kind",k);
				map.put("word",word);
				Map<String,Object> map1 = map;
				result.add(map1);
			}
			else if(k==1) {
				List<String> answer = new ArrayList<String>();
				Map<String,Object> map = new HashMap<String,Object>();
				String temp = h.random_split(word);
				for(int i=0;i<3;i++) {
					answer.add(h.random_string(temp.split("\\s+")[1]));
				}
				int correctAnswer = r.nextInt(4)+1;
				answer.add(correctAnswer-1,temp.split("\\s+")[1]);
				JSONArray ja1 = JSONArray.fromObject(answer);
				map.put("answers",ja1);
				map.put("question",temp.split("\\s+")[0]+" "+meaning);
				map.put("correctAnswer",correctAnswer);
				map.put("kind",k);
				map.put("word",word);
				Map<String,Object> map1 = map;
				result.add(map1);
			}
			else if(k==2) {
				List<String> answer = new ArrayList<String>();
				Map<String,Object> map = new HashMap<String,Object>();
				for(int i=0;i<3;i++) {
					ResultSet randomrs = userService.get_random_word(id);
					randomrs.next();
					answer.add(randomrs.getString("meaning"));
				}
				int correctAnswer = r.nextInt(4)+1;
				answer.add(correctAnswer-1,meaning);
				JSONArray ja1 = JSONArray.fromObject(answer);
				map.put("answers",ja1);
				map.put("question","听发音选择正确的词汇");
				map.put("correctAnswer",correctAnswer);
				map.put("kind",k);
				map.put("word",word);
				Map<String,Object> map1 = map;
				result.add(map1);
			}
			num++;
		}
		JSONArray ja2 = JSONArray.fromObject(result);
		JSONObject jo = new JSONObject();
		jo.put("questions",ja2);
		//System.out.println(jo.toString());
		String data = jo.toString();
		return data;
	}
	
	
	@RequestMapping("/finish_study")
	@ResponseBody
	boolean finish(HttpSession session) {
		int id = (Integer)session.getAttribute("id");
		int word_num = (Integer)session.getAttribute("word_num");
		int num_per_day = (Integer)session.getAttribute("num_per_day");
		int day_num = (Integer)session.getAttribute("day_num");
		word_num += num_per_day;
		day_num++;
		boolean result = userService.finish_study(id, word_num, day_num);
		User_info ui = (User_info)session.getAttribute("user_info");
		ui.set_word_num(word_num);
		ui.set_day_num(day_num);
		session.setAttribute("user_info", ui);
		session.setAttribute("word_num", word_num);
		session.setAttribute("day_num", day_num);
		session.setAttribute("question", "not_none");
		return result;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	boolean delete(String word,HttpSession session) {
		int id = (Integer) session.getAttribute("id");
		boolean result = userService.delete(id, word);
		User_info ui = (User_info)session.getAttribute("user_info");
		ui.set_zhan_num(userService.get_max_id(id+"_zhantable"));
		ui.set_wrong_num(userService.get_max_id(id+"_wrongtable"));
		session.setAttribute("user_info", ui);
		session.setAttribute("zhan_num", ui.get_zhan_num());
		session.setAttribute("wrong_num", ui.get_wrong_num());
		//System.out.println("斩词"+id+word);
		return result;
	}
	
	@RequestMapping("/undelete")
	@ResponseBody
	boolean undelete(String word,HttpSession session) {
		int id = (Integer) session.getAttribute("id");
		String plan = (String)session.getAttribute("plan");
		boolean result = userService.undelete(id, plan, word);
		User_info ui = (User_info)session.getAttribute("user_info");
		ui.set_zhan_num(userService.get_max_id(id+"_zhantable"));
		session.setAttribute("user_info", ui);
		session.setAttribute("zhan_num", ui.get_zhan_num());
		//System.out.println("恢复斩词"+id+word);
		return result;
	}
	
	
	@RequestMapping("/insert")
	@ResponseBody
	boolean insert(String word,HttpSession session) {
		int id = (Integer) session.getAttribute("id");
		boolean result = userService.insert_word(id, word);
		User_info ui = (User_info)session.getAttribute("user_info");
		ui.set_wrong_num(userService.get_max_id(id+"_wrongtable"));
		session.setAttribute("user_info", ui);
		session.setAttribute("wrong_num", ui.get_wrong_num());
		return result;
	}
	
	
	@RequestMapping("/plan_settings")
	@ResponseBody
	boolean plan_settings(String sign,String plan ,int num_per_day,HttpSession session) {
		int id = (Integer) session.getAttribute("id");
		boolean result = userService.plan_setting(sign, id, plan, num_per_day);
		User_info ui = (User_info)session.getAttribute("user_info");
		if(sign.equals("t")) {
			ui.set_plan(plan);
			ui.set_num_per_day(num_per_day);
			ui.set_day_num(0);
			ui.set_word_num(0);
			session.setAttribute("user_info", ui);
			session.setAttribute("plan", plan);
			session.setAttribute("num_per_day", num_per_day);
			session.setAttribute("day_num", 0);
			session.setAttribute("word_num", 0);
		}
		else {
			ui.set_num_per_day(num_per_day);
			session.setAttribute("user_info",ui);
			session.setAttribute("num_per_day", num_per_day);
		}
		return result;
	}
	
	
	@RequestMapping("/main")
	String mainui() {
		return "login_register/login_register.jsp";
	}
	
	@RequestMapping("/login")
    String login(HttpServletRequest req,HttpSession session) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String return_result=userService.login(username, password);
        if(return_result.equals("success")) {
        	session.setAttribute("username", username);
        	User_info user_info = userService.get_user_info(username);
        	if(user_info!=null) {
        		session.setAttribute("user_info", user_info);
        		session.setAttribute("id", user_info.get_id());
        		session.setAttribute("plan", user_info.get_plan());
        		session.setAttribute("num_per_day", user_info.get_num_per_day());
        		session.setAttribute("day_num", user_info.get_day_num());
        		session.setAttribute("word_num", user_info.get_word_num());
        		session.setAttribute("rank", user_info.get_rank());
        		session.setAttribute("wrong_num", user_info.get_wrong_num());
        		session.setAttribute("zhan_num", user_info.get_zhan_num());
        		session.setAttribute("question", "none");
        		session.setAttribute("ranktag", user_info.get_ranktag());
        		
        		//测试json
//        		Map<String,String> m;
//        		List<Map> list = new ArrayList<Map>();
//        		m = new HashMap<String,String>();
//        		m.put("word","234");
//        		m.put("meaning","鸡你太美");
//        		list.add(m);
//        		m = new HashMap<String,String>();
//        		m.put("word","456");
//        		m.put("meaning","嘤嘤嘤");
//        		list.add(m);
//        		JSONArray ja=JSONArray.fromObject(list);
//        		String data = ja.toString();
//        		session.setAttribute("data", data);
        		
        		//测试
        		
        	}
        	else {
        		req.setAttribute("error", "数据库出现问题，给您带来不便请谅解");
    			return "login_register/login_fail.jsp";
        	}
        	return "user_main.jsp";
        }
        else {
        	req.setAttribute("error", return_result);
			return "login_register/login_fail.jsp";
        }
    }
	
	@RequestMapping("/register")
    String register(HttpServletRequest req) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String return_result=userService.register(username, password, email);
		if(return_result.equals("success")) {
			return "login_register/register_success.jsp";
		}
		else {
			req.setAttribute("error", return_result);
			return "login_register/register_fail.jsp";
		}
        
	}
	
	@RequestMapping("/plan_choice")
	String plan_choice() {
		return "learning_window/plan_choice.jsp";
	}
	
	@RequestMapping("/dictionary")
	String dictionary() {
		return "learning_window/dictionary.jsp";
	}
	
	@RequestMapping("/learning_word")
	String learning_word() {
		return "learning_window/learning_word.jsp";
	}
	
	@RequestMapping("/wronglist")
	String wrong_word() {
		return "learning_window/wrong_word_list.jsp";
	}
	
	@RequestMapping("/zhanlist")
	String zhan_word() {
		return "learning_window/zhan_word_list.jsp";
	}
	
	@RequestMapping("/ability_check")
	String select_check() {
		return "learning_window/ability_check.jsp";
	}
	
	@RequestMapping("/check")
	String check() {
		return "learning_window/check.jsp";
	}
	
	@RequestMapping("/word_list")
	@ResponseBody
	String word_list(int page_action,HttpSession session) throws SQLException {
		
		int id = (Integer) session.getAttribute("id");
		int word_num = (Integer) session.getAttribute("word_num");
//		System.out.println("查询词汇"+id+" "+word_num+" "+page_action);
		ResultSet word_list = userService.get_word(id, word_num, page_action);

		Map<String,String> m;
		List<Map> list = new ArrayList<Map>();

		while(word_list.next()) {
			m = new HashMap<String,String>();
			String word = word_list.getString("word");
			String pronounce = word_list.getString("pronounce");
			String meaning = word_list.getString("meaning");
			m.put("word",word);
			m.put("pronounce",pronounce);
			m.put("meaning",meaning);
			list.add(m);
		}
		
		JSONArray ja=JSONArray.fromObject(list);
		String data = ja.toString();
		return data;
	}
	
	@RequestMapping("/wrong_word_list")
	@ResponseBody
	String wrong_word_list(int page_action,HttpSession session) throws SQLException {
		
		int id = (Integer) session.getAttribute("id");
		int word_num = (Integer) session.getAttribute("word_num");
//		System.out.println("查询词汇"+id+" "+word_num+" "+page_action);
		ResultSet word_list = userService.get_wrong_word(id, page_action);

		Map<String,String> m;
		List<Map> list = new ArrayList<Map>();
		while(word_list.next()) {
			m = new HashMap<String,String>();
			m.put("word",word_list.getString("word"));
			m.put("pronounce",word_list.getString("pronounce"));
			m.put("meaning",word_list.getString("meaning"));
			list.add(m);
		}
		JSONArray ja=JSONArray.fromObject(list);
		String data = ja.toString();
		return data;
	}
	
	@RequestMapping("/zhan_word_list")
	@ResponseBody
	String wrong_zhan_list(int page_action,HttpSession session) throws SQLException {
		
		int id = (Integer) session.getAttribute("id");
		int word_num = (Integer) session.getAttribute("word_num");
//		System.out.println("查询词汇"+id+" "+word_num+" "+page_action);
		ResultSet word_list = userService.get_zhan_word(id, page_action);

		Map<String,String> m;
		List<Map> list = new ArrayList<Map>();
		while(word_list.next()) {
			m = new HashMap<String,String>();
			m.put("word",word_list.getString("word"));
			m.put("pronounce",word_list.getString("pronounce"));
			m.put("meaning",word_list.getString("meaning"));
			list.add(m);
		}
		JSONArray ja=JSONArray.fromObject(list);
		String data = ja.toString();
		return data;
	}
}
