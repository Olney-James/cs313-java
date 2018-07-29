package UserVerification.model;


import UserVerification.model.User;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author james_olney
 */
public class FileUserPassHandler {
    private String fileName;

    public FileUserPassHandler(String fileName) { 
         this.fileName = fileName;
    }
    
    public String getFileName() {
          return fileName;
    }
    
    public void setFileName(String fileName) {
          this.fileName = fileName;
    }
    
    public void addUser(User user) {
          try {
               BufferedWriter writer = new BufferedWriter(new FileWriter(getFileName(), true));
               writer.write(user.toFileString() + "\n");
               writer.close(); 

          } catch (IOException e) { 
               e.printStackTrace();
          }
     }
    
    public List<User> getUser() {
          
        List<User> list = new ArrayList<User>();
        
        try{
            BufferedReader reader = new BufferedReader(new FileReader(getFileName()));//"C:\\Users\\james_olney\\Documents\\NetBeansProjects\\LoginPage\\src\\java\\test.txt"
            String line;

            while ((line = reader.readLine()) != null) {
                 User userPass = new User();
                 userPass.loadFromFileString(line);
                 list.add(userPass);
            }
        }
        catch (IOException e) { 
               e.printStackTrace();
        }
        return list;
     }
}
