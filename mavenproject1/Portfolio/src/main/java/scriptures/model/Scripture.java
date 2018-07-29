package scriptures.model;

/*@author james_olney */

public class Scripture {
  private String book;
  private int chapter;
  private int verse;

  public Scripture(){
    setBook("");
    setChapter(1);
    setVerse(1);
  }

  public Scripture(String book, int chapter, int verse) {
    this.setBook(book);
    this.setChapter(chapter);
    this.setVerse(verse);
  }

  public String getBook() {
    return book;
  }

  public void setBook(String book) {
    this.book = book;
  }

  public int getChapter() {
    return chapter;
  }

  public void setChapter(int chapter) {
    this.chapter = chapter;
  }

  public int getVerse() {
    return verse;
  }

  public void setVerse(int verse) {
    this.verse = verse;
  }
  @Override
    public String toString() {
      return book + " " + chapter + ":" + verse;
    }
    
    public String toFileString() {
            return book + "," + chapter + "," + verse;
     }

 
     public void loadFromFileString(String str) {
            String[] parts = str.split(",");

            book = parts[0];
            chapter = Integer.parseInt(parts[1]);
            verse = Integer.parseInt(parts[2]);
     }
}
