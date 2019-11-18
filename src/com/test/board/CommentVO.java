package com.test.board;
/*
	IDX     NUMBER(6)       PRIMARY KEY NOT NULL,
    BIDX    NUMBER(6),
    WRITER  VARCHAR2(20),
    CONTENT VARCHAR2(2000),
    WDATE   DATE
 */
public class CommentVO {
	private int idx;
	private int bidx;
	private String writer;
	private String content;
	private String wdate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
