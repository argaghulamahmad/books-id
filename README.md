# Tugas Akhir Topik Khusus Arsitektur dan Infrastruktur Komputer
## Detail Kelompok
### Anggota Kelompok
- Arga Ghulam Ahmad - 1606821601
- Aditya Yudha Pratama - 1606917683
- Made Wira Dhanar Santika - 1606880996
- Harlan Haidi - 1606877370
### Pembagian Tugas
- Developer and Application Architect
    - Arga Ghulam Ahmad
- Performance Analyst
    - Aditya Yudha Pratama
    - Made Wira Dhanar Santika
    - Harlan Haidi
## Bagaimana Menjalankan Aplikasi Ini
### Requirements
Berikut dependensi (disarankan versi terbaru) yang dibutuhkan untuk menjalankan aplikasi ini
- Kubernetes
- VirtualBox Hypervisor
- Minikube
- Docker
### Cara Menjalankan Aplikasi
Jalankan minikube dengan perintah 
```bash
minikube start
```
Tambahkan kode berikut ke dalam `/etc/hosts` agar cluster dapat diakses melalui domain `books.id` dan `admin.books.id`
```
192.168.99.100 books.id
192.168.99.100 admin.books.id
```
Deploy aplikasi ke kubernetes lokal secara otomatis menggunakan bash script deploy
```bash
chmod +x deploy.sh
./deploy.sh
```
Jalankan minikube dashboard untuk mengetahui informasi cluster aplikasi yang telah dideploy
melalui antarmuka pengguna berbasis web
```bash
minikube dashboard --url
```
Buka link yang diberikan oleh perintah tersebut untuk memeriksa apakah deployments berhasil, services sudah tersedia, dan
pods sudah berjalan dengan baik.
Apabila semua deployments berhasil, semua services sudah tersedia, dan semua pods sudah berjalan dengan baik 
jalankan perintah berikut untuk membuat tabel books pada database, migrasi database, dan seeding data ke database.
```bash
chmod +x post-deploy.sh
./post-deploy.sh
```
Apabila tidak ada error apapun, maka aplikasi siap untuk digunakan.
Silahkan buka link berikut untuk menggunakan aplikasi
- [Client Application](http://books.id)
- [Admin Application](http://admin.books.id)