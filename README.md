
## 🔗 Foreign Key

**Foreign Key** হলো অন্য একটি টেবিলের **Primary Key** এর রেফারেন্স।  
এটি টেবিলগুলোর মধ্যে সম্পর্ক (**relation**) তৈরি করতে ব্যবহৃত হয়।

📌 **উদাহরণ:**

```sql
ranger_id INT REFERENCES rangers(ranger_id)
```

---

## 4️⃣ JOIN কী এবং এটি কিভাবে কাজ করে?

**JOIN** ব্যবহার করে একাধিক টেবিল থেকে সম্পর্কযুক্ত ডেটা একত্রে আনা যায়।  
এটি ডেটাবেজে টেবিলগুলোর মধ্যে সম্পর্ক দেখাতে সাহায্য করে।

### 🔸 JOIN-এর ধরন:

- **INNER JOIN**: দুটি টেবিলের মিল থাকা রেকর্ডগুলো আনে।
- **LEFT JOIN**: বাম পাশের সব ডেটা আনে, ডান পাশে মিল থাকলে সেটাও আনে।
- **RIGHT JOIN**: ডান পাশের সব ডেটা আনে, বাম পাশে মিল থাকলে সেটাও আনে।
- **FULL JOIN**: উভয় পাশের সব ডেটা আনে।

📌 **উদাহরণ:**

```sql
SELECT r.name, s.location
FROM rangers r
JOIN sightings s ON r.ranger_id = s.ranger_id;
```

---

## 5️⃣ GROUP BY কেন ব্যবহার হয়?

`GROUP BY` ব্যবহার করে নির্দিষ্ট একটি কলামের ভিত্তিতে ডেটা **গ্রুপ** করা যায়, এবং প্রতিটি গ্রুপের উপর অ্যাগ্রিগেট ফাংশন (যেমন: `COUNT()`, `SUM()`, `AVG()`) প্রয়োগ করা যায়।

📌 **উদাহরণ:**

```sql
SELECT ranger_id, COUNT(*) AS total_sightings
FROM sightings
GROUP BY ranger_id;
```

এখানে প্রতিটি রেঞ্জারের কতগুলো **sighting** আছে তা গণনা করা হয়।

---

## 6️⃣ COUNT(), SUM(), AVG() কিভাবে কাজ করে?

### 🔢 COUNT():
ডেটার মোট সংখ্যা গণনা করে।

📌 **উদাহরণ:**

```sql
SELECT COUNT(*) FROM sightings;
```

---

### ➕ SUM():
নির্দিষ্ট কলামের সব মান **যোগ** করে।

📌 **উদাহরণ:**

```sql
SELECT SUM(salary) FROM employees;
```

---

### 📊 AVG():
নির্দিষ্ট কলামের **গড় মান** বের করে।

📌 **উদাহরণ:**

```sql
SELECT AVG(age) FROM users;
```

---
