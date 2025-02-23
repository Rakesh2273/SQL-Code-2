import pandas as pd

# Sample data
data = {
    'Name': ['John', 'Jane', 'Alice', 'Bob', 'Emma', 'Chris'],
    'Age': [30, 25, 35, 40, 28, 33],
    'Salary': [70000, 60000, 80000, 90000, 72000, 65000],
    'Department': ['Finance', 'IT', 'HR', 'Marketing', 'Sales', 'Operations']
}

# Create a DataFrame
df = pd.DataFrame(data)

# Group by department and calculate mean salary
dept_grouped = df.groupby('Department')['Salary'].mean()
print(dept_grouped)

# Calculate total salary
total_salary = df['Salary'].sum()
print(f"Total Salary: {total_salary}")

# Identify employees with salary above average
average_salary = df['Salary'].mean()
high_earners = df[df['Salary'] > average_salary]
print("High earners:")
print(high_earners)

# Add a 10% bonus column
df['Bonus'] = df['Salary'] * 0.1
print(df)

# Sort by age in descending order
df_sorted = df.sort_values(by='Age', ascending=False)
print(df_sorted)
