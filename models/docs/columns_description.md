{% docs source_docs %}
Database e-commerce ini dirancang untuk mendukung operasional platform dengan tabel-tabel yang terstruktur mencakup berbagai aspek bisnis. Tabel customers menyimpan data pelanggan, sedangkan tabel geolocation mengelola informasi geografis untuk pengiriman. Transaksi direpresentasikan melalui tabel orders, yang terhubung dengan tabel order_items untuk detail produk dalam pesanan, tabel order_payments untuk informasi pembayaran, dan tabel order_reviews untuk ulasan pelanggan. Data produk dikelola dalam tabel products, dengan kategori di tabel product_category_name dan informasi penjual di tabel sellers. Struktur ini memungkinkan integrasi data yang efisien untuk mendukung analisis, pengelolaan inventaris, dan pengalaman pelanggan yang optimal.
{% enddocs %}


{% docs customers_table_docs %}
Tabel ini menyimpan informasi dasar tentang pelanggan yang berinteraksi dengan platform. Data dalam tabel ini digunakan untuk mengidentifikasi pelanggan secara unik dan membantu dalam analisis perilaku pelanggan, pelacakan lokasi, serta kebutuhan logistik.
{% enddocs %}

{% docs orders_table_docs %}
Tabel ini berisi informasi tentang pesanan pelanggan, mencakup status, waktu pemrosesan, dan estimasi pengiriman. Data ini penting untuk melacak siklus hidup pesanan serta memahami efisiensi proses pemenuhan.
{% enddocs %}


{% docs geolocation_table_docs %}
Merupakan tabel yang digunakan untuk menyimpan informasi geolokasi yang berkaitan dengan wilayah geografis pelanggan atau pesanan. Data ini mencakup informasi koordinat, nama kota, dan negara bagian, yang digunakan untuk analisis lokasi, pengiriman, dan logistik.
{% enddocs %}


{% docs order_items_table_docs %}
Tabel ini menyimpan data detail terkait item yang terdapat dalam setiap pesanan, memungkinkan pelacakan granular pada transaksi pelanggan. Tabel ini sangat penting untuk analisis penjualan, manajemen stok, dan logistik pengiriman.
{% enddocs %}


{% docs order_payments_table_docs %}
Tabel ini mencatat informasi terkait metode pembayaran yang digunakan dalam setiap transaksi. Data ini penting untuk analisis preferensi metode pembayaran, perilaku pelanggan, serta evaluasi proses pembayaran.
{% enddocs %}


{% docs order_reviews_table_docs %}
Tabel ini menyimpan data ulasan dari pelanggan terkait pesanan yang telah mereka terima. Informasi ini membantu menganalisis kepuasan pelanggan dan mengidentifikasi area untuk perbaikan.
{% enddocs %}


{% docs products_table_docs %}
Tabel ini menyimpan informasi tentang produk yang tersedia untuk dijual, termasuk detail kategori, deskripsi, dimensi, dan berat. Data ini mendukung analisis inventaris, pemrosesan pesanan, dan strategi penjualan.
{% enddocs %}


{% docs sellers_table_docs %}
Tabel ini menyimpan informasi terkait penjual dalam sistem, yang mencakup data lokasi dan pengenal unik untuk setiap penjual yang terdaftar.
{% enddocs %}



{% docs customer_id_docs %}
Identifier yang menghubungkan pelanggan dengan aktivitas atau transaksi mereka, memungkinkan pelacakan konsisten.
{% enddocs %}


{% docs customer_unique_docs %}
Identifier yang menghubungkan pelanggan dengan aktivitas atau transaksi mereka, memungkinkan pelacakan konsisten.
{% enddocs %}


{% docs customer_zip_code_prefix_docs %}
Prefix kode pos pelanggan, membantu dalam analisis geografis dan distribusi logistik.
{% enddocs %}


{% docs customer_city_docs %}
Nama kota tempat pelanggan berada, mendukung analisis distribusi pelanggan berdasarkan wilayah.
{% enddocs %}


{% docs customer_state_docs %}
Nama atau kode negara bagian tempat pelanggan berada, digunakan untuk segmentasi geografis.
{% enddocs %}


{% docs order_id_docs %}
Pengenal unik untuk setiap pesanan, digunakan sebagai kunci utama untuk mengidentifikasi pesanan.
{% enddocs %}


{% docs order_status_docs %}
Status pesanan saat ini, seperti pending, shipped, delivered, atau canceled, yang mencerminkan tahap dalam siklus hidup pesanan.
{% enddocs %}


{% docs order_purchase_timestamp_docs %}
Tanggal dan waktu saat pesanan dilakukan oleh pelanggan, membantu dalam analisis pola pembelian.
{% enddocs %}


{% docs order_approved_at_docs %}
Waktu ketika pembayaran pesanan disetujui, mencerminkan efisiensi pemrosesan transaksi.
{% enddocs %}


{% docs order_delivered_carrier_date_docs %}
Tanggal ketika pesanan diserahkan ke jasa pengiriman, digunakan untuk melacak waktu penanganan oleh penjual.
{% enddocs %}


{% docs order_delivered_customer_date_docs %}
Tanggal ketika pesanan diterima oleh pelanggan, mencerminkan durasi pengiriman dari jasa pengiriman.
{% enddocs %}


{% docs order_estimated_delivery_date_docs %}
Tanggal estimasi pengiriman yang diberikan kepada pelanggan, berguna untuk analisis perbedaan antara waktu estimasi dan waktu pengiriman sebenarnya.
{% enddocs %}


{% docs orders_customer_id_docs %}
Pengenal unik pelanggan yang melakukan pesanan, digunakan untuk menghubungkan data pelanggan di tabel customers.
{% enddocs %}


{% docs product_id_docs %}
Pengenal unik untuk setiap produk, digunakan sebagai kunci utama untuk mengidentifikasi produk dalam sistem.
{% enddocs %}


{% docs product_category_name_docs %}
Nama kategori produk, misalnya "Elektronik", "Pakaian", atau "Makanan", yang membantu dalam pengelompokkan dan analisis produk berdasarkan jenis.
{% enddocs %}


{% docs product_name_lenght_docs %}
Panjang nama produk dalam karakter, memberikan informasi tentang panjang teks yang digunakan untuk menampilkan nama produk.
{% enddocs %}


{% docs product_description_lenght_docs %}
Panjang deskripsi produk dalam karakter, memberikan informasi tentang detail deskripsi yang diberikan kepada pelanggan.
{% enddocs %}


{% docs product_photos_qty_docs %}
Jumlah foto produk yang tersedia di sistem, yang membantu dalam menentukan kualitas tampilan produk untuk keperluan pemasaran.
{% enddocs %}


{% docs product_weight_g_docs %}
Berat produk dalam gram, digunakan untuk perhitungan biaya pengiriman dan logistik.
{% enddocs %}


{% docs product_length_cm %}
Panjang produk dalam sentimeter, informasi penting untuk pengemasan dan pengiriman.
{% enddocs %}


{% docs product_height_cm_docs %}
Tinggi produk dalam sentimeter, digunakan untuk menghitung volume atau ruang penyimpanan yang diperlukan.
{% enddocs %}


{% docs product_width_cm_docs %}
Lebar produk dalam sentimeter, mendukung pengelolaan ruang gudang dan kemasan.
{% enddocs %}


{% docs seller_id_docs %}
ID unik yang digunakan untuk mengidentifikasi setiap penjual di sistem. Kolom ini penting untuk pelacakan transaksi, pemesanan produk, dan pengelolaan data terkait penjual.
{% enddocs %}


{% docs seller_zip_code_prefix_docs %}
Prefix kode pos tempat penjual beroperasi. Ini membantu dalam pengelompokan geografis penjual berdasarkan lokasi mereka dan mendukung pengelolaan pengiriman dan biaya logistik.
{% enddocs %}


{% docs seller_city_docs %}
Nama kota tempat penjual berlokasi. Menyediakan informasi yang berguna untuk analisis lokasi dan distribusi penjual.
{% enddocs %}


{% docs seller_state_docs %}
Nama provinsi atau negara bagian tempat penjual berada. Kolom ini membantu untuk analisis lokasi lebih lanjut dan pengelolaan area distribusi produk.
{% enddocs %}


{% docs review_id_docs %}
Pengenal unik untuk setiap ulasan, digunakan untuk mengidentifikasi ulasan secara individual.
{% enddocs %}


{% docs order_reviews_order_id_docs %}
Pengenal unik untuk pesanan yang diulas, berfungsi sebagai relasi dengan tabel orders.
{% enddocs %}

{% docs review_score_docs %}
Nilai ulasan yang diberikan oleh pelanggan, biasanya dalam rentang tertentu (misalnya, 1-5), yang mencerminkan tingkat kepuasan pelanggan.
{% enddocs %}

{% docs review_comment_title_docs %}
Judul ulasan singkat yang diberikan oleh pelanggan, memberikan gambaran umum tentang isi ulasan.
{% enddocs %}

{% docs review_comment_message_docs %}
Isi atau pesan utama dari ulasan pelanggan, digunakan untuk memahami feedback secara lebih mendalam.
{% enddocs %}

{% docs review_creation_date_docs %}
Tanggal ketika pelanggan membuat ulasan, membantu melacak waktu pemberian ulasan.
{% enddocs %}

{% docs review_answer_timestamp_docs %}
Waktu ketika ulasan diproses atau dijawab oleh sistem, relevan untuk menilai efisiensi respons terhadap ulasan pelanggan.
{% enddocs %}

{% docs order_payments_order_id_docs %}
Pengenal unik yang menghubungkan pembayaran dengan pesanan tertentu, berfungsi sebagai relasi dengan tabel orders.
{% enddocs %}

{% docs payment_sequential_docs %}
Nomor urut yang menunjukkan urutan pembayaran untuk satu pesanan, digunakan untuk mendeteksi pembayaran parsial atau multipembayaran.
{% enddocs %}

{% docs payment_type_docs %}
Jenis metode pembayaran yang digunakan, seperti "credit_card", "boleto", atau "voucher", berguna untuk analisis preferensi pelanggan terhadap metode pembayaran.
{% enddocs %}

{% docs payment_installments_docs %}
Jumlah cicilan yang dipilih untuk pembayaran, relevan untuk memahami pola pembayaran angsuran pelanggan.
{% enddocs %}

{% docs payment_value_docs %}
Jumlah uang yang dibayarkan dalam transaksi ini, digunakan untuk analisis pendapatan dan rekonsiliasi pembayaran.
{% enddocs %}


{% docs order_items_order_id_docs %}
Pengenal unik yang menghubungkan setiap item ke pesanan tertentu, berfungsi sebagai relasi dengan tabel orders.
{% enddocs %}


{% docs order_item_id_docs %}
Nomor urut yang menunjukkan posisi atau indeks item dalam suatu pesanan, digunakan untuk identifikasi item dalam pesanan yang sama.
{% enddocs %}


{% docs order_items_product_id_docs %}
ID unik yang mengidentifikasi produk tertentu, berfungsi sebagai relasi dengan tabel products.
{% enddocs %}


{% docs order_items_seller_id_docs %}
ID unik dari penjual yang menyediakan produk, digunakan untuk analisis performa penjual dan pengelolaan mitra.
{% enddocs %}


{% docs shipping_limit_date_docs %}
Tanggal batas waktu di mana pesanan harus dikirimkan, memastikan kepatuhan terhadap SLA (Service Level Agreement) logistik.
{% enddocs %}


{% docs price_docs %}
Harga dari produk untuk item tertentu, digunakan untuk perhitungan total pesanan dan analisis pendapatan.
{% enddocs %}


{% docs freight_value_docs %}
Biaya pengiriman yang dikaitkan dengan item ini, digunakan untuk analisis biaya logistik dan evaluasi efisiensi pengiriman.
{% enddocs %}


{% docs geolocation_zip_code_prefix_docs %}
Bagian awal kode pos yang digunakan untuk mengidentifikasi area geografis secara umum, menghubungkan data geolokasi dengan data pelanggan atau transaksi berdasarkan wilayah kode pos.
{% enddocs %}


{% docs geolocation_lat_docs %}
Koordinat lintang yang mewakili lokasi geografis. Kolom ini memungkinkan pemetaan lokasi secara akurat dan analisis berbasis geografis.
{% enddocs %}


{% docs geolocation_lng_docs %}
Koordinat bujur lokasi geografis. Bersama dengan lintang, kolom ini memungkinkan penentuan posisi geografis yang tepat.
{% enddocs %}

{% docs geolocation_city_docs %}
Nama kota yang terkait dengan koordinat geografis, mendukung analisis berbasis wilayah kota.
{% enddocs %}

{% docs geolocation_state_docs %}
Nama atau kode negara bagian yang menunjukkan lokasi. Kolom ini digunakan untuk mengelompokkan data geografis berdasarkan area administratif, berguna untuk analisis dan pelaporan regional.
{% enddocs %}

