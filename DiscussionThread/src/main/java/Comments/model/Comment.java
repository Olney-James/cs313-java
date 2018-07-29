package Comments.model;

/*@author james_olney */
public class Comment {
    private String comment;
    private String time;
    private String user;

  public Comment(){
    setComment("");
    setTime("");
    setUser("");
  }

  public Comment(String comment, String time, String user) {
    this.setComment(comment);
    setTime(time);
    this.setUser(user);
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }
  
  public String getTime() {
    return time;
  }

  public void setTime(String time) {
    this.time = time;
  }

    public String getUser() {
    return user;
  }

  public void setUser(String user) {
    this.user = user;
  }
  @Override
    public String toString() {
      return comment + time + user;
    }
    
    public String toFileString() {
            return comment + "," + time + "," + user;
     }

 
     public void loadFromFileString(String str) {
            String[] parts = str.split(",");
            comment = parts[0];
            time = parts[1];
            user = parts[2];
     }
}
