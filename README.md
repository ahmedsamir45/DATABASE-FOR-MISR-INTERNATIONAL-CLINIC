


# DATABASE FOR MISR INTERNATIONAL CLINIC

This project provides a structured SQL-based relational database system designed to manage employee and patient data within a clinic. It includes table creation, data insertion, constraints, queries for data retrieval, and relational links between tables using foreign keys.  

---

## 📁 Project Structure

The database consists of two main tables:
- **employees** – stores clinic staff information.
- **patients** – stores patient information and their assigned doctors.

---

## 🏗️ Step-by-Step Database Construction

### 1. Create the Database
```sql
CREATE DATABASE Misr_international_clinic;
```

### 2. Create the `employees` Table
```sql
CREATE TABLE employees (
  ID INT(255) NOT NULL,
  Fname VARCHAR(50) NOT NULL,
  Lname VARCHAR(50) NOT NULL,
  Salary DECIMAL(18,5) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  Job CHAR(50) NOT NULL
);
```

### 3. Set Primary Key
```sql
ALTER TABLE employees ADD PRIMARY KEY (ID);
```

> 💡 To remove a primary key:
```sql
ALTER TABLE employees DROP PRIMARY KEY;
```

---

## 📌 Data Operations

### 4. Insert Data
```sql
INSERT INTO employees (ID, Fname, Lname, Salary, Address, Job)
VALUES (89104, 'wael', 'ahmed', 1500, 'giza', 'Accountant');
```

### 5. Select Data
- Show specific column:
```sql
SELECT DISTINCT ID FROM employees;
```
- Show multiple columns:
```sql
SELECT ID, Fname FROM employees;
```

### 6. Conditional Data Retrieval
- Salaries <= 3000:
```sql
SELECT ID, Fname, Salary FROM employees WHERE Salary <= 3000;
```
- Use `AND`, `OR`:
```sql
SELECT * FROM employees WHERE Salary > 5000 AND Age > 25;
```
- Pattern matching with `LIKE`:
```sql
SELECT * FROM employees WHERE Fname LIKE 'm%';
```

### 7. Sorting & Limiting
```sql
SELECT * FROM employees ORDER BY Salary ASC;
SELECT * FROM employees LIMIT 10;
```

---

## 🧱 Table Modification

### Add a New Column
```sql
ALTER TABLE employees ADD Age INT(255) NOT NULL AFTER Job;
```

### Drop a Column
```sql
ALTER TABLE employees DROP COLUMN Age;
```

### Drop the Table
```sql
DROP TABLE employees;
```

---

## 🔗 Relational Table: `patients`

### Create the `patients` Table with Foreign Key
```sql
CREATE TABLE patients (
  Patient_ID INT NOT NULL,
  Doctor_ID INT NOT NULL,
  PRIMARY KEY (Patient_ID),
  FOREIGN KEY (Doctor_ID) REFERENCES employees(ID),
  Doctor_examination_days VARCHAR(255)
);
```

### Add a Date Column
```sql
ALTER TABLE patients ADD date_examination DATE;
```

---

## 📊 Useful Queries

### Get All Jobs in Clinic
```sql
SELECT DISTINCT Job FROM employees;
```

### Count Doctors per Day
```sql
SELECT COUNT(Doctor_ID), Doctor_examination_days
FROM patients
GROUP BY Doctor_examination_days;
```

### View All Related Info from Both Tables
```sql
SELECT * FROM employees, patients
WHERE employees.ID = patients.Doctor_ID
GROUP BY Patient_ID;
```

---

## 🧩 Joins & Relationships

### Aliases
```sql
-- e for employees, p for patients
```

### Inner Join
```sql
SELECT p.Patient_ID, e.Fname AS name_dr
FROM patients p
INNER JOIN employees e ON e.ID = p.Doctor_ID;
```

### Right Join
```sql
SELECT p.Patient_ID, e.Fname AS name_dr
FROM patients p
RIGHT JOIN employees e ON p.Doctor_ID = e.ID;
```

### Left Join
```sql
SELECT p.Patient_ID, e.Fname AS name_dr
FROM patients p
LEFT JOIN employees e ON p.Doctor_ID = e.ID;
```

### Union Query
```sql
SELECT Patient_ID AS ALL_id FROM patients
UNION
SELECT ID FROM employees;
```

---

## 📈 ERD (Entity Relationship Diagram)

**Tables:**

### employees
| Column  | Type       | Description       |
|---------|------------|-------------------|
| ID      | INT        | Primary Key       |
| Fname   | VARCHAR(50)| First Name        |
| Lname   | VARCHAR(50)| Last Name         |
| Salary  | DECIMAL    | Employee Salary   |
| Address | VARCHAR    | Home Address      |
| Job     | CHAR       | Job Title         |
| Age     | INT        | Age of Employee   |

### patients
| Column                | Type        | Description                   |
|-----------------------|-------------|-------------------------------|
| Patient_ID            | INT         | Primary Key                   |
| Doctor_ID             | INT         | Foreign Key (employees.ID)    |
| Doctor_examination_days | VARCHAR   | Days of Exam                  |
| date_examination      | DATE        | Exam Date                     |

---

## ✅ Sample Outputs

- **Show All Employees with Salary ≤ 3000**
```sql
SELECT ID, Fname, Salary FROM employees WHERE Salary <= 3000;
```

- **List of Doctors and Their Patients**
```sql
SELECT p.Patient_ID, e.Fname AS name_dr
FROM patients p
INNER JOIN employees e ON e.ID = p.Doctor_ID;
```

---

## 📌 Notes
- Always use `NOT NULL` for fields that must contain data.
- Use `PRIMARY KEY` for uniquely identifying records.
- Use `FOREIGN KEY` to maintain relationships between tables.

---

## 🔐 Author
Ahmed Samir  
GitHub: [@ahmedsamir45](https://github.com/ahmedsamir45)  
Project: DATABASE FOR MISR INTERNATIONAL CLINIC

```

Let me know if you’d like to include images of the ERD or SQL file exports!
