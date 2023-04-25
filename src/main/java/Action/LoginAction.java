package Action;

import Bean.LoginBean;

import java.util.ArrayList;
import java.util.List;

import Bean.DataMap;

public class LoginAction {
	public boolean validateLogin(LoginBean loginBean) {
		String usr = loginBean.getUserId();
		String pass = loginBean.getPassword();
		
		if(usr.equals("admin") && pass.equals("admin")) {
			return true;
		}else {
			return false;
		}
	}
	
	public ArrayList<DataMap> getData(){
		ArrayList<DataMap> data = new ArrayList<DataMap>();
		DataMap dm = new DataMap();
		dm.setDepartment("Dep1");
		dm.setStudentId("S1");
		dm.setStudentName("Student 1A");
		dm.setMarks(35);
		data.add(dm);
		
		dm = new DataMap();
		dm.setDepartment("Dep1");
		dm.setStudentId("S2");
		dm.setStudentName("Student 1B");
		dm.setMarks(70);
		data.add(dm);
		
		dm = new DataMap();
		dm.setDepartment("Dep1");
		dm.setStudentId("S3");
		dm.setStudentName("Student 1C");
		dm.setMarks(60);
		data.add(dm);
		
		dm = new DataMap();
		dm.setDepartment("Dep1");
		dm.setStudentId("S4");
		dm.setStudentName("Student 1D");
		dm.setMarks(90);
		data.add(dm);
		
		
		dm = new DataMap();
		dm.setDepartment("Dep2");
		dm.setStudentId("S5");
		dm.setStudentName("Student 2A");
		dm.setMarks(30);
		data.add(dm);
		
		dm = new DataMap();
		dm.setDepartment("Dep3");
		dm.setStudentId("S6");
		dm.setStudentName("Student 3A");
		dm.setMarks(32);
		data.add(dm);
		
		dm = new DataMap();
		dm.setDepartment("Dep3");
		dm.setStudentId("S7");
		dm.setStudentName("Student 3B");
		dm.setMarks(70);
		data.add(dm);
		
		dm = new DataMap();
		dm.setDepartment("Dep3");
		dm.setStudentId("S8");
		dm.setStudentName("Student 3C");
		dm.setMarks(20);
		data.add(dm);
		
		return data;
	}
}
