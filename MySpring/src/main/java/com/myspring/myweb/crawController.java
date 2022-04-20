package com.myspring.myweb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class crawController {
	
	@RequestMapping("/craw_main")
	public String main() {
		return "craw_main";
	}
	@RequestMapping("/craw_select")
    @ResponseBody
    public Map<String,Object> craw_select(String user_id,HttpServletRequest req,HttpServletResponse resp)throws Exception {
        boolean result =false;
        user_id = "%EB%82%98%EB%A5%B4";
        String url = "https://www.op.gg/summoners/kr/" + user_id;
        Document doc =Jsoup.connect(url).get();
//        System.out.println(doc);
        
        Elements ele = doc.select("div.champion-box");
        System.out.println(ele.text());
        System.out.println(ele.select(".info div").text());
        System.out.println(ele.select(".kda div").text());
        System.out.println(ele.select(".played div").text());
        int chamLength = ele.size();
        System.out.println("div개수"+chamLength);
        
             
        
        List<String> NameResult = new ArrayList<>();
        List<String> PlayedResult = new ArrayList<>();
        NameResult.add(ele.select(".info div").text()); //챔피언 이름
        PlayedResult.add(ele.select(".played div").text());
        
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("NameResult", NameResult);
        resultMap.put("PlayedResult", PlayedResult);
            result =true;
        
//        PrintWriter writer = resp.getWriter();
//        resp.setCharacterEncoding("UTF-8"); 
//        resp.setContentType("text/html;charset=UTF-8");
//        writer.println(result);
        
        return resultMap;
	}
}
