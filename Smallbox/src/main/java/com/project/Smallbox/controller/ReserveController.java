package com.project.Smallbox.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.Smallbox.service.ReserveService;
import com.project.Smallbox.vo.CouponVO;
import com.project.Smallbox.vo.MovieVO;
import com.project.Smallbox.vo.ReserveVO;
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
	
//	@PostMapping(value = "/ReserveSeat.mv")
//	public String reserveSeat() {
//		
//		
//		
//		return "reserve/reserve_seat";
//	}
	
	// ==========================================해연 추가한곳 ==========================================
		//--------------------------------------->> 좌석 창 출력
		@PostMapping(value = "/ReserveSeat.mv")
		public String reserveSeat(@RequestParam String session_id, 
												@RequestParam String movie_title, 
												@RequestParam String reserved_date, 
												@RequestParam String selected_time, 
												@ModelAttribute TheaterVO theater, 
												@ModelAttribute ReserveVO reserve, 
												Model model
												) {
			System.out.println("reserve seeat Pro action의 session id : " + session_id);
			System.out.println("reserve seeat Pro action의 theater_title : " + movie_title);
			System.out.println("reserve seeat Pro action의 theater_date : " + reserved_date);
			System.out.println("reserve seeat Pro action의 theater_time : " + selected_time);
			
			//theater_idx 조회하기
			theater.setTheater_title(movie_title);
			theater.setTheater_date(Date.valueOf(reserved_date));
			theater.setTheater_time(Time.valueOf(selected_time));
			
			int theater_idx = service.getTheaterIdx(theater);
			System.out.println("return 받은 theater_idx : " + theater_idx);
			
			//리턴 받은 theater_idx사용해서 이미 예약 된 좌석번호 조회
			reserve.setTheater_idx(theater_idx);
			reserve.setRes_date(Date.valueOf(reserved_date));
			reserve.setRes_time(Time.valueOf(selected_time));
			reserve.setTheater_title(movie_title);
			
			List<String> reservedList = service.getReservedSeatList(reserve);
			System.out.println("reserved list : " + reservedList);
			
			model.addAttribute("theater_idx", theater_idx);
			
			String selectedSeatList = String.join(",", reservedList);
			System.out.println("selected Seat List : " + selectedSeatList);
			model.addAttribute("selectedSeatList", selectedSeatList);

			return "reserve/reserve_seat";
		}
		
	//--------------------------------------->> 결제 창 출력	
		@PostMapping(value = "/ReservePayment.mv")
		public String payment() {
			System.out.println("controller : ReservePayment.mv");
			
			return "reserve/reserve_payment";
		}
		
	//--------------------------------------->> 쿠폰 창 출력
		@GetMapping(value = "ReserveCheckCoupon.mv")
		public String checkCoupon(@RequestParam String sId, 
													Model model) {
			System.out.println("reserve check coupon의 sessionid : " + sId); //잘 넘어옴
			
			//쿠폰 조회
			List<CouponVO> couponList = service.getCouponList(sId);
			model.addAttribute("couponList", couponList);
			System.out.println("pro action의 쿠폰리스트 : " + couponList);
			
			return "reserve/couponList";
		}
		
	//--------------------------------------->> 결제 처리
		@PostMapping(value = "ReservePaymentPro.mv")
		public String paymentPro(@RequestParam String theater_idx, 
												@RequestParam String theater_title, 
												@RequestParam String member_id, 
												@RequestParam String res_date, 
												@RequestParam String res_time, 
												@RequestParam String res_seat, 
												@RequestParam String res_price, 
												@RequestParam String coupon_idx, 
												@ModelAttribute ReserveVO reserve,
												Model model
				) {
			int theaterIdx = Integer.parseInt(theater_idx);
			Date resDate = Date.valueOf(res_date);
			Time resTime = Time.valueOf(res_time);
			int resPrice = Integer.parseInt(res_price);
			int couponIdx = Integer.parseInt(coupon_idx);
			//좌석 뺼 때 사람 수
			int people = 0;
			
			System.out.println("theater_idx : " + theaterIdx + ", theater_title : " + theater_title + ", member_id : " + member_id + ", res_date : " + resDate);
			System.out.println("res_time : " + resTime + ", res_seat : " + res_seat + ", res_price : " + resPrice + ", coupon_idx : " + couponIdx);
			
			String [] arrSeat = res_seat.split(",");
//			확인용
			for(int i =0; i<arrSeat.length; i++){
			System.out.println(arrSeat[i]);
			}
			System.out.println("arrSeat.length : " + arrSeat.length);
//			최대 4놈까지만 예약 가능, 1번째 예약자
			reserve.setTheater_idx(theaterIdx);
			reserve.setTheater_title(theater_title);
			reserve.setMember_id(member_id);
			reserve.setRes_date(resDate);
			reserve.setRes_time(resTime);
			reserve.setRes_price(resPrice);
		
			String resSeat = arrSeat[0];
			reserve.setRes_seat(resSeat);
			
			String changedDate = res_date.replace("-", "");
			System.out.println("changed date : " + changedDate);
			
			String res_num = changedDate +  resSeat + theater_idx ;
			System.out.println("reserve num : " + res_num);
			reserve.setRes_num(res_num);
			
			System.out.println("reserve payment Pro 의 reserve :  " + reserve);
			boolean isResSuccess = service.reserveAndPayment(reserve);
			System.out.println("isReserveSuccess: " + isResSuccess);
			people = 1;
			
			//예약 : 2
			if(arrSeat.length == 2) {
				reserve.setTheater_idx(theaterIdx);
				reserve.setTheater_title(theater_title);
				reserve.setMember_id(member_id);
				reserve.setRes_date(resDate);
				reserve.setRes_time(resTime);
				reserve.setRes_price(resPrice);
				
				resSeat = arrSeat[1];
				reserve.setRes_seat(resSeat);
			
				res_num = changedDate +  resSeat + theater_idx ;
				System.out.println("2번째 reserve num : " + res_num);
				reserve.setRes_num(res_num);
				
				System.out.println("reserve payment Pro 2번째 멤버의 reserve :  " + reserve);
				
				boolean isResSuccess2 = service.reserveAndPayment(reserve);
				System.out.println("pro action의 isReserveSuccess2: " + isResSuccess2);
				people = 2;
				System.out.println("2 ? " + people);
				
				//예약 : 3
				} else if(arrSeat.length == 3) {
					for(int i = 1; i <3; i++) {
						reserve.setTheater_idx(theaterIdx);
						reserve.setTheater_title(theater_title);
						reserve.setMember_id(member_id);
						reserve.setRes_date(resDate);
						reserve.setRes_time(resTime);
						reserve.setRes_price(resPrice);
						
						resSeat = arrSeat[i];
						reserve.setRes_seat(resSeat);
					
						res_num = changedDate +  resSeat + theater_idx ;
						System.out.println("reserve num : " + res_num);
						reserve.setRes_num(res_num);
						
						System.out.println("reserve payment Pro 의 reserve :  " + reserve);
						
						if(i==1) {
							Boolean isReserveSuccess2 = service.reserveAndPayment(reserve);
							System.out.println("pro action의 isReserveSuccess2: " + isReserveSuccess2);
						} else if(i==2) {
							Boolean isReserveSuccess3 = service.reserveAndPayment(reserve);
							System.out.println("pro action의 isReserveSuccess3: " + isReserveSuccess3);
							people = 3;
							System.out.println("3 ? " + people);
						}
					} //3일 떄 for end
			
				//예약인원 : 4
				} else if(arrSeat.length == 4) {
					for(int i = 1; i <4; i++) {
						reserve.setTheater_idx(theaterIdx);
						reserve.setTheater_title(theater_title);
						reserve.setMember_id(member_id);
						reserve.setRes_date(resDate);
						reserve.setRes_time(resTime);
						reserve.setRes_price(resPrice);
						
						resSeat = arrSeat[i];
						reserve.setRes_seat(resSeat);
					
						res_num = changedDate +  resSeat + theater_idx ;
						System.out.println("reserve num : " + res_num);
						reserve.setRes_num(res_num);
						
						System.out.println("reserve payment Pro action의 reserve :  " + reserve);
						
						if(i==1) {
							Boolean isReserveSuccess2 = service.reserveAndPayment(reserve);
							System.out.println("pro action의 isReserveSuccess2: " + isReserveSuccess2);
						} else if(i==2) {
							Boolean isReserveSuccess3 = service.reserveAndPayment(reserve);
							System.out.println("pro action의 isReserveSuccess3: " + isReserveSuccess3);
							
						} else if(i==3) {
							Boolean isReserveSuccess4 = service.reserveAndPayment(reserve);
							System.out.println("pro action의 isReserveSuccess3: " + isReserveSuccess4);
							people = 4;
							System.out.println("4 ? " + people);
						}
					} //4일 떄 for end
				} // insert reserve 끝
				
//			극장 번호 조회 후 최대인원 -1
			boolean isSubtractSeatSuccess = service.substractSeat(theater_idx, people);
//			사용한 쿠폰 삭제 (쿠폰번호 0 = 쿠폰안씀)
			if(couponIdx != 0 ) { //만약 쿠폰 썼다면
				boolean isDelCpSuccess = service.deleteCoupon(couponIdx);
			} // 쿠폰 삭제.
			
			model.addAttribute("res_num", res_num);
			
			return "ReservePaymentApi.mv";
		}
		// =========================================해연 추가한곳 끝 =========================================
	
	
	
}
