package video.module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import video.dto.MemberDTO;
import video.dto.VideoDTO;

public class VideoDAO {
	Connection con=null;
	PreparedStatement ps = null;
	ResultSet rs =null;
	
	public VideoDAO() {
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

	protected List<VideoDTO> makeList(ResultSet rs) throws SQLException{
		List<VideoDTO> listMember = new ArrayList<VideoDTO>();
		while(rs.next()){
			VideoDTO dto = new VideoDTO();
			dto.setVidNo(rs.getInt("vidNo"));
			dto.setMemNo(rs.getInt("memNo"));
			dto.setVidAddr(rs.getString("vidAddr"));
			dto.setVidDate(rs.getDate("vidDate"));
			listMember.add(dto);
		}
		return listMember;
	}
	public List<VideoDTO> list(Integer memNo) throws Exception{
		String sql = "select * from video where memNo="+memNo;
		List<VideoDTO> vlist = null;
		try{
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			vlist = makeList(rs);
			return vlist;
		}catch (Exception e) {
			// TODO: handle exception
			return vlist;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	//挿入
	public String createOne(VideoDTO dto) throws Exception{
		String result="register error";
		String sql = "insert into video ( memNo, vidAddr, sysdate()) values ("
				+ "'"+dto.getMemNo()+"', '"+dto.getVidAddr()+"')";
		try{
			ps = con.prepareStatement(sql);
			int res = ps.executeUpdate();
			if(res<1) result = "register error";
			else result = "登録されました。";
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
	public VideoDTO getOne(Integer dto) throws Exception{
		String sql = "select * from video where vidNo='"+dto+"'";
		try{
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			VideoDTO getDTO = makeList(rs).get(0);
			return getDTO;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	//削除
	public String delete(VideoDTO dto) throws Exception{
		String sql = "delete from video where vidNo='"+dto.getVidNo()+"'";
		String result = null;
		try{
			ps = con.prepareStatement(sql);
			int res = ps.executeUpdate();
			if(res<1) result = "delete error";
			else result ="削除されました。";
			return result;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}
