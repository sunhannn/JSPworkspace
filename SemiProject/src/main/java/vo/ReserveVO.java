package vo;

public class ReserveVO {
	private String R_ID; // 예약자 아이디
	private String R_NAME; // 예약자 이름
	private String R_DATE; // 예약 날짜
	private String R_STIME; // 예약 시작 시간
	private String R_ETIME; // 예약 끝나는 시간
	private String R_PH; // 예약자 핸드폰 번호
	private String R_ROOM; // 예약 방번호
	private int R_NUM; // 예약 번호
	private int R_PRI; // 예약 가격

	public String getR_DATE() {
		return R_DATE;
	}

	public void setR_DATE(String r_DATE) {
		R_DATE = r_DATE;
	}

	public String getR_STIME() {
		return R_STIME;
	}

	public void setR_STIME(String r_STIME) {
		R_STIME = r_STIME;
	}

	public String getR_ETIME() {
		return R_ETIME;
	}

	public void setR_ETIME(String r_ETIME) {
		R_ETIME = r_ETIME;
	}

	public String getR_ID() {
		return R_ID;
	}

	public void setR_ID(String r_ID) {
		R_ID = r_ID;
	}

	public String getR_NAME() {
		return R_NAME;
	}

	public void setR_NAME(String r_NAME) {
		R_NAME = r_NAME;
	}

	public String getR_PH() {
		return R_PH;
	}

	public void setR_PH(String r_PH) {
		R_PH = r_PH;
	}

	public String getR_ROOM() {
		return R_ROOM;
	}

	public void setR_ROOM(String r_ROOM) {
		R_ROOM = r_ROOM;
	}

	public int getR_NUM() {
		return R_NUM;
	}

	public void setR_NUM(int r_NUM) {
		R_NUM = r_NUM;
	}

	public int getR_PRI() {
		return R_PRI;
	}

	public void setR_PRI(int r_PRI) {
		R_PRI = r_PRI;
	}

}
