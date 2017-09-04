package video.module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
