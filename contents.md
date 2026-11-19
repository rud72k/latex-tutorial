# Panduan Program Pelatihan LaTeX 4 Hari

Dokumen ini menjadi panduan kerja untuk penyusunan materi beamer terlebih dahulu, kemudian handbook pelatihan. Bahasa pengantar: Bahasa Indonesia.

## Sasaran peserta

Peserta adalah guru matematika dan sains serta pihak yang bertanggung jawab atas tata letak buku atau dokumen akademik.

## Struktur program

Semua presentasi Beamer pelatihan menggunakan tema Metropolis dengan palet warna bawaan tema tersebut.

Gunakan penyorotan sintaks sesuai bahasa untuk semua contoh kode. Tampilkan contoh multibaris dalam blok tersendiri dan gunakan penyorotan kode sebaris untuk perintah pendek dalam paragraf.

Ikhtisar program tersedia dalam [Ikhtisar Pelatihan LaTeX](Handbook/overview.pdf) dengan [sumber LaTeX](Handbook/overview.tex). Handbook lengkap akan dikembangkan setelah materi Beamer selesai.

Program berlangsung selama empat hari dengan satu presentasi Beamer per hari. Awali setiap sesi dengan satu perintah `\section{...}` agar Metropolis menampilkan halaman pemisah sesi secara otomatis. Durasi empat sesi Hari 1 berturut-turut adalah 75, 90, 75, dan 90 menit.

## Hari 1 — Dasar LaTeX, dokumen akademik, dan manajemen proyek

### Sesi 1 — Pengenalan LaTeX, struktur, dan format dokumen

08.30–09.45 (75 menit).

- Kegunaan LaTeX untuk dokumen akademik
- Overleaf dan lingkungan kerja
- Struktur berkas `.tex`
- Proses kompilasi
- Packages, commands, dan environments
- Class files dan preamble
- Membuat dokumen pertama
- Sections dan chapters
- Paragraphs, line breaks, dan blank spaces
- Bold, italics, dan underlining
- Text alignment
- Lists
- Footnotes dan margin notes
- Errors dan debugging dasar

Alokasi waktu: 10 menit pengenalan dan alur kerja, 15 menit dokumen pertama dan prambule, 35 menit struktur dan format, serta 15 menit debugging.

Hasil sesi: dokumen yang dapat dikompilasi dengan identitas penulis, struktur bagian, paragraf, daftar, dan catatan.

### Sesi 2 — Elemen akademik

10.00–11.30 (90 menit).

- Mathematical expressions
- Subscripts dan superscripts
- Brackets, parentheses, fractions, dan binomials
- Matrices
- Aligning equations
- Operators, integrals, sums, dan limits
- Tables dan figures
- Positioning floats
- Cross-referencing
- Bibliography dan citations

Materi pendukung: Greek letters, mathematical fonts, symbol palette, display style, dan spacing in math mode.

Alokasi waktu: 25 menit matematika, 25 menit tabel, 20 menit gambar dan rujukan, serta 20 menit sitasi dan daftar pustaka.

Hasil sesi: elemen akademik yang siap digabungkan ke dalam laporan, dengan label dan rujukan otomatis.

### Sesi 3 — Proyek dokumen akademik lengkap

13.00–14.15 (75 menit).

- Menentukan kelas dan paket yang diperlukan
- Menyusun judul, abstrak, pendahuluan, metode, hasil dan pembahasan, serta kesimpulan
- Menggabungkan teks, persamaan, tabel, dan gambar
- Memberikan captions, labels, dan cross-references
- Menambahkan sitasi dan daftar pustaka dari sumber yang digunakan
- Memeriksa perhitungan, asal data, dan kesesuaian kesimpulan
- Kompilasi, telaah berpasangan, dan revisi laporan

Alokasi waktu: 15 menit struktur dan metode, 25 menit integrasi elemen akademik, 20 menit pembahasan dan sumber, serta 15 menit telaah dan revisi.

Hasil sesi: laporan akademik pendek yang memuat teks, struktur bagian, persamaan, tabel, gambar, sitasi, dan daftar pustaka.

### Sesi 4 — Manajemen proyek LaTeX untuk dokumen akademik besar

14.30–16.00 (90 menit).

- Mengatur folder dan penamaan berkas yang konsisten
- Memisahkan berkas utama, bagian atau bab, konfigurasi, gambar, dan bibliografi
- Menggabungkan berkas dengan `\input` dan `\include`
- Menggunakan `\includeonly` dan memahami ketergantungan pada berkas bantu
- Memusatkan packages dan preamble
- Membuat commands dan environments yang dapat digunakan ulang
- Mengelola berkas `.bib` dengan biblatex dan Biber serta mengenali alur BibTeX pada template
- Mengelola label unik dan cross-referencing antarberkas
- Menjaga konsistensi nomor, daftar isi, daftar gambar, dan daftar tabel
- Memeriksa detail satuan, desimal, spasi, tanda baca, jalur gambar, dan kunci sitasi
- Mengenali struktur template dan class files
- Mendiagnosis kesalahan kompilasi dan peringatan layout
- Menelaah, mengemas, dan menyerahkan proyek sumber beserta PDF final

Alokasi waktu: 25 menit struktur proyek, 20 menit prambule dan definisi ulang pakai, 20 menit bibliografi dan rujukan, 15 menit pemeriksaan detail, serta 10 menit telaah dan penyerahan.

Hasil sesi: proyek beberapa berkas yang dapat dikompilasi ulang dan dikembangkan menjadi laporan panjang, skripsi, atau buku. Penyesuaian tata letak dan template secara mendalam dilanjutkan pada Hari 3.

## Hari 2 — Presentasi akademik dengan Beamer

### Sesi 1 — Struktur dasar presentasi Beamer

1. Konsep presentasi berbasis slide.
2. Class `beamer`.
3. Preamble dan packages.
4. Title page.
5. Frame.
6. Sections dan subsections.
7. Themes, termasuk tema Metropolis yang digunakan dalam pelatihan.
8. Navigation dan penghilangan navigation symbols bila diperlukan.
9. Blocks, alertblocks, dan exampleblocks.
10. Lists dan pengaturan daftar pada slide.
11. Commands dan environments.
12. Struktur sumber presentasi yang dapat digunakan ulang.

### Sesi 2 — Materi matematis dan visual

1. Persamaan matematika pada slide.
2. Tabel yang ringkas dan terbaca.
3. Gambar dan pengaturan ukurannya.
4. Diagram dengan TikZ.
5. Overlay dan incremental reveal.
6. Penataan materi agar tidak terlalu padat.
7. Visualisasi data dengan `pgfplots`.
8. Pemilihan grafik yang sesuai dengan argumen ilmiah.
9. Diagram sains dengan TikZ sebagai contoh utama.
10. CircuiTikZ dan Feynman diagrams sebagai contoh pilihan sesuai kebutuhan peserta.
11. Penggunaan satu konteks mini-proyek ayunan untuk persamaan, tabel, diagram, dan grafik.

### Sesi 3 — Desain presentasi

1. Tipografi dan font.
2. Ukuran teks yang terbaca dari jarak jauh.
3. Warna dan kontras.
4. Tata letak dan ruang kosong.
5. Konsistensi visual antarslide.
6. Tema institusi dan preamble bersama.
7. Dukungan font modern dengan XeLaTeX.
8. Penggunaan warna dan font untuk materi multilingual.
9. Prinsip presentasi matematika dan sains yang mudah dibaca.
10. Pemeriksaan tampilan pada ukuran layar atau proyektor yang sebenarnya.

### Sesi 4 — Hands-on Beamer

Peserta membuat presentasi akademik singkat yang mencakup:

1. Judul, tujuan, dan struktur sections.
2. Persamaan matematika.
3. Gambar atau diagram eksperimen.
4. Tabel data yang ringkas.
5. Grafik `pgfplots`.
6. Overlay atau incremental reveal.
7. Penyesuaian tema dan warna.
8. Pemeriksaan hasil kompilasi dan tampilan akhir.

Produk akhir berupa presentasi 5--7 menit dengan sekitar 5--7 frame utama.

Powerdot dan poster diperkenalkan secara singkat sebagai materi pilihan, bukan materi inti.

## Hari 3 — Tata letak, template, dan finalisasi

### Sesi 1 — Tata letak dokumen

- Page size dan margins
- Single-sided dan double-sided documents
- Headers dan footers
- Page numbering
- Paragraph formatting
- Multiple columns
- Counters
- Table of contents
- Lists of tables dan figures
- Konsistensi gaya
- Pengelolaan proyek besar

### Sesi 2 — Template dan kustomisasi

- Menggunakan template
- Memodifikasi template
- Memahami packages dan class files
- Mendefinisikan commands
- Membuat environments
- Membuat gaya institusi
- Multi-file LaTeX projects
- Hyperlinks
- Penyesuaian format buku atau dokumen akademik

### Sesi 3 — Fitur penerbitan dan materi khusus

- Bibliography dengan BibTeX, natbib, dan biblatex
- Citation styles dan bibliography styles
- Indices
- Glossaries
- Nomenclatures
- Code listing dan syntax highlighting dengan `minted`
- Quotations dan quotation marks
- Dukungan bahasa Indonesia dan bahasa internasional
- Theorems dan proofs
- Typesetting exams
- Chemistry formulae dan materi bidang khusus lainnya

Materi bahasa internasional selain Bahasa Indonesia dijadikan materi pilihan atau lampiran. Pembahasan multilingual typesetting diprioritaskan untuk kebutuhan Bahasa Indonesia dan publikasi akademik.

### Sesi 4 — Pengerjaan dan finalisasi

- Integrasi seluruh komponen dokumen
- Pemeriksaan struktur
- Pemeriksaan layout dan typography
- Pemeriksaan referensi, indeks, glossary, dan daftar isi
- Penyelesaian error kompilasi
- Konsultasi berdasarkan dokumen peserta
- Finalisasi dokumen atau template

## Hari 4 — Membuat kelas dan paket LaTeX

Hari 4 merupakan materi lanjutan untuk peserta yang ingin mengubah aturan format
yang berulang menjadi komponen LaTeX yang dapat dipakai ulang.

### Sesi 1 — Arsitektur kelas dan paket

08.30–10.00 (90 menit).

- Membedakan tanggung jawab dokumen, kelas `.cls`, paket `.sty`, dan mesin kompilasi
- Anatomi `\NeedsTeXFormat`, `\ProvidesPackage`, `\ProvidesClass`, `\RequirePackage`, dan `\LoadClass`
- Pewarisan kelas standar dan pemrosesan opsi
- Kontrak antarmuka publik dan nama internal
- Pemetaan dependensi pada template yang sudah ada

Hasil sesi: peta dependensi dan rancangan antarmuka untuk satu komponen yang akan dibuat.

### Sesi 2 — Menulis paket reusable

10.15–11.45 (90 menit).

- Merancang perintah dan environment berdasarkan kebutuhan semantis
- Menambahkan argumen wajib dan opsional
- Memusatkan warna, ukuran, metadata, dan gaya
- Menggunakan hook, validasi input, dan pesan error
- Menguji paket pada dokumen minimal dengan lebih dari satu kelas

Hasil sesi: paket `.sty` kecil dengan metadata, dependensi, perintah, environment, contoh, dan uji minimal.

### Sesi 3 — Menulis kelas dan mendistribusikannya

13.00–14.30 (90 menit).

- Memilih kapan perlu kelas baru dan kapan cukup memakai paket
- Meneruskan opsi ke `article` atau `report` dengan `\LoadClass`
- Mengatur metadata, halaman judul, heading, header, footer, dan margin
- Menyusun kelas mini yang mewarisi kelas standar
- Menyiapkan README, changelog, contoh, lisensi, dan kompilasi bersih

Hasil sesi: kelas atau paket siap uji yang dapat dipakai pada proyek baru tanpa menyalin ulang konfigurasi.

## Prioritas materi

### Materi inti

Materi wajib masuk ke slide dan latihan karena langsung mendukung kompetensi akhir setiap hari.

### Materi pendukung

Materi dijelaskan melalui contoh singkat atau catatan tambahan ketika relevan.

### Materi lanjutan

Materi disiapkan terutama untuk handbook dan tidak perlu dibahas mendalam dalam sesi kelas.

### Materi bidang khusus

Materi digunakan jika relevan dengan dokumen peserta, khususnya matematika, sains, pendidikan, dan penyusunan buku.

## Kompetensi akhir

1. Hari 1: peserta mampu membuat dokumen akademik lengkap dan mengorganisasikan sumbernya menjadi proyek beberapa berkas dengan format dan rujukan yang konsisten.
2. Hari 2: peserta mampu membuat presentasi akademik dengan Beamer.
3. Hari 3: peserta mampu mengembangkan template dan menyelesaikan dokumen yang lebih kompleks.
4. Hari 4: peserta mampu membuat, menguji, dan mendistribusikan kelas atau paket LaTeX kecil.

## Mini-proyek praktik utama: eksperimen ayunan sederhana

Mini-proyek ini menjadi konteks bersama untuk latihan matematika, fisika, tabel, gambar, grafik, referensi silang, dan presentasi.

### Topik

Estimasi percepatan gravitasi menggunakan hubungan periode ayunan sederhana:

\[
T = 2\pi\sqrt{\frac{L}{g}}
\]

Peserta dapat menuliskan teori singkat, asumsi, theorem atau proposisi yang relevan, metode pengukuran, hasil pengamatan, dan kesimpulan.

### Data dan produk yang dikerjakan

- Tabel panjang tali, jumlah getaran, waktu pengukuran, periode, dan estimasi `g`.
- Gambar atau diagram perangkat eksperimen.
- Persamaan dan definisi variabel dengan satuan.
- Grafik hubungan `T^2` terhadap `L` menggunakan `pgfplots`.
- Referensi silang untuk persamaan, tabel, gambar, dan grafik.
- Kesimpulan singkat dan daftar pustaka.
- Satu atau dua slide Beamer yang merangkum eksperimen.

### Pembagian lintas hari

- **Hari 1:** menyusun laporan eksperimen lengkap dengan teori, persamaan, metode, tabel, gambar, pembahasan, sitasi, dan daftar pustaka; kemudian mengorganisasikannya menjadi proyek beberapa berkas.
- **Hari 2:** menyajikan eksperimen dalam Beamer, termasuk persamaan, tabel, grafik, dan diagram.
- **Hari 3:** merapikan layout, grafik, referensi, bibliografi, dan template laporan.

### Latihan tambahan: tabel trigonometri

Sebagai latihan singkat, peserta membuat tabel nilai trigonometri untuk sudut `0°` sampai `90°`, dengan kolom sudut, `sin(theta)`, `cos(theta)`, dan `tan(theta)`. Latihan ini digunakan untuk memperkuat:

- pembuatan tabel,
- penulisan simbol matematika,
- pembulatan angka desimal,
- format angka dan satuan,
- serta pembuatan grafik sederhana.

## Urutan pekerjaan lanjutan

1. Menyusun isi dan struktur beamer Hari 1.
2. Menyusun isi dan struktur beamer Hari 2.
3. Menyusun isi dan struktur beamer Hari 3.
4. Menyiapkan latihan dan contoh kode untuk setiap sesi.
5. Setelah beamer selesai, menyusun module handbook berdasarkan materi, latihan, dan contoh kode yang telah digunakan.
