package Comments.model;

/*@author james_olney */
public class Comment {
    private String comment;
    private String user;

  public Comment(){
    setComment("");
    setUser("");
  }

  public Comment(String comment, String user) {
    this.setComment(comment);
    this.setUser(user);
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

    public String getUser() {
    return user;
  }

  public void setUser(String user) {
    this.user = user;
  }
  @Override
    public String toString() {
      return comment + " --" + user;
    }
    
    public String toFileString() {
            return comment + "," + user;
     }

 
     public void loadFromFileString(String str) {
            String[] parts = str.split(",");

            comment = parts[0];
            user = parts[1];
     }
}
