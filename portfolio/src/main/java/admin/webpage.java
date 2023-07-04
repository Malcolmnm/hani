package admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.junit.runners.Parameterized.Parameters;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.google.protobuf.DescriptorProtos.SourceCodeInfo.Location;

@Controller
public class webpage {

	
	@Inject
	private SqlSessionTemplate sqlSession;

	
	
	@RequestMapping("/admin/admin_main.do")
	public void test(HttpServletRequest req, Model m, @ModelAttribute("board") noticevo noticevo) throws Exception{
		HttpSession se = req.getSession();
		m.addAttribute("unm",se.getAttribute("unm"));
		
		List<noticevo> nc = sqlSession.selectList("noticeDB.select2");
		
		m.addAttribute("nc", nc);			
			
	}
		
	@PostMapping("/admin/okgo.do")
	public void okgo(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("board") noticevo noticevo) throws Exception{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		
		String uid = req.getParameter("uid");
		int w = sqlSession.update("noticeDB.okupdate",uid);
		PrintWriter pw = res.getWriter();
		if(w > 0) {
			pw.write("<script>location.href = './admin_main.do';</script>");
		}
		else {
			System.out.println("Database 오류!!");
		}
	}
		
	@PostMapping("/admin/nogo.do")
	public void nogo(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("board") noticevo noticevo) throws Exception{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");

		String uid = req.getParameter("uid");
		int w = sqlSession.update("noticeDB.noupdate",uid);
		PrintWriter pw = res.getWriter();
		if(w > 0) {
			pw.write("<script>location.href = './admin_main.do';</script>");
		}
		else {
			System.out.println("Database 오류!!");
		}
	}
	
	@RequestMapping("/admin/member_list.do")
	public void mlist(HttpServletRequest req, Model m, @ModelAttribute("board") memberlog memberlog) throws Exception{
		String p = req.getParameter("page");
    	int page = 0;
    	int vpage = 0;
    	if(p==null || p.equals("1") || p=="" || p=="null") {
    		page = 0;
    		vpage = 1;
    	}
    	else {
    		page = (Integer.valueOf(p) * 4) - 4;
    		vpage = Integer.valueOf(p);
    	}
		List<noticevo> ml = sqlSession.selectList("noticeDB.membersel");
		int totals = ml.size();
		int sum = totals - (vpage - 1) * 4;
		int sum2 = totals - (vpage - 1) * 4;
		int delnum = 0;
		while(sum > sum2 - 4) {
			String sid = req.getParameter("sul"+sum);
			if(sid != "") {
				int dno = sqlSession.delete("noticeDB.memberdel",sid);
				delnum += dno;
			}
			sum--;
		}
		List<noticevo> ml2 = sqlSession.selectList("noticeDB.membersel2",page);
        req.setAttribute("totals", totals - delnum);
        req.setAttribute("now_page",vpage);
		m.addAttribute("ml", ml2);
	}
	
	@RequestMapping("/admin/notice_list.do")
	public void nlist(HttpServletRequest req, Model m, @ModelAttribute("board") memberlog memberlog) throws Exception{
		String p = req.getParameter("page");
    	int page = 0;
    	int vpage = 0;
    	if(p==null || p.equals("1") || p=="" || p=="null") {
    		page = 0;
    		vpage = 1;
    	}
    	else {
    		page = (Integer.valueOf(p) * 8) - 8;
    		vpage = Integer.valueOf(p);
    	}
		List<noticevo> ml = sqlSession.selectList("noticeDB.writesel1");
		int totals = ml.size();
		int sum = totals - (vpage - 1) * 8;
		int sum2 = totals - (vpage - 1) * 8;
		int delnum = 0;
		while(sum > sum2 - 8) {
			String nsub = req.getParameter("sul" +sum);
			if(nsub != "") {
				int del = sqlSession.delete("noticeDB.writedel",nsub);
				delnum += del;
			}
			sum--;
		}
		List<noticevo> ml2 = sqlSession.selectList("noticeDB.writesel2",page);
		
		List<noticevo> ml3 = sqlSession.selectList("noticeDB.writesel5");
		
		int arno = ml2.size();
		int arno2 = ml3.size();
		int wrno = 8 - arno;
		int wrno2 = 8 * (vpage - 1)  - arno2;
		if(arno < 8) {
			if(arno == 0) {
				ml2.addAll(sqlSession.selectList("noticeDB.writesel4",wrno2));
			}
			else {
				ml2.addAll(sqlSession.selectList("noticeDB.writesel3",wrno));
			}
		}
		req.setAttribute("totals", totals - delnum);
        req.setAttribute("now_page",vpage);
		m.addAttribute("ml", ml2);
			
	}
	
	@RequestMapping("/admin/notice_write.do")
	public void nwrite(@ModelAttribute("board") writelist writelist) throws Exception{
		
	}
	
	@RequestMapping("/admin/notice_view.do")
	public void viewlist(HttpServletRequest req, Model m, @ModelAttribute("board") memberlog memberlog) throws Exception{
		String nidx = (String)req.getParameter("nidx");
		List<noticevo> ml = sqlSession.selectList("noticeDB.writeview", nidx);
		m.addAttribute("ml",ml);
	}	
	
	@PostMapping("/admin/writego.do")
	public void gowrite(@ModelAttribute("board") writelist writelist) throws Exception{
			sqlSession.insert("noticeDB.writein", writelist);
	}
	
	@PostMapping("/admin/shiftwrite.do")
	public void shiftwrite(HttpServletRequest req, @ModelAttribute("board") writelist writelist) throws Exception{
		//System.out.println(writelist.getNidx());
		sqlSession.update("noticeDB.writeupdate", writelist);
	}
	
	@PostMapping("/admin/shiftdelete.do")
	public void shiftdelete(@ModelAttribute("board") writelist writelist) throws Exception{
		sqlSession.delete("noticeDB.writedelete", writelist);
	}
	
	@RequestMapping("/admin/member_modify.do")
	public void modify(HttpServletRequest req, Model m, @ModelAttribute("board") memberlog memberlog) throws Exception{
		String midx = req.getParameter("midx");
		List<memberlog> mody = sqlSession.selectList("noticeDB.membersel3", midx);
		m.addAttribute("mody",mody);
	}
	
	@RequestMapping("/admin/modify_up.do")
	public void modify_up(@ModelAttribute("board") memberlog memberlog) throws Exception{
		int a = sqlSession.update("noticeDB.modifyupdate", memberlog);
	}
	
	@RequestMapping("/admin/shop_setup.do")
	public void shop(@ModelAttribute("board") memberlog memberlog) throws Exception{
	}
	
	
	@RequestMapping("/admin/imageupload.do")
	public void imgupload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		OutputStream out = null;
		PrintWriter pw = null;
		res.setCharacterEncoding("utf-8");
	    res.setContentType("text/html; charset=utf-8");
	    
	    try {
	    	
	        String fileName = upload.getOriginalFilename(); 
	        byte[] bytes = upload.getBytes();
	       
	        
	        String uploadpath = req.getSession().getServletContext().getRealPath("/product_img/");
	        String imgsave = uploadpath + fileName;
	        System.out.println(imgsave);
	        out = new FileOutputStream(new File(imgsave));
	        out.write(bytes);
	        
	        pw = res.getWriter();
	        String fileurl = "../product_img/" + fileName;
	        pw.println("{\"filename\":\"" + fileName + "\", \"uploaded\":1,\"url\":\"" + fileurl + "\"}");
	        pw.flush();
	        
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
	
	@RequestMapping("/admin/shop_product_list.do")
	public void shoplist() throws Exception{
		
	}
	@RequestMapping("/admin/shop_write.do")
	public void shopwrite(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("board") shopvo shopvo) throws Exception{
		PrintWriter pw = null;
		res.setCharacterEncoding("utf-8");
	    res.setContentType("text/html; charset=utf-8");
		System.out.println(shopvo.getSname());
	    /*
		int sel = sqlSession.insert("noticeDB.shop_insert", shopvo);
		System.out.println(sel);
		pw = res.getWriter();
		if(sel > 0) {
			pw.write("<sript>alert('상품이 등록되었습니다.'); location.href='./shop_product_list.do';</script>");
		}
		else {
			pw.write("<sript>alert('sql 오류'); location.href='./shop_product_write.jsp';</script>");
		}
		*/
	}
}
