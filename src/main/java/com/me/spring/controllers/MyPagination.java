package com.me.spring.controllers;

import java.util.ArrayList;
import java.util.List;

public class MyPagination {
	public List<Object> list=null;
	private int recordCount=0;
	private int pagesize=0;
	private int maxPage=0;


	public List getInitPage(List list,int Page,int pagesize){
		List<Object> newList=new ArrayList<Object>();
		this.list=list;
		recordCount=list.size();
		this.pagesize=pagesize;
		this.maxPage=getMaxPage();
		try{
		for(int i=(Page-1)*pagesize;i<=Page*pagesize-1;i++){
			try{
				if(i>=recordCount){break;}
			}catch(Exception e){}
			newList.add((Object)list.get(i));
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return newList;
	}

	public List<Object> getAppointPage(int Page){
		List<Object> newList=new ArrayList<Object>();
		try{
			for(int i=(Page-1)*pagesize;i<=Page*pagesize-1;i++){
				try{
					if(i>=recordCount){break;}
				}catch(Exception e){}
				newList.add((Object)list.get(i));
			}
			}catch(Exception e){
				e.printStackTrace();
			}
			return newList;
	}

	public int getMaxPage(){
		int maxPage=(recordCount%pagesize==0)?(recordCount/pagesize):(recordCount/pagesize+1);
		return maxPage;
	}

	public int getRecordSize(){
		return recordCount;
	}
	

	public int getPage(String str){
		System.out.println("STR:"+str+"&&&&"+recordCount);
		if(str==null){
			str="0";
		}
		int Page=Integer.parseInt(str);
		if(Page<1){
			Page=1;
		}else{
			if(((Page-1)*pagesize+1)>recordCount){
				Page=maxPage;
			}
		}
		return Page;
	}
	public String printCtrl(int Page,String href){
		String strHtml = "</div align='center'>";
		strHtml=strHtml+"<table width='370'  border='0' align='center' cellspacing='0' cellpadding='0'><tr> <td height='24' align='right'>current page:["+Page+"/"+maxPage+"]&nbsp;&nbsp;";
		try{
		if(Page>1){
			strHtml=strHtml+"<a href='?Page=1'>first page</a>";
			strHtml=strHtml+"&nbsp;&nbsp;<a href='"+href+"?Page="+(Page-1)+"'>per page</a>";
		}
		if(Page<maxPage){
			strHtml=strHtml+"&nbsp;&nbsp;<a href='"+href+"?Page="+(Page+1)+"'>next page</a>&nbsp;&nbsp;<a href='"+href+"?Page="+maxPage+"'>last page&nbsp;</a>";
		}
		strHtml=strHtml+"</td> </tr>	</table></div>";
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return strHtml;
	}
	
	
	
	
	public String printCtrl(int Page,String id,String href){
		id="&id="+id;
		String strHtml="<table width='370'  border='0' cellspacing='0' cellpadding='0'><tr> <td height='24' align='right'>current page:["+Page+"/"+maxPage+"]&nbsp;&nbsp;";
		try{
		if(Page>1){
			strHtml=strHtml+"<a href='?Page=1"+id+"'>first page</a>¡¡";
			strHtml=strHtml+"&nbsp;&nbsp;<a href='?Page="+(Page-1)+id+"'>pre page</a>";
		}
		if(Page<maxPage){
			strHtml=strHtml+"&nbsp;&nbsp;<a href='?Page="+(Page+1)+id+"'>next page</a>&nbsp;&nbsp;¡¡<a href='?Page="+maxPage+id+"'>last page&nbsp;</a>";
		}
		strHtml=strHtml+"</td> </tr>	</table>";
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return strHtml;
	}
	
	
}
