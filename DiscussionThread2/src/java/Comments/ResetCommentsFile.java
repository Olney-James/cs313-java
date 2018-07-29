package Comments;

import Comments.model.Comment;
import Comments.model.FileCommentHandler;

/* @author james_olney */
public class ResetCommentsFile {
    Comment comment1;
    Comment comment2;
    Comment comment3;

    public void createCommentsFile(){
        comment1 = new Comment("test", "test");
        comment2 = new Comment("cool", "james");
        comment3 = new Comment("beans", "camilla");

        FileCommentHandler handler = new FileCommentHandler("CommentList.txt");
        handler.addComment(comment1);
        handler.addComment(comment2);
        handler.addComment(comment3);
    }
}