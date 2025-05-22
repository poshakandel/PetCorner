package com.petcorner.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.petcorner.controller.database.DatabaseConnection;
import com.petcorner.model.User;
import com.petcorner.utility.EncryptDecrypt;

public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	private EncryptDecrypt ed = new EncryptDecrypt();
	// Constructor: Initializes the database connection when an object is created
	public UserDAO() throws ClassNotFoundException, SQLException {
		this.conn = DatabaseConnection.getConnection();
	}

	// Registers a new user in the database
	public boolean register(User user) {
		boolean isUserRegistered = false;
		// SQL statement to insert user details
		String query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
		String passwordHash = ed.encrypt(user.getPassword());
		if (conn != null) {

			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, user.getName());
				ps.setString(2, user.getEmail());
				ps.setString(3, passwordHash);
				
				if (ps.executeUpdate() > 0) {
					isUserRegistered = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isUserRegistered;
	}

	// get all the users from database
	public ArrayList<User> getAllUsers() {
		ArrayList<User> users = new ArrayList<>();
		String query = "SELECT * FROM users";
		if (conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery(); //stores all the user information retrieved by running query in database
				
				// Iterate over result set and populate User objects
				while (rs.next()) {
					User user = new User(
							rs.getInt("user_id"),
							rs.getString("name"),
							rs.getString("email"),
							rs.getString("password"),
							rs.getString("role"),
							rs.getTimestamp("created_at")
							);
					users.add(user);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return users;
	}

	// Authenticates user by checking username and password
	public User login(String username, String password) {
		String passwordHash = ed.encrypt(password);
		User user = null;
		String query = "SELECT * FROM users WHERE name = ? AND password = ?";
		if (conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, username);
				ps.setString(2, passwordHash);
				ResultSet rs = ps.executeQuery();
				
				// If user is found, put values to User object
				if (rs.next()) {
					user = new User(
							rs.getInt("user_id"),
							rs.getString("name"),
							rs.getString("email"),
							rs.getString("password"),
							rs.getString("role"),
							rs.getTimestamp("created_at")
							);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;// Returns null if no match found and returns the user info if user the user was found in database
	}
	
	public int getTotalUsers(String Date) throws SQLException {
		String query = "";
		if (Date.isEmpty()) {
			query = "SELECT COUNT(*) AS total FROM users";
			ps = conn.prepareStatement(query);
		}else {
			query = "SELECT COUNT(*) AS total FROM users WHERE created_at > ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, Date);
		}
		if (conn != null) {
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt("total");
			}
		}
		return 0;		
	}
	
}
