package com.best.team.community.userClass;

public class Paging {
    private int maxNum; // 전체 글의 개수
    private int pageNum; // 현재 페이지 번호
    private int listCount; // 10 // 페이지당 나타낼 글의 갯수
    private int pageCount; // 2 // 페이지그룹당 페이지 갯수
    private String type;
    private String lane;

    public Paging(int maxNum, int pageNum, int listCount, int pageCount, String type, String lane) {
        this.maxNum = maxNum;
        this.pageNum = pageNum;
        this.listCount = listCount;
        this.pageCount = pageCount;
        this.type = type;
        this.lane = lane;
    }

    @SuppressWarnings("unused")
    public String makeHtmlPaging() {
        // 전체 페이지 갯수  30          10
        int totalPage = (maxNum % listCount > 0) ? maxNum / listCount + 1 : maxNum / listCount;
        // 전체 페이지 그룹 갯수  3           2
        int totalGroup = (totalPage % pageCount > 0) ? totalPage / pageCount + 1 : totalPage / pageCount;
        // 현재 페이지가 속해 있는 그룹 번호
        int currentGroup = (pageNum % pageCount > 0) ? pageNum / pageCount + 1 : pageNum / pageCount;
        return makeHtml(currentGroup, totalPage, type, lane);
    }

    private String makeHtml(int currentGroup, int totalPage, String type, String lane) {
        StringBuffer sb = new StringBuffer();
        // 현재그룹의 시작 페이지 번호 1 * 2 - (2 - 1)
        int start = (currentGroup * pageCount) - (pageCount - 1);
        // 현재그룹의 끝 페이지 번호 2 * 2
        int end = (currentGroup * pageCount >= totalPage) ? totalPage : currentGroup * pageCount;
        //페이징 관련 빈을 만들어서 값을 던져준 다음 자바스크립트에서 처리하자
        if (start != 1) {
            sb.append("<a href='" + boardType + "?pageNum=" + (start - 1) + "'>");
            sb.append("[이전]");
            sb.append("</a>");
        }

        for (int i = start; i <= end; i++) {
            if (pageNum != i) { // 현재 페이지가 아닌 경우 링크처리
                sb.append("<a href='" + boardType + "?pageNum=" + i + "'>");
                sb.append(" [ ");
                sb.append(i);
                sb.append(" ] ");
                sb.append("</a>");
            } else { // 현재 페이지인 경우 링크 해제
                sb.append("<font style='color:red;'>");
                sb.append(" [ ");
                sb.append(i);
                sb.append(" ] ");
                sb.append("</font>");
            }
        }
        if (end != totalPage) {
            sb.append("<a href='" + boardType + "?pageNum=" + (end + 1) + "'>");
            sb.append("[다음]");
            sb.append("</a>");
        }
        return sb.toString();
    }
}