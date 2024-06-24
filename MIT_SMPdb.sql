CREATE DATABASE smpdb;
USE smpdb;

-- Create Organization table
CREATE TABLE Organization (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    address VARCHAR(350) NOT NULL,
    city VARCHAR(50) NOT NULL,
    pincode INT NOT NULL,
    phone_no BIGINT NOT NULL,
    email VARCHAR(254) NOT NULL,
    website VARCHAR(200) NOT NULL,
    gst_no VARCHAR(15) NOT NULL
);

-- Create Employee table
CREATE TABLE Employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(10) NOT NULL,
    name VARCHAR(80) NOT NULL,
    phone_no BIGINT NOT NULL,
    email VARCHAR(254),
    address VARCHAR(350) NOT NULL,
    qualification VARCHAR(50) NOT NULL,
    date_of_joining DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    dob DATE NOT NULL,
    marital_status VARCHAR(10) NOT NULL,
    father_or_husband VARCHAR(80) NOT NULL,
    experience VARCHAR(10) NOT NULL
);

-- Create student table
CREATE TABLE Section (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sec_name VARCHAR(10),
    description TEXT
);

CREATE TABLE StdClass (
    id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(10),
    section_id INT,
    teacher VARCHAR(10),
    description TEXT,
    FOREIGN KEY (section_id) REFERENCES Section(id)
);

CREATE TABLE Religion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10)
);

CREATE TABLE CasteMain (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE CasteSub (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE StudentPersonalDetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    std_id VARCHAR(10),
    std_first_name VARCHAR(100),
    std_middle_name VARCHAR(100),
    std_last_name VARCHAR(100),
    photo VARCHAR(255),
    admission_date DATE,
    std_class_id INT,
    std_section_id INT,
    std_rollno INT,
    dateofbirth DATE,
    aadharnumber BIGINT,
    aadharcard VARCHAR(255),
    caste_main_id INT,
    caste_sub_id INT,
    religion_id INT,
    ph_number_father BIGINT,
    ph_number_mother BIGINT,
    email VARCHAR(254),
    local_address TEXT,
    postal_address TEXT,
    postal_city VARCHAR(100),
    postal_state VARCHAR(50),
    postal_zip_code INT,
    father_occupation VARCHAR(50),
    mother_occupation VARCHAR(50),
    FOREIGN KEY (std_class_id) REFERENCES StdClass(id),
    FOREIGN KEY (std_section_id) REFERENCES Section(id),
    FOREIGN KEY (caste_main_id) REFERENCES CasteMain(id),
    FOREIGN KEY (caste_sub_id) REFERENCES CasteSub(id),
    FOREIGN KEY (religion_id) REFERENCES Religion(id)
);

CREATE TABLE PreviousSchoolDetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    school_name VARCHAR(255),
    school_board VARCHAR(255),
    school_address TEXT,
    school_city VARCHAR(100),
    school_state VARCHAR(100),
    school_zip_code VARCHAR(20),
    school_phone_number VARCHAR(20),
    grade_attended VARCHAR(50),
    start_date DATE,
    end_date DATE,
    reason_for_leaving TEXT,
    transfer_certificate VARCHAR(255),
    FOREIGN KEY (student_id) REFERENCES StudentPersonalDetails(id)
);
