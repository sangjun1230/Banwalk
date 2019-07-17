package com.road.json;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.road.biz.RoadBiz;
import com.road.vo.RoadVo;

public class JsonData {
	
	public static void main(String[] args) throws IOException, ParseException {
		
		String strUrl = "http://api.data.go.kr/openapi/sttree-stret-info-std";
	    strUrl += "?serviceKey=7qZz4rKVp8%2B34BHQ8blvby7IJ%2BTJA9FsZG3VEAnCidrdzZveATCuk5LiN48qcCi0W%2BwLWIF7S%2FZRvt1t2ZrvNQ%3D%3D";
	    strUrl += "&type=json";
	    strUrl += "&pageNo=0";
	    
	    strUrl += "&numOfRows=58"; strUrl += "&insttCode=3210000";
	
	    URL url = new URL(strUrl);
	    URLConnection urlConnection = url.openConnection();
	    HttpURLConnection connection = null;
	    if(urlConnection instanceof HttpURLConnection)
	    {
	        connection = (HttpURLConnection) urlConnection;
	    }
	    else
	    {
	        System.out.println("error");
	        return;
	    }
	    BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	    String urlString = "";
	    String current;
	    while((current = in.readLine()) != null)
	    {
	        urlString = current;
	    }
	    
	    //System.out.println(urlString);// 이것을 지도 맵핑할 jsp로 ajax이용 // 다음지도에서 추가해주는 메소드 (마커입력) // string값으로 지도에 쏴주는지 (ajax통해서) 
	 
	    RoadBiz roadBiz = new RoadBiz();
	    
	    ArrayList<String> arsttreestretnm = new ArrayList<String>();
	    ArrayList<String> arstartlnmadr = new ArrayList<String>();
	    ArrayList<String> arstartlatitude = new ArrayList<String>();
	    ArrayList<String> arendlnmadr = new ArrayList<String>();
	    ArrayList<String> arendlatitude = new ArrayList<String>();
	    ArrayList<String> arsttreeknd = new ArrayList<String>();
	    ArrayList<String> arsttreeco = new ArrayList<String>();
	    ArrayList<String> arsttreestretlt = new ArrayList<String>();
	    ArrayList<String> arpltyear = new ArrayList<String>();
	    ArrayList<String> arsttreestretintrcn = new ArrayList<String>();
	    ArrayList<String> arroadnm = new ArrayList<String>();
	    ArrayList<String> arroadknd = new ArrayList<String>();
	    ArrayList<String> arroadsctn = new ArrayList<String>();
	    ArrayList<String> arphonenumber = new ArrayList<String>();
	    ArrayList<String> arinstitutionnm = new ArrayList<String>();
	    ArrayList<String> arreferencedate = new ArrayList<String>();
	    ArrayList<String> arinsttcode = new ArrayList<String>();
	    ArrayList<String> arinsttnm = new ArrayList<String>();
	    
	    JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParser.parse(urlString);
		JSONObject response = (JSONObject)jsonObj.get("response");
		JSONObject body = (JSONObject)response.get("body");
		JSONArray items = (JSONArray)body.get("items");
	    
		items.toString();
		
	    for(int i=0; i < items.size(); i++) {
	    	JSONObject obj = (JSONObject) items.get(i);
	    	
	    	String sttreestretnm = (obj.get("sttreeStretNm")).toString();
	    	String startlnmadr = (obj.get("startLnmadr")).toString();
	    	String startlatitude = (obj.get("startLatitude")).toString();
	    	String endlnmadr = (obj.get("endLnmadr")).toString();
	    	String endlatitude = (obj.get("endLatitude")).toString();
	    	String sttreeknd = (obj.get("sttreeKnd")).toString();
	    	String sttreeco = (obj.get("sttreeCo")).toString();
	    	String sttreestretlt = (obj.get("sttreeStretLt")).toString();
	    	String pltyear = (obj.get("pltYear")).toString();
	    	String sttreestretintrcn = (obj.get("sttreeStretIntrcn")).toString();
	    	String roadnm = (obj.get("roadNm")).toString();
	    	String roadknd = (obj.get("roadKnd")).toString();
	    	String roadsctn = (obj.get("roadSctn")).toString();
	    	String phonenumber = (obj.get("phoneNumber")).toString();
	    	String institutionnm = (obj.get("institutionNm")).toString();
	    	String referencedate = (obj.get("referenceDate")).toString();
	    	String insttcode = (obj.get("insttCode")).toString();
	    	String insttnm = (obj.get("insttNm")).toString();
	    	
	    	arsttreestretnm.add(sttreestretnm);
	    	arstartlnmadr.add(startlnmadr);
	    	arstartlatitude.add(startlatitude);
	    	arendlnmadr.add(endlnmadr);
	    	arendlatitude.add(endlatitude);
	    	arsttreeknd.add(sttreeknd);
	    	arsttreeco.add(sttreeco);
	    	arsttreestretlt.add(sttreestretlt);
	    	arpltyear.add(pltyear);
	    	arsttreestretintrcn.add(sttreestretintrcn);
	    	arroadnm.add(roadnm);
	    	arroadknd.add(roadknd);
	    	arroadsctn.add(roadsctn);
	    	arphonenumber.add(phonenumber);
	    	arinstitutionnm.add(institutionnm);
	    	arreferencedate.add(referencedate);
	    	arinsttcode.add(insttcode);
	    	arinsttnm.add(insttnm);
	    }
	    	
	    for(int j=0; j < items.size(); j++) {
	    	RoadVo rv = new RoadVo(arsttreestretnm.get(j), arstartlnmadr.get(j), arstartlatitude.get(j), arendlnmadr.get(j),
	    	arendlatitude.get(j), arsttreeknd.get(j), arsttreeco.get(j), arsttreestretlt.get(j), arpltyear.get(j),
	    	arsttreestretintrcn.get(j),	arroadnm.get(j), arroadknd.get(j), arroadsctn.get(j), arphonenumber.get(j),
	    	arinstitutionnm.get(j),	arreferencedate.get(j),	arinsttcode.get(j),	arinsttnm.get(j));
	    	
	    	System.out.println(rv.toString());
	    	
	    	roadBiz.storageData(rv);
	    } 
    
	}
 }
