package com.test.board;
/*
	IDX     NUMBER(6)       PRIMARY KEY NOT NULL,
    WRITER  VARCHAR2(20),
    SUBJECT VARCHAR2(255),
    CONTENT VARCHAR2(2000),
    WDATE    DATE
 */
public class BoardVO {
	private int idx;
	private String writer;
	private String subject;
	private String content;
	private String wdate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
}
