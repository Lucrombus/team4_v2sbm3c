package dev.mvc.tool;

public class test {

  public static void main(String[] args) {
    
 
    
    String str2 = "<!--\r\n"
        + "  * 카카오맵 - 약도서비스\r\n"
        + "  * 한 페이지 내에 약도를 2개 이상 넣을 경우에는\r\n"
        + "  * 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.\r\n"
        + "-->\r\n"
        + "<!-- 1. 약도 노드 -->\r\n"
        + "<div id=\"daumRoughmapContainer1686896688628\" class=\"root_daum_roughmap root_daum_roughmap_landing\"></div>\r\n"
        + "\r\n"
        + "<!-- 2. 설치 스크립트 -->\r\n"
        + "<script charset=\"UTF-8\" class=\"daum_roughmap_loader_script\" src=\"https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js\"></script>\r\n"
        + "\r\n"
        + "<!-- 3. 실행 스크립트 -->\r\n"
        + "<script charset=\"UTF-8\">\r\n"
        + "  new daum.roughmap.Lander({\r\n"
        + "    \"timestamp\" : \"1686896688628\",\r\n"
        + "    \"key\" : \"2f7o3\",\r\n"
        + "    \"mapWidth\" : \"640\",\r\n"
        + "    \"mapHeight\" : \"360\"\r\n"
        + "  }).render();\r\n"
        + "</script>";
    

    str2 = str2.replaceAll("\"mapWidth\" : \"\\d+\"", "\"mapWidth\" : \"100%\"");
    str2 = str2.replaceAll("\"mapHeight\" : \"\\d+\"", "\"mapHeight\" : \"200\"");

    System.out.println(str2);

  }

}
