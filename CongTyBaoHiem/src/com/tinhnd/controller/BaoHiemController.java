package com.tinhnd.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tinhnd.common.SendMail;
import com.tinhnd.common.VerifyRecaptcha;
import com.tinhnd.model.BaoHiemBEAN;
import com.tinhnd.model.HoSoTaiNanBEAN;
import com.tinhnd.model.PhieuMuaBaoHiemBEAN;
import com.tinhnd.model.TaiKhoanBEAN;
import com.tinhnd.model.TinTucBEAN;
import com.tinhnd.service.BaoHiemService;
import com.tinhnd.service.HoSoTaiNanService;
import com.tinhnd.service.PhieuMuaBaoHiemService;
import com.tinhnd.service.TaiKhoanService;
import com.tinhnd.service.TinTucService;

@Controller
@RequestMapping("baohiem")
public class BaoHiemController {
	
	@Autowired 
	private BaoHiemService baoHiemService;
	@Autowired
	private TaiKhoanService taiKhoanService;
	@Autowired
	private PhieuMuaBaoHiemService phieuMuaBaoHiemService;
	@Autowired 
	private HoSoTaiNanService hoSoTaiNanService; 
	@Autowired 
	private TinTucService tinTucService;
	@Autowired
	private MessageSource messageSource; // đa ngôn ngữ
/*	@Autowired
	private CanvasjsChartService canvasjsChartService; // chart
*/	
	
	@RequestMapping(method = RequestMethod.GET) // lấy danh sách bảo hiểm trả về trang index
	public String index(ModelMap modelMap, HttpSession session) {
		modelMap.put("danhsachbaohiem", baoHiemService.findAll()); // lấy danh sách bảo hiểm
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		modelMap.put("danhsachtintuchuongdan", tinTucService.findNewsByLoaitintuc("Hướng dẫn"));
		modelMap.put("danhsachtintuckhuyenmai", tinTucService.findNewsByLoaitintuc("Khuyến mãi"));
		modelMap.put("danhsachtintuchotro", tinTucService.findNewsByLoaitintuc("Hỗ trợ"));
		modelMap.put("danhsachtintucslide", tinTucService.findNewsByLoaitintuc("slide"));
		modelMap.put("danhsachtintucgioithieu", tinTucService.findNewsByLoaitintuc("Giới thiệu"));
		
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}
		
		NumberFormat nf = NumberFormat.getInstance();
	    nf.setMinimumIntegerDigits(0);
		
		Calendar c = Calendar.getInstance(); 
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
        
		List<PhieuMuaBaoHiemBEAN> list = phieuMuaBaoHiemService.findAll();
		for (PhieuMuaBaoHiemBEAN pmbh : list) {
			
			Date dateExpire = pmbh.getNgayhethan();
			c.setTime(dateExpire); 
			c.add(Calendar.DATE, -10); // + thêm ngày
			dateExpire = c.getTime();
			
			if(dateExpire.before(new Date()) && pmbh.getNgayhethan().after(new Date())) {
				TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findById(pmbh.getMataikhoan());
				PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN = phieuMuaBaoHiemService.checkGuiMail(pmbh.getMataikhoan(), pmbh.getMabaohiem());
				if(phieuMuaBaoHiemBEAN.isGuimail() == false) {
					SendMail.sendMail("tinhbidx@gmail.com", "812237559", taiKhoanBEAN.getTendangnhap() , "THÔNG BÁO SẮP HẾT HẠN BẢO HIỂM", 
				      "\nLoại bảo hiểm: "+ pmbh.getLoaibaohiem() + "\n Biển số: " + pmbh.getBienso() +
				      "\nGói bảo hiểm: " + nf.format(pmbh.getGoibaohiem()) + " VND" +
				      "\nThời hạn: " + pmbh.getThoihan() + " tháng"+ "\nNgày mua: " + df.format(pmbh.getNgaymua()) +
				      "\n Ngày hết hạn: " +	df.format(pmbh.getNgayhethan()) +
				      "\n Để biết thêm thông tin xin vui lòng truy cập truy cập website baohiemtructuyen.com");
					phieuMuaBaoHiemService.updateGuiMail(pmbh.getMataikhoan(), pmbh.getMabaohiem());
				}
			}
		}
		List<PhieuMuaBaoHiemBEAN> list2 = phieuMuaBaoHiemService.findAutoDeleteExprirationDate();
		for (PhieuMuaBaoHiemBEAN pmbh : list2) {
			hoSoTaiNanService.deleteWhenAutoDeletePhieumuabaohiem(pmbh.getId()); // tự động xóa hosotainan khi xóa phieumuabaohiem khi hết hạn 
		}
		phieuMuaBaoHiemService.autoDeleteExprirationDate(); // tự động xóa phieumuabaohiem khi hết hạn 

		
		return "index";
	}
//	@RequestMapping(value = "index", method = RequestMethod.GET) // trả về trang index
//	public String home(ModelMap modelMap, HttpSession session) {
//		modelMap.put("danhsachbaohiem", baoHiemService.findAll()); // lấy danh sách bảo hiểm
//		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
//		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
//		modelMap.put("danhsachtintuchuongdan", tinTucService.findNewsByLoaitintuc("Hướng dẫn"));
//		modelMap.put("danhsachtintuckhuyenmai", tinTucService.findNewsByLoaitintuc("Khuyến mãi"));
//		modelMap.put("danhsachtintuchotro", tinTucService.findNewsByLoaitintuc("Hỗ trợ"));
//		modelMap.put("danhsachtintucslide", tinTucService.findNewsByLoaitintuc("slide"));
//		modelMap.put("danhsachtintucgioithieu", tinTucService.findNewsByLoaitintuc("Giới thiệu"));
//		
//		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
//			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
//			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
//		}
//		
//		NumberFormat nf = NumberFormat.getInstance();
//	    nf.setMinimumIntegerDigits(0);
//		
//		Calendar c = Calendar.getInstance(); 
//		DateFormat df = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
//        
//		List<PhieuMuaBaoHiemBEAN> list = phieuMuaBaoHiemService.findAll();
//		for (PhieuMuaBaoHiemBEAN pmbh : list) {
//			
//			Date dateExpire = pmbh.getNgayhethan();
//			c.setTime(dateExpire); 
//			c.add(Calendar.DATE, -10); // + thêm ngày
//			dateExpire = c.getTime();
//			
//			if(dateExpire.before(new Date()) && pmbh.getNgayhethan().after(new Date())) {
//				TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findById(pmbh.getMataikhoan());
//				PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN = phieuMuaBaoHiemService.checkGuiMail(pmbh.getMataikhoan(), pmbh.getMabaohiem());
//				if(phieuMuaBaoHiemBEAN.isGuimail() == false) {
//					SendMail.sendMail("tinhbidx@gmail.com", "812237559", taiKhoanBEAN.getTendangnhap() , "THÔNG BÁO SẮP HẾT HẠN BẢO HIỂM", 
//				      "\nLoại bảo hiểm: "+ pmbh.getLoaibaohiem() + "\n Biển số: " + pmbh.getBienso() +
//				      "\nGói bảo hiểm: " + nf.format(pmbh.getGoibaohiem()) + " VND" +
//				      "\nThời hạn: " + pmbh.getThoihan() + " tháng"+ "\nNgày mua: " + df.format(pmbh.getNgaymua()) +
//				      "\n Ngày hết hạn: " +	df.format(pmbh.getNgayhethan()) +
//				      "\n Để biết thêm thông tin xin vui lòng truy cập truy cập website baohiemtructuyen.com");
//					phieuMuaBaoHiemService.updateGuiMail(pmbh.getMataikhoan(), pmbh.getMabaohiem());
//				}
//			}
//		}
//		List<PhieuMuaBaoHiemBEAN> list2 = phieuMuaBaoHiemService.findAutoDeleteExprirationDate();
//		for (PhieuMuaBaoHiemBEAN pmbh : list2) {
//			hoSoTaiNanService.deleteWhenAutoDeletePhieumuabaohiem(pmbh.getId()); // tự động xóa hosotainan khi xóa phieumuabaohiem khi hết hạn 
//		}
//		phieuMuaBaoHiemService.autoDeleteExprirationDate(); // tự động xóa phieumuabaohiem khi hết hạn 
//
//		return "index";
//	}
	@RequestMapping(value = "introduce", method = RequestMethod.GET) // lấy trên link và trả về trang introduce
	public String introduce(ModelMap modelMap, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}
		
		return "introduce";
	}
	@RequestMapping(value = "guide", method = RequestMethod.GET) // lấy trên link và trả về trang guide
	public String guide(ModelMap modelMap, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		modelMap.put("danhsachtintuckhuyenmai", tinTucService.findNewsByLoaitintuc("Khuyến mãi"));
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}
		
		return "guide";
	}
	@RequestMapping(value = "contact", method = RequestMethod.GET) // lấy trên link và trả về trang contact
	public String contact(ModelMap modelMap, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}
		
		return "contact";
	}
	@RequestMapping(value = "gotopayment", method = RequestMethod.POST) // lấy trên link và trả về trang payment
	public String gotopayment(@ModelAttribute("phieumuabaohiem") PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN ,ModelMap modelMap, HttpSession session, HttpServletRequest request) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}else{
			return "redirect:/";
		}

		modelMap.put("money", request.getParameter("money"));
		session.setAttribute("money", request.getParameter("money"));
		return "payment";
	}
	
	@RequestMapping(value = "declare", method = RequestMethod.GET) // lấy trên link và trả về trang declare
	public String declare(ModelMap modelMap, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}
		
		return "declare";
	}
	@RequestMapping(value = "listdeclare", method = RequestMethod.GET) // lấy trên link và trả về trang listdeclare
	public String listdeclare(ModelMap modelMap, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
			modelMap.put("danhsachhosotainan", hoSoTaiNanService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}else{
			return "redirect:/";
		}
		return "listdeclare";
	}
	@RequestMapping(value = "listbuyinsurrance", method = RequestMethod.GET) // lấy trên link và trả về trang listbuyinsurrance
	public String listbuyinsurrance(ModelMap modelMap, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}else{
			return "redirect:/";
		}
		return "listbuyinsurrance";
	}
	@RequestMapping(value = "buy", method = RequestMethod.GET) // lấy trên link và trả về trang buy
	public String buy(ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("phieumuabaohiem", new PhieuMuaBaoHiemBEAN()); // put để buy, listiinsurrance
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		modelMap.put("baohiem", baoHiemService.findTypeInsurranceById((request.getParameter("id")))); // lấy thông tin bảo hiểm cần mua
		
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}
		
		return "buy";
	}
	
	@RequestMapping(value = "signup", method = RequestMethod.POST)  // đăng ký
	public String signup(@ModelAttribute("taikhoan") TaiKhoanBEAN taiKhoanBEAN, ModelMap modelMap) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("phieumuabaohiem", new PhieuMuaBaoHiemBEAN()); // put để buy, listiinsurrance
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		TaiKhoanBEAN taiKhoanBEAN2 = taiKhoanService.findUsername(taiKhoanBEAN.getTendangnhap());
		if(taiKhoanBEAN2 != null) {
			modelMap.put("title", "ĐĂNG KÝ THẤT BẠI");
			modelMap.put("error", "Email đã được đăng ký !");
			return "error";
		}else {
			taiKhoanBEAN.setMatkhau(bCryptPasswordEncoder.encode(taiKhoanBEAN.getMatkhau()));
			taiKhoanBEAN.setLoaitaikhoan("customer");
			taiKhoanService.signup(taiKhoanBEAN);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)  // đăng nhập
	public String login(@ModelAttribute("taikhoan") TaiKhoanBEAN taiKhoanBEAN, ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("phieumuabaohiem", new PhieuMuaBaoHiemBEAN()); // put để buy, listiinsurrance
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		TaiKhoanBEAN taiKhoanBEAN2 = taiKhoanService.login(taiKhoanBEAN.getTendangnhap(), taiKhoanBEAN.getMatkhau());
		if (taiKhoanBEAN2 == null) {
			modelMap.put("title", "ĐĂNG NHẬP THẤT BẠI");
			modelMap.put("error", "Email hoặc mật khẩu không đúng !");
			return "error";
		} else {
			String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
			boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
			if (verify) {
				TaiKhoanBEAN taiKhoanBEAN3 = taiKhoanService.findUsername(taiKhoanBEAN.getTendangnhap());
				if(!taiKhoanBEAN3.getLoaitaikhoan().equals("customer")) {
					modelMap.put("title", "ĐĂNG NHẬP THẤT BẠI");
					modelMap.put("error", "Bạn không có tài khoản khách hàng, vui lòng đăng ký !");
					return "error";
				}
				session.setAttribute("tendangnhap", taiKhoanBEAN.getTendangnhap());
				session.setAttribute("hotencuataikhoan", taiKhoanBEAN3.getHoten());
			/*	if (request.getParameter("remember") != null) {
					Cookie ckTendangnhap = new Cookie("tendangnhap", taiKhoanBEAN.getTendangnhap());
					ckTendangnhap.setMaxAge(3600);
					response.addCookie(ckTendangnhap);
					Cookie ckMatkhau = new Cookie("matkhau", taiKhoanBEAN.getMatkhau());
					ckMatkhau.setMaxAge(3600);
					response.addCookie(ckMatkhau);
				}*/
			}else {
				modelMap.put("title", "ĐĂNG NHẬP THẤT BẠI");
				modelMap.put("error", "Bạn chưa xác nhận Captcha !");
				return "error";
			}
			return "redirect:/";
		}
	}
	
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)  // đăng xuất
	public String logout(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("phieumuabaohiem", new PhieuMuaBaoHiemBEAN()); // put để buy, listiinsurrance
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		session.removeAttribute("tendangnhap");
		session.removeAttribute("hotencuataikhoan");
		for(Cookie ck : request.getCookies()) {
			if(ck.getName().equalsIgnoreCase("tendangnhap")) {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			if(ck.getName().equalsIgnoreCase("matkhau")) {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "changeprofile", method = RequestMethod.GET) // get giá trị trên link và trả về trang changeProfile.jsp
	public String changeprofile(ModelMap modelMap, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("phieumuabaohiem", new PhieuMuaBaoHiemBEAN()); // put để buy, listiinsurrance
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}else{
			return "redirect:/";
		}
		modelMap.put("taikhoancanhan", taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString())); // lấy thông tin tài khoản cá nhân
		return "changeprofile";
	}
	
	@RequestMapping(value = "changeprofile", method = RequestMethod.POST)  // thay đổi thông tin tài khoản
	public String changeProfile(@ModelAttribute("taikhoan") TaiKhoanBEAN taiKhoanBEAN, ModelMap modelMap) {
		TaiKhoanBEAN taiKhoanBEAN2 = taiKhoanService.findById(taiKhoanBEAN.getId());
		if(!taiKhoanBEAN.getMatkhau().isEmpty()) {
			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			taiKhoanBEAN2.setMatkhau(bCryptPasswordEncoder.encode(taiKhoanBEAN.getMatkhau()));
		}
		
		taiKhoanBEAN2.setHoten(taiKhoanBEAN.getHoten());
		taiKhoanBEAN2.setDiachi(taiKhoanBEAN.getDiachi());
		taiKhoanBEAN2.setSodienthoai(taiKhoanBEAN.getSodienthoai());
		taiKhoanService.changeProfile(taiKhoanBEAN2);
		modelMap.put("taikhoan", taiKhoanBEAN2);
		return "redirect:/";
	}
	
	@RequestMapping(value = "buy", method = RequestMethod.POST)  // mua bảo hiểm
	public String buy(@ModelAttribute("phieumuabaohiem") PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN, ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("phieumuabaohiem", new PhieuMuaBaoHiemBEAN()); // put để buy, listiinsurrance
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		if(session.getAttribute("tendangnhap") == null){
			modelMap.put("title", "MUA BẢO HIỂM THẤT BẠI");
			modelMap.put("error", "Vui lòng đăng nhập trước khi mua bảo hiểm !");
			return "error";
		}else{  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}
		TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
		if(phieuMuaBaoHiemService.checkPhieuMuaBaoHiemExist(phieuMuaBaoHiemBEAN.getMabaohiem(), phieuMuaBaoHiemBEAN.getBienso(),taiKhoanBEAN.getId()) != null) {
			modelMap.put("title", "MUA BẢO HIỂM THẤT BẠI");
			modelMap.put("error", "Bạn đã mua bảo hiểm cho biển số xe này rồi !");
			return "error";
		}
		NumberFormat nf = NumberFormat.getInstance();
	    nf.setMinimumIntegerDigits(0);
		
		String dg = request.getParameter("dongia");
		String th = request.getParameter("thoihan");
		Integer dongia = 0, thoihan = 0;
        if(dg != null) {
        	dongia = Integer.parseInt(dg);
        }
        if(th != null) {
        	thoihan = Integer.parseInt(th);
        }
        
        Date ngayhethan = new Date();
        Calendar c = Calendar.getInstance(); 
        c.setTime(ngayhethan); 
        c.add(Calendar.MONTH, thoihan); // + thêm tháng
        
        ngayhethan = c.getTime();

		Integer sotienthucthu = ((dongia*thoihan/12) / 10) + ((dongia*thoihan/12) /10) / 10;
		phieuMuaBaoHiemBEAN.setNgaymua(new Date());
		phieuMuaBaoHiemBEAN.setNgayhethan(ngayhethan);
		phieuMuaBaoHiemBEAN.setThoihan(thoihan);
		phieuMuaBaoHiemBEAN.setGoibaohiem(dongia);
		phieuMuaBaoHiemBEAN.setSotienthucthu(sotienthucthu);
		phieuMuaBaoHiemBEAN.setTrangthaithanhtoan("Chưa thanh toán");
		phieuMuaBaoHiemBEAN.setLoaibaohiem(request.getParameter("loaibaohiem"));
		phieuMuaBaoHiemBEAN.setMataikhoan(taiKhoanBEAN.getId());
		
		phieuMuaBaoHiemService.create(phieuMuaBaoHiemBEAN);

		SendMail.sendMail("tinhbidx@gmail.com", "812237559", session.getAttribute("tendangnhap").toString(), "MUA BẢO HIỂM", 
          "Họ tên: " + taiKhoanBEAN.getHoten() +  "\nLoại bảo hiểm: "+ request.getParameter("loaibaohiem") + 
          "\n Biển số: " + request.getParameter("bienso") + "\nThời hạn: " + thoihan + " tháng\nGói bảo hiểm: " + 
		  nf.format(dongia) + " VND\nSố tiền thực thu: " + nf.format(sotienthucthu) + " VND" + 
          "\n Trạng thái thanh toán: Chưa thanh toán");

		return "redirect:./listbuyinsurrance.html";
	}
	
	@RequestMapping(value = "deletelistbuyinsurrance/{id}", method = RequestMethod.GET)  // xóa danh sách bảo hiểm đã mua
	public String deletelistbuyinsurrance(@PathVariable("id") String id) {
		phieuMuaBaoHiemService.delete(phieuMuaBaoHiemService.findById(id));
		hoSoTaiNanService.deleteWhenDeletePhieumuabaohiem(id);// xóa hồ sơ tai nạn khi xóa phiếu mua bảo hiểm
		return "redirect:../listbuyinsurrance.html";
	}
	
	@RequestMapping(value = "declare", method = RequestMethod.POST)  // khai báo hồ sơ tai nạn
	public String declare(@ModelAttribute("hosotainan") HoSoTaiNanBEAN hoSoTaiNanBEAN, ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("phieumuabaohiem", new PhieuMuaBaoHiemBEAN()); // put để buy, listiinsurrance
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}
		if(hoSoTaiNanService.findCountHosotainanExist(request.getParameter("bienso")) > 2) {
			modelMap.put("title", "KHAI BÁO HỒ SƠ THẤT BẠI");
			modelMap.put("error", "Xe của bạn đã quá 3 lần tai nạn !");
			return "error";
		}
		
		String ntn = request.getParameter("ntn");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date ngaytainan = null;
        try {
        	ngaytainan =  df.parse(ntn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN = phieuMuaBaoHiemService.findByBienso(request.getParameter("bienso"));
        hoSoTaiNanBEAN.setNgaytainan(ngaytainan);
        hoSoTaiNanBEAN.setThoihan(phieuMuaBaoHiemBEAN.getThoihan());
        hoSoTaiNanBEAN.setSotiendenbu(phieuMuaBaoHiemBEAN.getGoibaohiem());
        hoSoTaiNanBEAN.setXacnhandenbu("Đang chờ xác nhận...");
        hoSoTaiNanBEAN.setMabaohiem(phieuMuaBaoHiemBEAN.getMabaohiem());
        hoSoTaiNanBEAN.setMaphieumuabaohiem(phieuMuaBaoHiemBEAN.getId());
		TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
		hoSoTaiNanBEAN.setMataikhoan(taiKhoanBEAN.getId());
		
		hoSoTaiNanService.create(hoSoTaiNanBEAN);

		return "redirect:./listdeclare.html";
	}
	
	@RequestMapping(value = "deletelistdeclare/{id}", method = RequestMethod.GET)  // xóa danh sách bảo hiểm đã mua
	public String deletelistdeclare(@PathVariable("id") String id,HttpServletRequest request) {
		hoSoTaiNanService.delete(hoSoTaiNanService.findById(id));
		return "redirect:../listdeclare.html";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.POST)  // tìm kiếm bảo hiểm
	public String search(@ModelAttribute("baohiem") BaoHiemBEAN baoHiemBEAN, ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("phieumuabaohiem", new PhieuMuaBaoHiemBEAN()); // put để buy, listiinsurrance
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		modelMap.put("danhsachtintuchuongdan", tinTucService.findNewsByLoaitintuc("Hướng dẫn"));
		modelMap.put("danhsachtintuckhuyenmai", tinTucService.findNewsByLoaitintuc("Khuyến mãi"));
		modelMap.put("danhsachtintuchotro", tinTucService.findNewsByLoaitintuc("Hỗ trợ"));
		modelMap.put("danhsachtintucslide", tinTucService.findNewsByLoaitintuc("slide"));
		modelMap.put("danhsachtintucgioithieu", tinTucService.findNewsByLoaitintuc("Giới thiệu"));
		
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}
		
		modelMap.put("danhsachbaohiem", baoHiemService.findByKey(request.getParameter("key"))); // tìm kiếm by key
		modelMap.put("demsoluongtimkiem", baoHiemService.findCountByKey(request.getParameter("key"))); // đếm số lượng tìm kiếm

		return "index";
	}
	
	@RequestMapping(value = "payment", method = RequestMethod.POST)  // thanh toán
	public String payment(@ModelAttribute("phieumuabaohiem") PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN, ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để login, signin
		modelMap.put("phieumuabaohiem", new PhieuMuaBaoHiemBEAN()); // put để buy, listiinsurrance
		modelMap.put("hosotainan", new HoSoTaiNanBEAN()); // put để declare
		
		TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findUsername(session.getAttribute("tendangnhap").toString());
		if((session.getAttribute("tendangnhap")) != null){  // lấy biển số xe khi khai báo
			modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByMataikhoan(taiKhoanBEAN.getId())); // lấy listiinsurrance
		}
		if(phieuMuaBaoHiemService.checkPayment(taiKhoanBEAN.getId()) == null) {
			modelMap.put("errorPayment", "Bạn không có bảo hiểm nào cần thanh toán !");
			return "payment";
		}

		
		
		String phuongthucthanhtoan = request.getParameter("phuongthucthanhtoan");
		String nganhang = request.getParameter("nganhang");
		String sotaikhoan = request.getParameter("sotaikhoan");
		String sttt = request.getParameter("sotienthanhtoan");
		Integer sotienthanhtoan = 0;
        if(sttt != null) {
        	sotienthanhtoan = Integer.parseInt(session.getAttribute("money").toString());
        }
       
		phieuMuaBaoHiemService.updatePaymentByMataikhoan(taiKhoanBEAN.getId(), phuongthucthanhtoan, sotienthanhtoan); // update collection phieumuabaohiem
		if(phuongthucthanhtoan.equals("Chuyển khoản")) {
			taiKhoanService.updatePaymentByMataikhoan(taiKhoanBEAN.getId(), nganhang, sotaikhoan); // update collection taikhoan
		}
		modelMap.put("errorPayment", "Thanh toán thành công !");
		return "payment";
	}
	
	// phần trang quản trị
	
	@RequestMapping(value = "loginadmin", method = RequestMethod.GET)  // vào trang admin
	public String loginadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		TaiKhoanBEAN taiKhoanBEAN = checkCookie(request);
		if(taiKhoanBEAN == null) {
			modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để loginadmin
			return "admin/loginadmin";
		}else {
			if(taiKhoanService.login(taiKhoanBEAN.getTendangnhap(), taiKhoanBEAN.getMatkhau()) != null) {
				TaiKhoanBEAN taiKhoanBEAN2 = taiKhoanService.findUsername(taiKhoanBEAN.getTendangnhap());
				session.setAttribute("tendangnhapadmin", taiKhoanBEAN2.getTendangnhap());
				session.setAttribute("hotencuataikhoanadmin", taiKhoanBEAN2.getHoten());
				return "admin/index";
			}else {
				modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để loginadmin
				return "admin/loginadmin";
			}
		}
	}
	
	@RequestMapping(value = "loginadmin", method = RequestMethod.POST)  // đăng nhập trang admin
	public String loginadmin(@ModelAttribute("taikhoan") TaiKhoanBEAN taiKhoanBEAN, ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		TaiKhoanBEAN taiKhoanBEAN2 = taiKhoanService.login(taiKhoanBEAN.getTendangnhap(), taiKhoanBEAN.getMatkhau());
		if (taiKhoanBEAN2 == null) {
			modelMap.put("erroradmin", "Email hoặc mật khẩu không đúng !");
			return "admin/loginadmin";
		} else {
			String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
			boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
			if (verify) {
				TaiKhoanBEAN taiKhoanBEAN3 = taiKhoanService.findUsername(taiKhoanBEAN.getTendangnhap());
				if(!taiKhoanBEAN3.getLoaitaikhoan().equals("admin") && !taiKhoanBEAN3.getLoaitaikhoan().equals("staff")) {
					modelMap.put("erroradmin", "Email hoặc mật khẩu không đúng !");
					return "admin/loginadmin";
				}
				session.setAttribute("tendangnhapadmin", taiKhoanBEAN.getTendangnhap());
				session.setAttribute("hotencuataikhoanadmin", taiKhoanBEAN3.getHoten());
				if (request.getParameter("remember") != null) {
					Cookie ckTendangnhap = new Cookie("tendangnhap", taiKhoanBEAN.getTendangnhap());
					ckTendangnhap.setMaxAge(3600);
					response.addCookie(ckTendangnhap);
					Cookie ckMatkhau = new Cookie("matkhau", taiKhoanBEAN.getMatkhau());
					ckMatkhau.setMaxAge(3600);
					response.addCookie(ckMatkhau);
				}
			}else {
				modelMap.put("erroradmin", "Bạn chưa xác nhận Captcha !");
				return "admin/loginadmin";
			}
			return "redirect:./admin.html";
		}
	}
	
	@RequestMapping(value = "logoutadmin", method = RequestMethod.GET)  // đăng xuất trang admin
	public String logoutadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		modelMap.put("taikhoan", new TaiKhoanBEAN()); // put để loginadmin
		session.removeAttribute("tendangnhapadmin");
		session.removeAttribute("hotencuataikhoanadmin");
		for(Cookie ck : request.getCookies()) {
			if(ck.getName().equalsIgnoreCase("tendangnhap")) {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			if(ck.getName().equalsIgnoreCase("matkhau")) {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
		}
		return "redirect:./loginadmin.html";
	}
	
	public TaiKhoanBEAN checkCookie(HttpServletRequest request) {
		Cookie []cookies = request.getCookies();
		TaiKhoanBEAN taiKhoanBEAN = null;
		String tendangnhap = "", matkhau = "";
		for(Cookie ck : cookies) {
			if(ck.getName().equalsIgnoreCase("tendangnhap")) {
				tendangnhap = ck.getValue();
			}
			if(ck.getName().equalsIgnoreCase("matkhau")) {
				matkhau = ck.getValue();
			}
		}
		if(!matkhau.isEmpty() && !matkhau.isEmpty())
			taiKhoanBEAN = new TaiKhoanBEAN(tendangnhap,matkhau);
		return taiKhoanBEAN;
	}
	
	@RequestMapping(value = "changeprofileadmin", method = RequestMethod.GET)  // vào trang thêm tài khoản
	public String changeprofileadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("taikhoan", taiKhoanService.findUsername(session.getAttribute("tendangnhapadmin").toString()));
		return "admin/changeprofileadmin";
	}
	
	@RequestMapping(value = "changeprofileadmin", method = RequestMethod.POST)  // thay đổi thông tin tài khoản admin
	public String changeprofileadmin(@ModelAttribute("taikhoan") TaiKhoanBEAN taiKhoanBEAN, ModelMap modelMap, HttpSession session) {
		TaiKhoanBEAN taiKhoanBEAN2 = taiKhoanService.findById(taiKhoanBEAN.getId());
		if(!taiKhoanBEAN.getMatkhau().isEmpty()) {
			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			taiKhoanBEAN2.setMatkhau(bCryptPasswordEncoder.encode(taiKhoanBEAN.getMatkhau()));
		}
		taiKhoanBEAN2.setLoaitaikhoan(taiKhoanBEAN.getLoaitaikhoan());
		taiKhoanBEAN2.setHoten(taiKhoanBEAN.getHoten());
		taiKhoanBEAN2.setDiachi(taiKhoanBEAN.getDiachi());
		taiKhoanBEAN2.setSodienthoai(taiKhoanBEAN.getSodienthoai());
		taiKhoanBEAN2.setNganhang(taiKhoanBEAN.getNganhang());
		taiKhoanBEAN2.setSotaikhoan(taiKhoanBEAN.getSotaikhoan());
		taiKhoanService.changeProfile(taiKhoanBEAN2);
		modelMap.put("taikhoan", taiKhoanBEAN2);
		
		
		return "admin/index";
	}
	
	@RequestMapping(value = "admin", method = RequestMethod.GET)  // vào trang admin
	public String index(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("demphieumuabaohiemchuaxacnhanthanhtoan", phieuMuaBaoHiemService.countChuaxacnhanThanhtoan());
		modelMap.put("demhsotainanchuaxacnhandenbu", hoSoTaiNanService.countChuaxacnhanDenbu());
		modelMap.put("taikhoan", taiKhoanService.findUsername(session.getAttribute("tendangnhapadmin").toString()));
		return "admin/index";
	}
	
	@RequestMapping(value = "listinsurranceadmin", method = RequestMethod.GET)  // vào trang danh sách bảo hiểm
	public String listinsurranceadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("danhsachbaohiem", baoHiemService.findAll()); // lấy danh sách bảo hiểm
		return "admin/listinsurranceadmin";
	}
	
	@RequestMapping(value = "listbuyinsurranceadmin", method = RequestMethod.GET)  // vào trang danh sách mua bảo hiểm
	public String listbuyinsurranceadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findAll()); // lấy listiinsurrance
		return "admin/listbuyinsurranceadmin";
	}
	
	@RequestMapping(value = "listdeclareadmin", method = RequestMethod.GET)  // vào trang danh sách hồ sơ tai nạn
	public String listdeclareadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("danhsachhosotainan", hoSoTaiNanService.findAll()); // lấy listdeclare
		return "admin/listdeclareadmin";
	}
	
	@RequestMapping(value = "listaccountadmin", method = RequestMethod.GET)  // vào trang dánh sách tài khoản 
	public String listaccountadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("danhsachtaikhoan", taiKhoanService.findAll());
		return "admin/listaccountadmin";
	}
	
	@RequestMapping(value = "listnewsadmin", method = RequestMethod.GET)  // vào trang danh sách ảnh
	public String listnewsadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("danhsachtintuc", tinTucService.findAll());
		return "admin/listnewsadmin";
	}
	
	@RequestMapping(value = "listaccidentadmin", method = RequestMethod.GET)  // vào trang danh sách thống kê
	public String listaccidentadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date fromDate2016 = null, toDate2016 = null, fromDate2017 = null, toDate2017 = null, fromDate2018 = null, toDate2018 = null;
        try {
        	fromDate2016 =  df.parse("01/01/2016");
        	toDate2016 =  df.parse("31/12/2016");
        	fromDate2017 =  df.parse("01/01/2017");
        	toDate2017 =  df.parse("31/12/2017");
        	fromDate2018 =  df.parse("01/01/2018");
        	toDate2018 =  df.parse("31/12/2018");
        } catch (Exception e) {
            e.printStackTrace();
        }
        modelMap.put("count2016", hoSoTaiNanService.countSovutainantheonam(fromDate2016, toDate2016));
        modelMap.put("count2017", hoSoTaiNanService.countSovutainantheonam(fromDate2017, toDate2017));
        modelMap.put("count2018", hoSoTaiNanService.countSovutainantheonam(fromDate2018, toDate2018));
		return "admin/listaccidentadmin";
	}
	
	@RequestMapping(value = "listsellinsurranceadmin", method = RequestMethod.GET)  // vào trang danh sách thống kê
	public String listsellinsurranceadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date fromDate2016 = null, toDate2016 = null, fromDate2017 = null, toDate2017 = null, fromDate2018 = null, toDate2018 = null;
        try {
        	fromDate2016 =  df.parse("01/01/2016");
        	toDate2016 =  df.parse("31/12/2016");
        	fromDate2017 =  df.parse("01/01/2017");
        	toDate2017 =  df.parse("31/12/2017");
        	fromDate2018 =  df.parse("01/01/2018");
        	toDate2018 =  df.parse("31/12/2018");
        } catch (Exception e) {
            e.printStackTrace();
        }
        modelMap.put("count2016", hoSoTaiNanService.countSovutainantheonam(fromDate2016, toDate2016));
        modelMap.put("count2017", hoSoTaiNanService.countSovutainantheonam(fromDate2017, toDate2017));
        modelMap.put("count2018", hoSoTaiNanService.countSovutainantheonam(fromDate2018, toDate2018));
		return "admin/listsellinsurranceadmin";
	}
	
	@RequestMapping(value = "addinsurranceadmin", method = RequestMethod.GET)  // vào trang thêm bảo hiểm
	public String addinsurranceadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("baohiem", new BaoHiemBEAN());
		return "admin/addinsurranceadmin";
	}
	
	@RequestMapping(value = "addinsurranceadmin", method = RequestMethod.POST)  // thêm bảo hiểm
	public String addinsurranceadmin(@ModelAttribute("baohiem") BaoHiemBEAN baoHiemBEAN, ModelMap modelMap, HttpSession session) {
		baoHiemService.create(baoHiemBEAN);
		return "redirect:./listinsurranceadmin.html";
	}
	
	@RequestMapping(value = "updateinsurranceadmin/{id}", method = RequestMethod.GET)  // vào trang cập nhật bảo hiếm
	public String updateinsurranceadmin(@PathVariable("id") String id,ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("baohiem", baoHiemService.findById(id));
		return "admin/updateinsurranceadmin";
	}
	
	@RequestMapping(value = "updateinsurranceadmin", method = RequestMethod.POST)  // cập nhật bảo hiểm
	public String updateinsurranceadmin(@ModelAttribute("baohiem") BaoHiemBEAN baoHiemBEAN, ModelMap modelMap, HttpSession session) {
		BaoHiemBEAN baoHiemBEAN2 = baoHiemService.findById(baoHiemBEAN.getId());

		baoHiemBEAN2.setLoaibaohiem(baoHiemBEAN.getLoaibaohiem());
		baoHiemBEAN2.setDongia(baoHiemBEAN.getDongia());
		baoHiemBEAN2.setAnh(baoHiemBEAN.getAnh());
		baoHiemBEAN2.setMota(baoHiemBEAN.getMota());
		
		baoHiemService.update(baoHiemBEAN2);
		modelMap.put("baohiem", baoHiemBEAN2);
		
		return "redirect:./listinsurranceadmin.html";
	}
	
	@RequestMapping(value = "deleteinsurranceadmin/{id}", method = RequestMethod.GET)  // xóa tài khoản
	public String deleteinsurranceadmin(@PathVariable("id") String id,HttpServletRequest request, ModelMap modelMap) {
		baoHiemService.delete(baoHiemService.findById(id));
		return "redirect:../listinsurranceadmin.html";
		
		// xóa dữ liệu và load bằng ajax
//		modelMap.put("danhsachbaohiem", baoHiemService.findAll()); 
//		return "admin/listinsurranceadminresult";
	}
	
	@RequestMapping(value = "searchinsurranceadmin", method = RequestMethod.POST)  // tìm kiếm tin tức
	public String searchinsurranceadmin(@ModelAttribute("taikhoan") TinTucBEAN tinTucBEAN, ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		
		modelMap.put("danhsachbaohiem", baoHiemService.findByKey(request.getParameter("keyinsurranceadmin"))); // tìm kiếm by key

		return "admin/listinsurranceadmin";
	}
	
	@RequestMapping(value = "addaccountadmin", method = RequestMethod.GET)  // vào trang thêm tài khoản
	public String addaccountadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("taikhoan", new TaiKhoanBEAN());
		return "admin/addaccountadmin";
	}
	
	@RequestMapping(value = "addaccountadmin", method = RequestMethod.POST)  // thêm tài khoản
	public String addaccountadmin(@ModelAttribute("taikhoan") TaiKhoanBEAN taiKhoanBEAN, ModelMap modelMap, HttpSession session) {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		taiKhoanBEAN.setMatkhau(bCryptPasswordEncoder.encode(taiKhoanBEAN.getMatkhau()));
		taiKhoanService.create(taiKhoanBEAN);
		return "redirect:./listaccountadmin.html";
	}
	
	@RequestMapping(value = "updateaccountadmin/{id}", method = RequestMethod.GET)  // vào trang cập nhật tài khoản
	public String updateaccountadmin(@PathVariable("id") String id,ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("taikhoan", taiKhoanService.findById(id));
		return "admin/updateaccountadmin";
	}
	
	@RequestMapping(value = "updateaccountadmin", method = RequestMethod.POST)  // cập nhật tài khoản
	public String updateaccountadmin(@ModelAttribute("taikhoan") TaiKhoanBEAN taiKhoanBEAN, ModelMap modelMap, HttpSession session) {
		TaiKhoanBEAN taiKhoanBEAN2 = taiKhoanService.findById(taiKhoanBEAN.getId());
		if(!taiKhoanBEAN.getMatkhau().isEmpty()) {
			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			taiKhoanBEAN2.setMatkhau(bCryptPasswordEncoder.encode(taiKhoanBEAN.getMatkhau()));
		}
		taiKhoanBEAN2.setLoaitaikhoan(taiKhoanBEAN.getLoaitaikhoan());
		taiKhoanBEAN2.setHoten(taiKhoanBEAN.getHoten());
		taiKhoanBEAN2.setDiachi(taiKhoanBEAN.getDiachi());
		taiKhoanBEAN2.setSodienthoai(taiKhoanBEAN.getSodienthoai());
		taiKhoanBEAN2.setNganhang(taiKhoanBEAN.getNganhang());
		taiKhoanBEAN2.setSotaikhoan(taiKhoanBEAN.getSotaikhoan());
		taiKhoanService.update(taiKhoanBEAN2);
		modelMap.put("taikhoan", taiKhoanBEAN2);
		
		return "redirect:./listaccountadmin.html";
	}
	
	@RequestMapping(value = "deleteaccountadmin/{id}", method = RequestMethod.GET)  // xóa tài khoản
	public String deleteaccountadmin(@PathVariable("id") String id,HttpServletRequest request) {
		taiKhoanService.delete(taiKhoanService.findById(id));
		return "redirect:../listaccountadmin.html";
	}
	
	@RequestMapping(value = "searchaccountadmin", method = RequestMethod.POST)  // tìm kiếm bảo hiểm
	public String searchaccountadmin(@ModelAttribute("taikhoan") TaiKhoanBEAN taiKhoanBEAN, ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		
		modelMap.put("danhsachtaikhoan", taiKhoanService.findByKey(request.getParameter("keyaccountadmin"))); // tìm kiếm by key

		return "admin/listaccountadmin";
	}
	
	@RequestMapping(value = "addnewsadmin", method = RequestMethod.GET)  // vào trang thêm tài khoản
	public String addnewsadmin(ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("tintuc", new TinTucBEAN());
		return "admin/addnewsadmin";
	}
	
	@RequestMapping(value = "addnewsadmin", method = RequestMethod.POST)  // thêm tài khoản
	public String addnewsadmin(@ModelAttribute("tintuc") TinTucBEAN tinTucBEAN, ModelMap modelMap, HttpSession session) {
		tinTucService.create(tinTucBEAN);
		return "redirect:./listnewsadmin.html";
	}
	
	@RequestMapping(value = "updatenewsadmin/{id}", method = RequestMethod.GET)  // vào trang cập nhật tin tức
	public String updatenewsadmin(@PathVariable("id") String id,ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		modelMap.put("tintuc", tinTucService.findById(id));
		return "admin/updatenewsadmin";
	}
	
	@RequestMapping(value = "updatenewsadmin", method = RequestMethod.POST)  // cập nhật tin tức
	public String updatenewsadmin(@ModelAttribute("tintuc") TinTucBEAN tinTucBEAN, ModelMap modelMap, HttpSession session) {
		
		TinTucBEAN tinTucBEAN2 = tinTucService.findById(tinTucBEAN.getId());
		tinTucBEAN2.setLoaitintuc(tinTucBEAN.getLoaitintuc());
		tinTucBEAN2.setTieude(tinTucBEAN.getTieude());
		tinTucBEAN2.setNoidung(tinTucBEAN.getNoidung());
		tinTucBEAN2.setAnh(tinTucBEAN.getAnh());
		tinTucBEAN2.setDuongdan(tinTucBEAN.getDuongdan());
		
		tinTucService.update(tinTucBEAN2);
		modelMap.put("tintuc", tinTucBEAN2);
		
		return "redirect:./listnewsadmin.html";
	}
	
	@RequestMapping(value = "deletenewsadmin/{id}", method = RequestMethod.GET)  // xóa tài khoản
	public String deletenewsadmin(@PathVariable("id") String id,HttpServletRequest request) {
		tinTucService.delete(tinTucService.findById(id));
		return "redirect:../listnewsadmin.html";
	}
	
	@RequestMapping(value = "searchnewsadmin", method = RequestMethod.POST)  // tìm kiếm tin tức
	public String searchnewsadmin(@ModelAttribute("taikhoan") TinTucBEAN tinTucBEAN, ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		
		modelMap.put("danhsachtintuc", tinTucService.findByKey(request.getParameter("keynewsadmin"))); // tìm kiếm by key

		return "admin/listnewsadmin";
	}
	
	@RequestMapping(value = "confirmdeclareadmin/{id}", method = RequestMethod.GET)  // vào trang giám định hồ sơ
	public String confirmdeclareadmin(@PathVariable("id") String id,ModelMap modelMap, HttpSession session) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		HoSoTaiNanBEAN hoSoTaiNanBEAN = hoSoTaiNanService.findById(id);
        modelMap.put("ngaytainan", hoSoTaiNanBEAN.getNgaytainan());
		modelMap.put("hosotainan", hoSoTaiNanService.findById(id));
		
		BaoHiemBEAN baoHiemBEAN = baoHiemService.findById(hoSoTaiNanBEAN.getMabaohiem());
		modelMap.put("mabaohiem", baoHiemBEAN.getLoaibaohiem());
		
		TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findById(hoSoTaiNanBEAN.getMataikhoan());
		modelMap.put("mataikhoan", taiKhoanBEAN.getHoten());
		
		PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN = phieuMuaBaoHiemService.findById(hoSoTaiNanBEAN.getMaphieumuabaohiem());
		modelMap.put("maphieumuabaohiem", phieuMuaBaoHiemBEAN.getGoibaohiem());
		
		modelMap.put("anhhosotainan", hoSoTaiNanBEAN.getAnh());
		
		return "admin/confirmdeclareadmin";
	}
	
	@RequestMapping(value = "viewdeclareadmin/{id}", method = RequestMethod.GET)  // vào trang giám định hồ sơ
	public String viewdeclareadmin(@PathVariable("id") String id,ModelMap modelMap, HttpSession session) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		HoSoTaiNanBEAN hoSoTaiNanBEAN = hoSoTaiNanService.findById(id);
        modelMap.put("ngaytainan", hoSoTaiNanBEAN.getNgaytainan());
		modelMap.put("hosotainan", hoSoTaiNanService.findById(id));
		
		BaoHiemBEAN baoHiemBEAN = baoHiemService.findById(hoSoTaiNanBEAN.getMabaohiem());
		modelMap.put("mabaohiem", baoHiemBEAN.getLoaibaohiem());
		
		TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findById(hoSoTaiNanBEAN.getMataikhoan());
		modelMap.put("mataikhoan", taiKhoanBEAN.getHoten());
		
		PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN = phieuMuaBaoHiemService.findById(hoSoTaiNanBEAN.getMaphieumuabaohiem());
		modelMap.put("maphieumuabaohiem", phieuMuaBaoHiemBEAN.getGoibaohiem());
		
		return "admin/viewdeclareadmin";
	}
	
	@RequestMapping(value = "confirmdeclareadmin", method = RequestMethod.POST)  // cập nhật tin tức
	public String confirmdeclareadmin(@ModelAttribute("hosotainan") HoSoTaiNanBEAN hoSoTaiNanBEAN, ModelMap modelMap, HttpServletRequest request) {
		
		HoSoTaiNanBEAN hoSoTaiNanBEAN2 = hoSoTaiNanService.findById(hoSoTaiNanBEAN.getId());
		
		String xacnhandenbu = "Không";
		if(request.getParameter("xacnhandenbu").equals("true")) {
			xacnhandenbu = "Có";
		}
		
		hoSoTaiNanBEAN2.setAnh(hoSoTaiNanBEAN.getAnh());
		hoSoTaiNanBEAN2.setMucdothiethai(hoSoTaiNanBEAN.getMucdothiethai());
		hoSoTaiNanBEAN2.setMucdodenbu(hoSoTaiNanBEAN.getMucdodenbu());
		hoSoTaiNanBEAN2.setLydo(hoSoTaiNanBEAN.getLydo());
		hoSoTaiNanBEAN2.setXacnhandenbu(xacnhandenbu);
		
		hoSoTaiNanService.update(hoSoTaiNanBEAN2);
		modelMap.put("hosotainan", hoSoTaiNanBEAN2);
		
		return "redirect:./listdeclareadmin.html";
	}
	
	@RequestMapping(value = "deletedeclareadmin/{id}", method = RequestMethod.GET)  // xóa tài khoản
	public String deletedeclareadmin(@PathVariable("id") String id,HttpServletRequest request) {
		hoSoTaiNanService.delete(hoSoTaiNanService.findById(id));
		return "redirect:../listdeclareadmin.html";
	}
	
	@RequestMapping(value = "searchdeclareadmin", method = RequestMethod.POST)  // tìm kiếm hồ sơ tai nạn
	public String searchdeclareadmin(@ModelAttribute("hosotainan") HoSoTaiNanBEAN hoSoTaiNanBEAN, ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		
		modelMap.put("danhsachhosotainan", hoSoTaiNanService.findByKey(request.getParameter("keydeclareadmin"))); // tìm kiếm by key

		return "admin/listdeclareadmin";
	}
	
	@RequestMapping(value = "renewwbuyinsurranceadmin", method = RequestMethod.POST)  // cập nhật tin tức
	public String renewwbuyinsurranceadmin(ModelMap modelMap, HttpServletRequest request) {
		
		PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN = phieuMuaBaoHiemService.findById(request.getParameter("id"));
		String th = request.getParameter("thoihan");
		Integer thoihan = 0;
		
        if(th != null) {
        	thoihan = Integer.parseInt(th);
        }
			
		Date ngayhethan = phieuMuaBaoHiemBEAN.getNgayhethan();
        Calendar c = Calendar.getInstance(); 
        c.setTime(ngayhethan); 
        c.add(Calendar.MONTH, thoihan); // + thêm tháng
        ngayhethan = c.getTime();
        
        phieuMuaBaoHiemBEAN.setNgayhethan(ngayhethan);
        phieuMuaBaoHiemBEAN.setThoihan(phieuMuaBaoHiemBEAN.getThoihan() + thoihan);
		phieuMuaBaoHiemService.update(phieuMuaBaoHiemBEAN);
		modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemBEAN);
		
		return "redirect:./listbuyinsurranceadmin.html";
	}
	
	@RequestMapping(value = "confirmpaymentadmin/{id}", method = RequestMethod.GET)  // vào trang cập nhật bảo hiếm
	public String confirmpaymentadmin(@PathVariable("id") String id,ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN = phieuMuaBaoHiemService.findById(id);
		phieuMuaBaoHiemBEAN.setTrangthaithanhtoan("Đã thanh toán");
		phieuMuaBaoHiemService.update(phieuMuaBaoHiemBEAN);
		modelMap.put("danhsachphieumuabaohiem", baoHiemService.findById(id));
		return "redirect:../listbuyinsurranceadmin.html";
	}
	
	@RequestMapping(value = "updatebuyinsurranceadmin/{id}", method = RequestMethod.GET)  // vào trang cập nhật tin tức
	public String updatebuyinsurranceadmin(@PathVariable("id") String id,ModelMap modelMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("tendangnhapadmin") == null) {
			return "redirect:./loginadmin.html";
		}
		PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN = phieuMuaBaoHiemService.findById(id);
		

		BaoHiemBEAN baoHiemBEAN = baoHiemService.findById(phieuMuaBaoHiemBEAN.getMabaohiem());
		modelMap.put("mabaohiem", baoHiemBEAN.getLoaibaohiem());
		
		TaiKhoanBEAN taiKhoanBEAN = taiKhoanService.findById(phieuMuaBaoHiemBEAN.getMataikhoan());
		modelMap.put("mataikhoan", taiKhoanBEAN.getHoten());
		
        modelMap.put("ngaymua", phieuMuaBaoHiemBEAN.getNgaymua());
        modelMap.put("ngayhethan", phieuMuaBaoHiemBEAN.getNgayhethan());
        
		modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findById(id));
		
		return "admin/updatebuyinsurranceadmin";
	}
	
	@RequestMapping(value = "updatebuyinsurranceadmin", method = RequestMethod.POST)  // thay đổi thông tin tài khoản admin
	public String updatebuyinsurranceadmin(@ModelAttribute("updatebuyinsurranceadmin") PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN, ModelMap modelMap, HttpSession session) {
		PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN2 = phieuMuaBaoHiemService.findById(phieuMuaBaoHiemBEAN.getId());

		phieuMuaBaoHiemBEAN2.setBienso(phieuMuaBaoHiemBEAN.getBienso());
		
		phieuMuaBaoHiemService.update(phieuMuaBaoHiemBEAN2);
		modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemBEAN2);
		
		return "redirect:./listbuyinsurranceadmin.html";
	}
	
	@RequestMapping(value = "deletebuyinsurranceadmin/{id}", method = RequestMethod.GET)  // xóa tài khoản
	public String deletebuyinsurranceadmin(@PathVariable("id") String id,HttpServletRequest request) {
		phieuMuaBaoHiemService.delete(phieuMuaBaoHiemService.findById(id));
		return "redirect:../listbuyinsurranceadmin.html";
	}
	
	@RequestMapping(value = "searchbuyinsurranceadmin", method = RequestMethod.POST)  // tìm kiếm tin tức
	public String searchbuyinsurranceadmin(@ModelAttribute("phieumuabaohiem") PhieuMuaBaoHiemBEAN phieuMuaBaoHiemBEAN, ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		
		modelMap.put("danhsachphieumuabaohiem", phieuMuaBaoHiemService.findByKey(request.getParameter("keybuyinsurranceadmin"))); // tìm kiếm by key

		return "admin/listbuyinsurranceadmin";
	}

}
