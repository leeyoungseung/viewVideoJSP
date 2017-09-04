package video.module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import video.dto.MemberDTO;

public class MemberDAO {
	Connection con=null;
	PreparedStatement ps = null;
	ResultSet rs =null;
	
	public MemberDAO() {
		// TODO Auto-generated constructor stub
		con = null;
		try {
		 // MySQL用ドライバ呼び出し
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		 // データベース接続
		 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?useUnicode=true&characterEncoding=utf8","root","");
		 System.out.println("MySQLに接続。");
		} catch (SQLException e) {
		 System.out.println("MySQLに接続できませんでした。");
		} catch (Exception e) {
		 System.out.println("システムエラー:" + e.getClass().getName());
		}
	}
	protected List<MemberDTO> makeList(ResultSet rs) throws SQLException{
		List<MemberDTO> listMember = new ArrayList<MemberDTO>();
		while(rs.next()){
			MemberDTO dto = new MemberDTO();
			dto.setMemNo(rs.getInt("memNo"));
			dto.setMemId(rs.getString("memId"));
			dto.setMemPw(rs.getString("memPw"));
			dto.setMemName(rs.getString("memName"));
			listMember.add(dto);
		}
		return listMember;
	}
	//Loginチャック
	public HashMap confirmIDPW(MemberDTO dto) throws Exception{
		System.out.println("confirmIDPW");
		HashMap hm = new HashMap<>();
		String result="エラーが発生しました。";
		Integer resNo=null;
		String sql="select * from member";
		try{
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<MemberDTO> memList = makeList(rs);
			int su=0;
			for(MemberDTO mdto : memList) {
				su++;
				System.out.println("["+su+"] : "+mdto.getMemId());
				
				if(dto.getMemId().equals(mdto.getMemId())) {
					if(dto.getMemPw().equals(mdto.getMemPw())) {
						result=mdto.getMemName()+"様がLoginしました。";
						resNo=1;
						hm.put("result", result);
						hm.put("resNo", resNo);
						hm.put("user", getOne(mdto));
						System.out.println("confirmIDPW"+mdto.toString());
						break;
					}else {
						result="秘密番号が違います。";
						resNo=2;
						hm.put("result", result);
						hm.put("resNo", resNo);
						break;
					}
				}else {
					hm.clear();
					result="登録されてないです。";
					resNo=3;
					hm.put("result", result);
					hm.put("resNo", resNo);
				}
			}
			
			return hm;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	//ID中腹確認
	protected String confirmOnlyId(String memId) throws Exception{
		String result= null;
		String sql="select * from member";
		try{
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<MemberDTO> memList = makeList(rs);
			for(MemberDTO mdto : memList) {
				if(mdto.getMemId().equals(memId)) {
					result= memId;
					break;
				}
			}
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
		}
		return result;
	}
	//挿入
	public String createOne(MemberDTO dto) throws Exception{
		String result="register error";
		if(dto.getMemId().equals(confirmOnlyId(dto.getMemId()))) {
			return result="もう存在するIDです。";
		}
		String sql = "insert into member ( memId, memPw,memName) values ("
				+ "'"+dto.getMemId()+"', '"+dto.getMemPw()+"' , '"+dto.getMemName()+"')";
		try{
			ps = con.prepareStatement(sql);
			int res = ps.executeUpdate();
			if(res<1) result = "register error";
			else result = dto.getMemName()+" 様が登録されました。";
			System.out.println(result);
			return result;
		}catch (Exception e) {
				e.printStackTrace();
			return result;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
			
		}
	}
	//詳細ページ
	public MemberDTO getOne(MemberDTO dto) throws Exception{
		String sql = "select * from member where memNo='"+dto.getMemNo()+"'";
		try{
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			MemberDTO getDTO = makeList(rs).get(0);
			return getDTO;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	//削除
		public String delete(MemberDTO dto) throws Exception{
			String sql = "delete from member where memNo='"+dto.getMemNo()+"'";
			String result = null;
			try{
				ps = con.prepareStatement(sql);
				int res = ps.executeUpdate();
				if(res<1) result = "delete error";
				else result = dto.getMemName()+" 様がの文が削除されました。";
				return result;
			}finally {
				if (ps != null) ps.close();
				if (con != null) con.close();
			}
		}
}
