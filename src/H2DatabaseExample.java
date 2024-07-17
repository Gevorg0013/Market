import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class H2DatabaseExample {
    public static void main(String[] args) {
        String url = "jdbc:h2:mem:testDB;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE";

        try (Connection connection = DriverManager.getConnection(url)) {
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a simple SQL command to create a table
            statement.execute("CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY, name VARCHAR(255))");

            // Insert some data
            statement.execute("INSERT INTO users (id, name) VALUES (1, 'Alice')");
            statement.execute("INSERT INTO users (id, name) VALUES (2, 'Bob')");

            System.out.println("Database created and data inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
