/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Comments.model;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* @author james_olney*/
public class FileCommentHandler {
    private String fileName;

    public FileCommentHandler(String fileName) { 
         this.fileName = fileName;
    }

     public String getFileName() {
          return fileName;
     }

     public void setFileName(String fileName) {
          this.fileName = fileName;
     }
 
     public void addComment(Comment comment) {
          try {
               BufferedWriter writer = new BufferedWriter(new FileWriter(getFileName(), true));
               writer.write(comment.toFileString() + "\n");
               writer.close(); 

          } catch (IOException e) { 
               e.printStackTrace();
          }
     }

     public List<Comment> getComments() {
        List<Comment> list = new ArrayList<Comment>();

        try {
            BufferedReader reader = new BufferedReader(new FileReader(getFileName()));
            String line;

            while ((line = reader.readLine()) != null) {
                 Comment comment = new Comment();
                 comment.loadFromFileString(line);
                 list.add(comment);
            }
        } 
        catch (IOException e) { 
            e.printStackTrace();
        }
        return list;
     }
}
