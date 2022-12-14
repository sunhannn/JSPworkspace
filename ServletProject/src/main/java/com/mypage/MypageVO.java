package com.mypage;

public MypageVO getEmployee(String id) {
	Connection conn = null;
	PreparedStatement pstmt = null; // ready for select Query
	ResultSet rs = null;
	EmployeeVO employee = null;

	String sql = "select * from employees where id = ?";

	try {
		// Connection Database
		conn = DBManager.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);

		rs = pstmt.executeQuery();

		if (rs.next()) { // 조회한 데이터가 존재하므로 아이디는 존재한다는 의미
			employee = new EmployeeVO();
			employee.setId(rs.getString("id"));
			employee.setPass(rs.getString("pass"));
			employee.setName(rs.getString("name"));
			employee.setLev(rs.getString("lev"));
			employee.setEnter(rs.getDate("enter"));
			employee.setGender(rs.getString("gender"));
			employee.setPhone(rs.getString("phone"));
		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.close(conn, pstmt, rs);
	}

	return employee;
}
