CREATE TABLE patients (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE invoices(
  id INT NOT NULL AUTO_INCREMENT,
  total_amount DECIMAL(10,2) NOT NULL,
  generated_at DATETIME NOT NULL,
  payed_at DATETIME,
  medical_history_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE medical_histories(
  id INT NOT NULL AUTO_INCREMENT,
  admitted_at DATETIME NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients(id),
);

CREATE TABLE invoice_items(
  id INT NOT NULL AUTO_INCREMENT,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  invoice_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id)
);
