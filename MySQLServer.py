#!/usr/bin/env python3

import mysql.connector


def create_database():
    """
    Creates the alx_book_store database in MySQL server.
    Handles connection errors and ensures proper resource cleanup.
    """
    connection = None
    cursor = None
    
    try:
        # Establish connection to MySQL server
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password=''  # Update with your MySQL root password if needed
        )
        
        if connection.is_connected():
            # Create cursor object
            cursor = connection.cursor()
            
            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            
            # Commit the transaction
            connection.commit()
            
            # Print success message
            print("Database 'alx_book_store' created successfully!")
    
    except mysql.connector.Error as e:
        # Handle and print database connection/creation errors
        print(f"Error while connecting to MySQL: {e}")
    
    finally:
        # Ensure proper cleanup of resources
        if cursor is not None:
            cursor.close()
        
        if connection is not None and connection.is_connected():
            connection.close()


if __name__ == "__main__":
    create_database()
