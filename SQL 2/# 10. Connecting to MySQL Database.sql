import mysql.connector

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="admin_user",
    password="admin_password",
    database="corporate_db"
)

cursor = conn.cursor()

# Execute a query
cursor.execute("SELECT * FROM employee_details")
rows = cursor.fetchall()

# Print rows
for row in rows:
    print(row)

# Insert a new record
cursor.execute('''INSERT INTO employee_details (name, age, department, salary) VALUES ('Sophie Turner', 29, 'IT', 75000)''')
conn.commit()

# Update salary for an employee
cursor.execute('''UPDATE employee_details SET salary = 80000 WHERE name = 'Sophie Turner' ''')
conn.commit()

# Delete a record
cursor.execute('''DELETE FROM employee_details WHERE name = 'Sophie Turner' ''')
conn.commit()

conn.close()

# Python Code 5: Data Visualization Using Matplotlib
import matplotlib.pyplot as plt

# Sample data
names = ['John', 'Jane', 'Alice', 'Bob', 'Emma', 'Chris']
salaries = [70000, 60000, 80000, 90000, 72000, 65000]

# Plot a bar chart
plt.bar(names, salaries, color='skyblue')
plt.xlabel('Name')
plt.ylabel('Salary')
plt.title('Employee Salaries')
plt.show()

# Create a pie chart
plt.pie(salaries, labels=names, autopct='%1.1f%%', startangle=90)
plt.title('Salary Distribution')
plt.show()

# Scatter plot of salary vs. age
ages = [30, 25, 35, 40, 28, 33]
plt.scatter(ages, salaries, color='green')
plt.xlabel('Age')
plt.ylabel('Salary')
plt.title('Salary vs. Age')
plt.show()
