
# 🛒 Grocery Store Management System  

A powerful **Grocery Management System** designed for **modern retail businesses**, developed by **Resilient Matrix Technologies (RM TECH)**. Built with **PHP**, **MySQL**, and **Android (Java)**, this system streamlines inventory, orders, and deliveries while offering real-time tracking for customers and administrators.

---

## 🌟 Key Features  

### **Admin CMS Features**  
- **Dashboard Overview** - Sales analytics and quick actions  
- **Product Management**  
  - Add/Edit grocery items  
  - Organize by categories (Fruits, Vegetables, Dairy, etc.)  
- **Order Pipeline**  
  - Track orders (Pending → Preparing → On Delivery → Completed)  
- **Customer Management** - View order history and contact details  
- **Promotions** - Create special offers and discounts  

### **Android App Features**  
- **Browse Groceries** - Filter by categories or search  
- **Order Tracking** - Real-time status updates  
- **Secure Checkout** - Multiple payment options  
- **Order History** - View past purchases and receipts  

---

## 🚀 Quick Start  

### **1️⃣ Clone the repository**  
```bash
git clone https://github.com/Ramadhani-Yassin/Grocery-App.git
cd Grocery-App
```

### **2️⃣ Backend Setup (PHP/MySQL)**  
1. Import database:  
   ```bash
   mysql -u root -p grocery < healthykitchendb.sql
   ```
2. Configure database:  
   ```bash
   cp admin/includes/config.example.php admin/includes/config.php
   ```
   Edit with your credentials.

### **3️⃣ Android App Setup**  
1. Open `Grocery-App/Android` in **Android Studio**  
2. Update API base URL in:  
   `app/src/main/java/com/rmtech/grocery/utils/ApiClient.java`  
   ```java
   public static final String BASE_URL = "http://your-domain.com/app/";
   ```
3. Build and run (Android 5.0+ required)  

---

## 💡 Contributing  

We welcome contributions! 🚀 If you'd like to improve this grocery system:  

✅ Submit a **Pull Request (PR)**  
✅ Open an **Issue** for bugs or feature requests  

---

## 📄 License  

MIT License © [Resilient Matrix Technologies](LICENSE)  

---

## 🏆 Developed by  

**Resilient Matrix Technologies (RM TECH)**  
**Empowering Businesses with Smart Tech & Financial Solutions | EST. 29 Nov 2022**  

<div align="center">
  <a href="https://github.com/Ramadhani-Yassin" target="_blank">
    <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
  </a>
  <a href="https://www.linkedin.com/in/ramadhani-yassin-ramadhani/" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn">
  </a>
  <a href="mailto:yasynramah@gmail.com">
    <img src="https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email">
  </a>
  <a href="https://www.instagram.com/rm_tech.tz/" target="_blank">
    <img src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white" alt="Instagram">
  </a>
</div>

---
