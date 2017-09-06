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
			dto.setVidLike(rs.getInt("vidLike"));
			dto.setVidSub(rs.getString("vidSub"));
			dto.setVidContent(rs.getString("vidContent"));
			listMember.add(dto);
		}
		return listMember;
	}
	//個人list
	public List<VideoDTO> list(Integer memNo) throws Exception{
		System.out.println("video list");
		String sql = "select * from video where memNo="+memNo;
		List<VideoDTO> vlist = null;
		try{
			System.out.println(1);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			vlist = makeList(rs);
			System.out.println(2);
			for(VideoDTO dto :vlist) {
				System.out.println(dto.getVidAddr());
			}
			return vlist;
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("erorr");
			return vlist;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<VideoDTO> listAll() throws Exception{
		System.out.println("video list");
		String sql = "select * from video";
		List<VideoDTO> allList = null;
		try{
			System.out.println(1);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			allList = makeList(rs);
			System.out.println(2);
			for(VideoDTO dto :allList) {
				System.out.println(dto.getVidAddr());
			}
			return allList;
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("erorr");
			return allList;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	//挿入
	public String createOne(VideoDTO dto) throws Exception{
		String result="register error";
		String sql = "insert into video ( memNo, vidAddr, vidDate, vidLike, vidSub, vidContent) values ("
				+ "'"+dto.getMemNo()+"', '"+dto.getVidAddr()+"', sysdate(), 0 , '"+dto.getVidSub()+"','"+dto.getVidContent()+"')";
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
	//修正
	public String update(VideoDTO dto) throws Exception{
		String sql = "update video set vidAddr='"+dto.getVidAddr()+"', vidSub='"+dto.getVidSub()+"','"+dto.getVidContent()+" where vidNo='"+dto.getVidNo()+"'";	
		String result=null;
		try{
			ps = con.prepareStatement(sql);
			int res = ps.executeUpdate();
			if(res<1) result = "update error";
			else result = dto.getVidSub()+" の情報が修正されました。";
			return result;
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
