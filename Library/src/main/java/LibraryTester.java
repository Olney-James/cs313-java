
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/* @author james_olney */
public class LibraryTester {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("libraryJpa");
        EntityManager em = emf.createEntityManager();
        Author author = em.find(Author.class, 1);
        //System.out.println("Author: " + author.getName());

        Query query = em.createQuery("SELECT m FROM Author m");
        List<Author> authors = query.getResultList();

        //BELOW IS COMMENTED OUT TO AVOID ENTERING THE SAME ROWS INTO THE DATABASE EVERYTIME I RUN
        
        //em.getTransaction().begin();
        //Author newAuthor = new Author();
        //newAuthor.setName("Brandon Sanderson");
        //em.persist(newAuthor);
        //em.getTransaction().commit();
        /*em.getTransaction().begin();

        Book newBook = new Book();
        newBook.setTitle("Elantris");
        Author firstAuthor = em.find(Author.class, 3);
        newBook.setAuthor(firstAuthor);
        em.persist(newBook);
        em.getTransaction().commit();*/
        
        System.out.println("Below is a list of all authors: ");
        for (Author a : authors) {
            System.out.println("Author: " + a.getName());
        }
        System.out.println();

        Query bookQuery = em.createQuery("SELECT b FROM Book b");
        List<Book> books = bookQuery.getResultList();

        System.out.println("Below is a list of all books with their respective authors: ");
        for (Book book : books) {
            System.out.println("Book: " + book.getTitle() + " written by: " + book.getAuthor().getName());
        }
        System.out.println();

        Query booksQuery = em.createQuery("SELECT b FROM Author b");
        List<Author> booksByAuthor = booksQuery.getResultList();

        System.out.println("Below is a list all authors with their respective books: ");
        for (Author a : booksByAuthor) {
            System.out.println("Author: " + a.getName());

            for (Book b : a.getBooks()) {
                System.out.println("     Book: " + b.getTitle());
            }
        }

        em.close();

    }
}
