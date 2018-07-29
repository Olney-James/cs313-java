package Comments;

import Comments.model.Comment;
import Comments.model.FileCommentHandler;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/* @author james_olney */
public class ResetCommentsFile {
    Comment comment1;
    Comment comment2;
    Comment comment3;

    public void createCommentsFile(){
        DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
        Date today = Calendar.getInstance().getTime();
        String logDate = df.format(today);
        comment1 = new Comment("test", logDate, "test");
        comment2 = new Comment("cool", logDate, "james");
        comment3 = new Comment("beans", logDate, "camilla");

        FileCommentHandler handler = new FileCommentHandler("CommentList2.txt");
        handler.addComment(comment1);
        handler.addComment(comment2);
        handler.addComment(comment3);
    }
}