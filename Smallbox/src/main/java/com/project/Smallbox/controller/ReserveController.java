package com.project.Smallbox.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.sql.Time;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.Smallbox.service.MovieService;
import com.project.Smallbox.service.ReserveService;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.TheaterVO;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService service;
	
	// 예매 기본 페이지
	@GetMapping(value = "/Reserve.mv")
	public String reserve(HttpSession session, Model model) {
		
		List<MovieVO> movieList = service.getMovieList();
		
		model.addAttribute("movieList", movieList);
		
		return "reserve/reserve_view";
	}
	
	// Ajax로 상영 시간 값 불러오기
	@ResponseBody
	@GetMapping(value = "/ReserveSelectPro.mv")
	public void reservePro(@RequestParam String movie_title, @RequestParam String reserve_date, HttpServletResponse response) {
		
//		System.out.println("영화 제목: " + movie_title);
//		System.out.println("상영 날짜: " + reserve_date);
		
		// 가져온 영화 제목과 상영 날짜에 맞는 상영 시간 DB에서 불러오기
		List<TheaterVO> theaterList = service.getTheaterList(movie_title, reserve_date);
//		System.out.println("가져올 상영 시간: " + theaterList);
		
		// DB에서 가져온 상영 시간 값을 '시간'만 가져오기 위하여 List 분리 작업 필요
		List<Time> timeList = theaterList.stream().map(TheaterVO::getTheater_time).collect(Collectors.toList());
		
		response.setContentType("text/html; charset=UTF-8");
		
		// 작업 성공 시 선택한 영화 제목과 상영 날짜 값을 보여주고 상영 날짜도 for문을 활용하여 버튼으로 구현하도록 함
		try {
			PrintWriter out = response.getWriter();
			out.println("<h3>" + movie_title + "</h3>");
			out.println("<input type='hidden' name='movie_title' value='" + movie_title + "'>");
			out.println("<h3>" + reserve_date + "</h3>");
			out.println("<input type='hidden' name='reserved_date' value='" + reserve_date + "'>");
			for(int i = 0; i < timeList.size(); i++) {
				
					out.println("<input type='button' class='timeButton' value='" + timeList.get(i)+ "'onclick='change_btn(event)'><br><br>");
					
			}
			out.println(" <input type='hidden' name='selected_time' value=''>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@PostMapping(value = "/ReserveSeat.mv")
	public String reserveSeat() {
		
		
		
		return "reserve/reserve_seat";
	}
	
	
	
	
	
}
