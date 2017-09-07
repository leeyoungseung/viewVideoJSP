package video.module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import video.dto.ReplyDTO;
import video.dto.VideoDTO;

public class ReplyDAO {
	Connection con=null;
	PreparedStatement ps = null;
	ResultSet rs =null;
	
	public ReplyDAO() {
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
	
	protected List<ReplyDTO> makeList(ResultSet rs) throws SQLException{
		List<ReplyDTO> listMember = new ArrayList<ReplyDTO>();
		while(rs.next()){
			ReplyDTO dto = new ReplyDTO();
			dto.setReNo(rs.getInt("reNo"));
			dto.setMemNo(rs.getInt("memNo"));
			dto.setVidNo(rs.getInt("vidNo"));
			dto.setWriter(rs.getString("writer"));
			dto.setContent(rs.getString("content"));
			dto.setReDate(rs.getDate("reDate"));
			listMember.add(dto);
		}
		return listMember;
	}
	//최근 생성된 메시지 가져오기
	public List<ReplyDTO> getChatListByRecent(int number){
		List<ReplyDTO> chatList = null;
		String sql = "select * from reply where reNo > (select max(reNo) - ? from reply) order by reDate";
		try{
		  ps = con.prepareStatement(sql);
		  ps.setInt(1, number);
		  rs = ps.executeQuery();
		  chatList = makeList(rs);
		 }catch (Exception e) {
		  e.printStackTrace();
		 }finally {
		  try{
		   if(rs != null) rs.close();
		   if(ps !=null) ps.close();
		  }catch (Exception e) {
		   e.printStackTrace();
		  }
		 }
		 return chatList;
	 }
	//채팅 목록 불러오기
	public List<ReplyDTO> getChatList(String nowTime, ReplyDTO dto){
		System.out.println("nowTime : "+nowTime);
		System.out.println(dto.toString());
		List<ReplyDTO> chatList = null;
		String sql = "select * from reply where vidNo=? order by reNo desc";
		try{
		   ps = con.prepareStatement(sql);
		   ps.setInt(1, dto.getVidNo());
		   rs = ps.executeQuery();
		   chatList = makeList(rs);
		  }catch (Exception e) {
		   e.printStackTrace();
		 }finally {
		   try{
		    if(rs != null) rs.close();
		    if(ps !=null) ps.close();
		   }catch (Exception e) {
		    e.printStackTrace();
		   }
		  }
		  return chatList;
		 }
		 //새로운 메시지 입력
		 public int submit(ReplyDTO dto){
		  String sql = "insert into reply values (null, ? , ?, ? ,? , now())";
		  try{
			  ps = con.prepareStatement(sql);
			  ps.setInt(1, dto.getMemNo());
			  ps.setInt(2,  dto.getVidNo());
			  ps.setString(3, dto.getWriter());
			  ps.setString(4, dto.getContent());
		   return ps.executeUpdate();
		  }catch (Exception e) {
		   e.printStackTrace();
		  }finally {
		   try{
		    if(rs != null) rs.close();
		    if(ps !=null) ps.close();
		   }catch (Exception e) {
		    e.printStackTrace();
		   }
		  }
		  return -1;
		 }
}
