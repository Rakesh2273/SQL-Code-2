import sqlite3

# Connect to the database
conn = sqlite3.connect('company_data.db')
cursor = conn.cursor()

# Create a table
cursor.execute('''CREATE TABLE IF NOT EXISTS employees (id INTEGER PRIMARY KEY, name TEXT, age INTEGER, department TEXT)''')

# Insert sample data
cursor.execute('''INSERT INTO employees (name, age, department) VALUES ('John Doe', 30, 'Finance'), ('Jane Smith', 25, 'IT')''')
conn.commit()

# Query data
cursor.execute('SELECT * FROM employees')
rows = cursor.fetchall()

# Display results
for row in rows:
    print(row)

conn.close()
