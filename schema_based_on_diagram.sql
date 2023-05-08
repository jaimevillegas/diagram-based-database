CREATE TABLE patients (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE invoices(
  id INT NOT NULL AUTO_INCREMENT,
  total_amount DECIMAL(10,2) NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMPS,
  medical_history_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE medical_histories(
  id INT NOT NULL AUTO_INCREMENT,
  admitted_at TIMESTAMP NOT NULL,
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
  treatment_id INT NOT NULL, 
  PRIMARY KEY (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id)
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE treatments(
  id INT NOT NULL AUTO_INCREMENT,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE medical_histories_treatments(
  id INT NOT NULL AUTO_INCREMENT,
  medical_history_id INT NOT NULL,
  treatment_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
CREATE INDEX index_invoices ON invoices (medical_history_id);
CREATE INDEX index_medical_histories ON medical_histories (patient_id);
CREATE INDEX index_invoice_items ON invoice_items (invoice_id);
CREATE INDEX index_invoice_treatments ON invoice_items (treatment_id);
CREATE INDEX index_med_hist_medical_history ON medical_histories_medical_history (medical_history_id);
CREATE INDEX index_med_hist_treatments ON medical_histories_treatments (treatment_id);