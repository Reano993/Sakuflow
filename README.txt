SAKUFLOW LOCAL-FIRST EDITION

FITUR
- Transaksi disimpan di IndexedDB pada perangkat.
- Migrasi otomatis dari localStorage versi SakuFlow sebelumnya (jika tersedia).
- Snapshot backup lokal otomatis setiap 7 hari saat aplikasi dibuka/ada perubahan.
- Ekspor backup JSON melalui tombol panah bawah di header.
- Pulihkan backup JSON melalui tombol panah atas di header.
- Kunci biometrik WebAuthn platform authenticator (jika didukung browser/perangkat).
- Tampilan dark mode dan fitur dashboard/riwayat tetap dipertahankan.
- Service worker untuk cache aplikasi dan akses offline setelah kunjungan pertama.

CARA UPDATE
1. Ekstrak ZIP.
2. Upload seluruh isi folder sakuflow ke root repository GitHub Pages yang sama.
3. Timpa file lama dengan file baru.
4. Commit changes.
5. Buka SakuFlow di Chrome, refresh. Jika versi lama masih muncul, tutup aplikasi sepenuhnya lalu buka lagi.

PENTING TENTANG BIOMETRIK
- Memerlukan HTTPS dan browser yang mendukung WebAuthn.
- Android dapat meminta sidik jari, pengenalan wajah, PIN, atau metode kunci layar yang tersedia. Website tidak dapat memaksa sensor sidik jari tertentu.
- Kunci biometrik di versi ini adalah gerbang pembuka UI lokal, bukan enkripsi database. Jangan pinjamkan perangkat yang sudah terbuka.
- Jika biometrik gagal, buka pengaturan situs/browser atau pulihkan akses melalui pengelolaan data browser; simpan backup JSON.

PENTING TENTANG BACKUP
- Snapshot mingguan otomatis tersimpan di IndexedDB pada HP yang sama.
- Browser/PWA tidak dapat diam-diam menulis file backup ke folder Downloads setiap minggu tanpa interaksi pengguna.
- Untuk cadangan jika HP hilang/rusak, tekan tombol ekspor JSON secara berkala lalu simpan file ke media lain (mis. penyimpanan eksternal atau cloud drive pribadi).
- Menghapus data situs/browser dapat menghapus database lokal dan snapshot lokal.

PRIVASI
- Tidak ada Supabase, akun cloud, atau pengiriman transaksi ke server pada versi ini.
- IndexedDB tidak dienkripsi oleh aplikasi ini. Keamanan fisik perangkat dan kunci layar Android tetap penting.
