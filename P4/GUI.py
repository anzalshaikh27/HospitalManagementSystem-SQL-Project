import sys
from PyQt5.QtWidgets import QApplication, QMainWindow, QTableWidget, QTableWidgetItem, QVBoxLayout, QWidget, QPushButton, QLineEdit, QLabel, QMessageBox, QTabWidget
import pyodbc

class HospitalManagementApp(QMainWindow):
    def __init__(self):
        super().__init__()

        # Connect to the database
        connection_string = (
            r"Driver={ODBC Driver 17 for SQL Server};"
            r"Server=Anzal\ANZALSQL;"
            r"Database=HospitalManagementSystem;"
            r"Trusted_Connection=yes;"
        )
        self.connection = pyodbc.connect(connection_string)

        # Set up the main window
        self.setWindowTitle("Hospital Management System")
        self.setGeometry(100, 100, 800, 600)

        # Initialize QTableWidget instances
        self.ward_table = QTableWidget(self)
        self.doctor_table = QTableWidget(self)
        self.dispensary_table = QTableWidget(self)
        self.item_type_table = QTableWidget(self)

        # Create widgets
        self.create_widgets()

    def create_widgets(self):
        # Create widgets for Ward table
        self.ward_table.setColumnCount(4)
        self.ward_table.setHorizontalHeaderLabels(["Room_ID", "Bed_Number", "Ward_Type", "Floor_Number"])

        self.bed_number_entry = QLineEdit(self)
        self.ward_type_entry = QLineEdit(self)
        self.floor_number_entry = QLineEdit(self)

        bed_number_label = QLabel("Bed Number:", self)
        ward_type_label = QLabel("Ward Type:", self)
        floor_number_label = QLabel("Floor Number:", self)

        add_ward_button = QPushButton("Add Ward", self)
        update_ward_button = QPushButton("Update Ward", self)
        delete_ward_button = QPushButton("Delete Ward", self)

        # Create widgets for Doctor table
        self.doctor_table.setColumnCount(3)
        self.doctor_table.setHorizontalHeaderLabels(["D_Employee_ID", "Doctor_Specialty", "Admission_Date"])

        self.d_employee_id_entry = QLineEdit(self)
        self.doctor_specialty_entry = QLineEdit(self)
        self.admission_date_entry = QLineEdit(self)

        d_employee_id_label = QLabel("Doctor Employee ID:", self)  


        doctor_specialty_label = QLabel("Doctor Specialty:", self)
        admission_date_label = QLabel("Admission Date:", self)

        add_doctor_button = QPushButton("Add Doctor", self)
        update_doctor_button = QPushButton("Update Doctor", self)
        delete_doctor_button = QPushButton("Delete Doctor", self)

        # Create widgets for Dispensary table
        self.dispensary_table.setColumnCount(4)
        self.dispensary_table.setHorizontalHeaderLabels(["Item_ID", "Last_Stock_Up_Date", "Quantity", "Department_ID"])

        self.last_stock_date_entry = QLineEdit(self)
        self.quantity_entry = QLineEdit(self)
        self.department_id_entry = QLineEdit(self)

        last_stock_date_label = QLabel("Last Stock Up Date:", self)
        quantity_label = QLabel("Quantity:", self)
        department_id_label = QLabel("Department ID:", self)

        add_dispensary_button = QPushButton("Add Dispensary Item", self)
        update_dispensary_button = QPushButton("Update Dispensary Item", self)
        delete_dispensary_button = QPushButton("Delete Dispensary Item", self)

        # Create widgets for Item_Type table
        self.item_type_table.setColumnCount(2)
        self.item_type_table.setHorizontalHeaderLabels(["Item Type Number", "Item Name"])

        self.item_type_name_entry = QLineEdit(self)

        item_type_name_label = QLabel("Item Type Name:", self)

        add_item_type_button = QPushButton("Add Item Type", self)
        update_item_type_button = QPushButton("Update Item Type", self)
        delete_item_type_button = QPushButton("Delete Item Type", self)

        

        # Set up layout for Ward table
        ward_layout = QVBoxLayout()
        ward_layout.addWidget(self.ward_table)
        ward_layout.addWidget(bed_number_label)
        ward_layout.addWidget(self.bed_number_entry)
        ward_layout.addWidget(ward_type_label)
        ward_layout.addWidget(self.ward_type_entry)
        ward_layout.addWidget(floor_number_label)
        ward_layout.addWidget(self.floor_number_entry)
        ward_layout.addWidget(add_ward_button)
        ward_layout.addWidget(update_ward_button)
        ward_layout.addWidget(delete_ward_button)

        ward_container = QWidget()
        ward_container.setLayout(ward_layout)

        # Set up layout for Doctor table
        doctor_layout = QVBoxLayout()
        doctor_layout.addWidget(self.doctor_table)
        doctor_layout.addWidget(d_employee_id_label)  # Added line
        doctor_layout.addWidget(self.d_employee_id_entry)  # Added line
        doctor_layout.addWidget(doctor_specialty_label)
        doctor_layout.addWidget(self.doctor_specialty_entry)
        doctor_layout.addWidget(admission_date_label)
        doctor_layout.addWidget(self.admission_date_entry)
        doctor_layout.addWidget(add_doctor_button)
        doctor_layout.addWidget(update_doctor_button)
        doctor_layout.addWidget(delete_doctor_button)

        doctor_container = QWidget()
        doctor_container.setLayout(doctor_layout)

        # Set up layout for Dispensary table
        dispensary_layout = QVBoxLayout()
        dispensary_layout.addWidget(self.dispensary_table)
        dispensary_layout.addWidget(last_stock_date_label)
        dispensary_layout.addWidget(self.last_stock_date_entry)
        dispensary_layout.addWidget(quantity_label)
        dispensary_layout.addWidget(self.quantity_entry)
        dispensary_layout.addWidget(department_id_label)
        dispensary_layout.addWidget(self.department_id_entry)
        dispensary_layout.addWidget(add_dispensary_button)
        dispensary_layout.addWidget(update_dispensary_button)
        dispensary_layout.addWidget(delete_dispensary_button)

        dispensary_container = QWidget()
        dispensary_container.setLayout(dispensary_layout)

        # Set up layout for Item_Type table
        item_type_layout = QVBoxLayout()
        item_type_layout.addWidget(self.item_type_table)
        item_type_layout.addWidget(item_type_name_label)
        item_type_layout.addWidget(self.item_type_name_entry)
        item_type_layout.addWidget(add_item_type_button)
        item_type_layout.addWidget(update_item_type_button)
        item_type_layout.addWidget(delete_item_type_button)

        item_type_container = QWidget(self)
        item_type_container.setLayout(item_type_layout)

        # Create a tab widget to organize tables
        tab_widget = QTabWidget(self)
        tab_widget.addTab(ward_container, "Ward")
        tab_widget.addTab(doctor_container, "Doctor")
        tab_widget.addTab(dispensary_container, "Dispensary")
        tab_widget.addTab(item_type_container, "Item_Type")

        self.setCentralWidget(tab_widget)

        # Connect buttons to functions
        add_ward_button.clicked.connect(self.add_ward)
        update_ward_button.clicked.connect(self.update_ward)
        delete_ward_button.clicked.connect(self.delete_ward)

        add_doctor_button.clicked.connect(self.add_doctor)
        update_doctor_button.clicked.connect(self.update_doctor)
        delete_doctor_button.clicked.connect(self.delete_doctor)

        add_dispensary_button.clicked.connect(self.add_dispensary_item)
        update_dispensary_button.clicked.connect(self.update_dispensary_item)
        delete_dispensary_button.clicked.connect(self.delete_dispensary_item)

        add_item_type_button.clicked.connect(self.add_item_type)
        update_item_type_button.clicked.connect(self.update_item_type)
        delete_item_type_button.clicked.connect(self.delete_item_type)
        
        # Load data on startup
        self.load_data()
        self.load_doctor_data()
        self.load_dispensary_data()
        self.load_item_type_data()

    def load_data(self):
        try:
            # Implement loading data for the ward table
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM Ward")
            rows = cursor.fetchall()

            # Clear existing data in the ward_table
            self.ward_table.setRowCount(0)

            # Insert new data into the ward_table
            for row_num, row_data in enumerate(rows):
                self.ward_table.insertRow(row_num)
                for col_num, col_data in enumerate(row_data):
                    item = QTableWidgetItem(str(col_data))
                    self.ward_table.setItem(row_num, col_num, item)

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error loading ward data: {str(e)}")
        finally:
            cursor.close()

    def add_ward(self):
        try:
            # Implement adding ward
            bed_number = self.bed_number_entry.text()
            ward_type = self.ward_type_entry.text()
            floor_number = self.floor_number_entry.text()

            cursor = self.connection.cursor()
            cursor.execute(
                "INSERT INTO Ward (Bed_Number, Ward_Type, Floor_Number) VALUES (?, ?, ?)",
                (bed_number, ward_type, floor_number)
            )
            self.connection.commit()
            self.load_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error adding ward: {str(e)}")

    def update_ward(self):
        try:
            # Implement updating ward
            selected_item = self.ward_table.currentItem()
            if not selected_item:
                QMessageBox.warning(self, "Warning", "Please select a ward to update.")
                return

            row = selected_item.row()
            room_id = self.ward_table.item(row, 0).text()
            bed_number = self.bed_number_entry.text()
            ward_type = self.ward_type_entry.text()
            floor_number = self.floor_number_entry.text()

            cursor = self.connection.cursor()
            cursor.execute(
                "UPDATE Ward SET Bed_Number=?, Ward_Type=?, Floor_Number=? WHERE Room_ID=?",
                (bed_number, ward_type, floor_number, room_id)
            )
            self.connection.commit()
            self.load_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error updating ward: {str(e)}")

    def delete_ward(self):
        try:
            # Implement deleting ward
            selected_item = self.ward_table.currentItem()
            if not selected_item:
                QMessageBox.warning(self, "Warning", "Please select a ward to delete.")
                return

            row = selected_item.row()
            room_id = self.ward_table.item(row, 0).text()

            cursor = self.connection.cursor()
            cursor.execute("DELETE FROM Ward WHERE Room_ID=?", room_id)
            self.connection.commit()
            self.load_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error deleting ward: {str(e)}")

    def load_doctor_data(self):
        try:
            # Implement loading data for the doctor table
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM Doctor")
            rows = cursor.fetchall()

            self.doctor_table.setRowCount(0)

            for row_num, row_data in enumerate(rows):
                self.doctor_table.insertRow(row_num)
                for col_num, col_data in enumerate(row_data):
                    item = QTableWidgetItem(str(col_data))
                    self.doctor_table.setItem(row_num, col_num, item)

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error loading doctor data: {str(e)}")
        finally:
            cursor.close()

    def add_doctor(self):
        try:
        # Implement adding doctor
            new_values = (
                self.d_employee_id_entry.text(),  # Added line
                self.doctor_specialty_entry.text(),
                self.admission_date_entry.text()
            )

            cursor = self.connection.cursor()
            cursor.execute(
                "INSERT INTO Doctor (D_Employee_ID, Doctor_Specialty, Admission_Date) VALUES (?, ?, ?)",
                new_values
            )
            self.connection.commit()

            self.load_doctor_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error adding doctor: {str(e)}")

    def update_doctor(self):
        try:
            # Implement updating doctor
            selected_item = self.doctor_table.currentItem()
            if not selected_item:
                QMessageBox.warning(self, "Warning", "Please select a doctor to update.")
                return

            row = selected_item.row()
            d_employee_id = self.doctor_table.item(row, 0).text()
            new_values = (
                self.d_employee_id_entry.text(),  # Added line
                self.doctor_specialty_entry.text(),
                self.admission_date_entry.text()
            )

            cursor = self.connection.cursor()
            cursor.execute(
                "UPDATE Doctor SET D_Employee_ID=?, Doctor_Specialty=?, Admission_Date=? WHERE D_Employee_ID=?",
                (*new_values, d_employee_id)
            )
            self.connection.commit()

            self.load_doctor_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error updating doctor: {str(e)}")

    def delete_doctor(self):
        try:
            # Implement deleting doctor
            selected_item = self.doctor_table.currentItem()
            if not selected_item:
                QMessageBox.warning(self, "Warning", "Please select a doctor to delete.")
                return

            row = selected_item.row()
            d_employee_id = self.doctor_table.item(row, 0).text()

            cursor = self.connection.cursor()
            cursor.execute("DELETE FROM Doctor WHERE D_Employee_ID=?", d_employee_id)
            self.connection.commit()

            self.load_doctor_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error deleting doctor: {str(e)}")


    def load_dispensary_data(self):
        try:
            # Implement loading data for the dispensary table
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM Dispensary")
            rows = cursor.fetchall()

            self.dispensary_table.setRowCount(0)

            for row_num, row_data in enumerate(rows):
                self.dispensary_table.insertRow(row_num)
                for col_num, col_data in enumerate(row_data):
                    item = QTableWidgetItem(str(col_data))
                    self.dispensary_table.setItem(row_num, col_num, item)

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error loading dispensary data: {str(e)}")
        finally:
            cursor.close()


    def add_dispensary_item(self):
        try:
        # Implement adding dispensary item
            new_values = (
                self.last_stock_date_entry.text(),
                self.quantity_entry.text(),
                self.department_id_entry.text()
            )

            cursor = self.connection.cursor()
            cursor.execute(
                "INSERT INTO Dispensary (Last_Stock_Up_Date, Quantity, Department_ID) VALUES (?, ?, ?)",
                new_values
            )
            self.connection.commit()

            self.load_dispensary_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error adding dispensary item: {str(e)}")

    def update_dispensary_item(self):
        try:
        # Implement updating dispensary item
            selected_item = self.dispensary_table.currentItem()
            if not selected_item:
                QMessageBox.warning(self, "Warning", "Please select an item to update.")
                return

            row = selected_item.row()
            item_id = self.dispensary_table.item(row, 0).text()
            new_values = (
                self.last_stock_date_entry.text(),
                self.quantity_entry.text(),
                self.department_id_entry.text()
            )

            cursor = self.connection.cursor()
            cursor.execute(
                "UPDATE Dispensary SET Last_Stock_Up_Date=?, Quantity=?, Department_ID=? WHERE Item_ID=?",
                (*new_values, item_id)
            )
            self.connection.commit()

            self.load_dispensary_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error updating dispensary item: {str(e)}")

    def delete_dispensary_item(self):
        try:
        # Implement deleting dispensary item
            selected_item = self.dispensary_table.currentItem()
            if not selected_item:
                QMessageBox.warning(self, "Warning", "Please select an item to delete.")
                return

            row = selected_item.row()
            item_id = self.dispensary_table.item(row, 0).text()

            cursor = self.connection.cursor()
            cursor.execute("DELETE FROM Dispensary WHERE Item_ID=?", item_id)
            self.connection.commit()

            self.load_dispensary_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error deleting dispensary item: {str(e)}")


    def load_item_type_data(self):
        try:
            # Implement loading data for the item_type table
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM Item_Type")
            rows = cursor.fetchall()

            self.item_type_table.setRowCount(0)

            for row_num, row_data in enumerate(rows):
                self.item_type_table.insertRow(row_num)
                for col_num, col_data in enumerate(row_data):
                    item = QTableWidgetItem(str(col_data))
                    self.item_type_table.setItem(row_num, col_num, item)

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error loading item type data: {str(e)}")
        finally:
            cursor.close()

    def add_item_type(self):
        try:
            # Implement adding item type
            item_type_name = self.item_type_name_entry.text()

            cursor = self.connection.cursor()
            cursor.execute(
                "INSERT INTO Item_Type (Item_Name) VALUES (?)",
                (item_type_name,)
            )
            self.connection.commit()

            self.load_item_type_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error adding item type: {str(e)}")

    def update_item_type(self):
        try:
            # Implement updating item type
            selected_item = self.item_type_table.currentItem()
            if not selected_item:
                QMessageBox.warning(self, "Warning", "Please select an item type to update.")
                return

            row = selected_item.row()
            type_id = self.item_type_table.item(row, 0).text()
            item_type_name = self.item_type_name_entry.text()

            cursor = self.connection.cursor()
            cursor.execute(
                "UPDATE Item_Type SET Item_Name=? WHERE Item_type_number=?",
                (item_type_name, type_id)
            )
            self.connection.commit()

            self.load_item_type_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error updating item type: {str(e)}")

    def delete_item_type(self):
        try:
            # Implement deleting item type
            selected_item = self.item_type_table.currentItem()
            if not selected_item:
                QMessageBox.warning(self, "Warning", "Please select an item type to delete.")
                return

            row = selected_item.row()
            type_id = self.item_type_table.item(row, 0).text()

            cursor = self.connection.cursor()
            cursor.execute("DELETE FROM Item_Type WHERE Item_type_number=?", type_id)
            self.connection.commit()

            self.load_item_type_data()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error deleting item type: {str(e)}")


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = HospitalManagementApp()
    window.show()
    sys.exit(app.exec_())
