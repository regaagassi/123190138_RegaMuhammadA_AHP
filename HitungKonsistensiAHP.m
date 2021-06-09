function [RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)
%5a. Menentukan Indeks Konsistensi Acak yang digunakan
%Nilai yang nantinya dipakai adalah nilai pada indeks sebanyak jumlah kriteria yang ada
indeksAcak = [0 0 0.58 0.9 1.12 1.24 1.32 1.41 1.45 1.49];
%5b. Menghitung jumlah kriteria yang sesuai dengan ukuran matriks relasi antar kriteria
[op, jumlahKriteria] = size(relasiAntarKriteria);
 
%5c. Menghitung nilai lambda, yaitu nilai eigenvalue dengan menggunakan fungsi eigenvector
[opp, lambda] = eig(relasiAntarKriteria);
 
%5d. Menentukan maksimal nilai lambda yang telah dihitung sebelumnya
maksLambda = max(max(lambda));
 
%5e. Menentukan nilai indeks konsistensi dengan rumus (maksLambda-n)/(n-1)
IndeksKonsistensi = (maksLambda - jumlahKriteria)/(jumlahKriteria-1);
 
%5f. Menghitung rasio konsistensi untuk mendapatkan jawaban akhir
RasioKonsistensi = IndeksKonsistensi/indeksAcak(1,jumlahKriteria);
 
%5g. Jika nilai rasio konsistensi lebih dari 0.1, maka tampilkan pesan kesalahan
if RasioKonsistensi > 0.10
    str = 'Rasio Konsistensi adalah %% %1.2f. Matriks yang dievaluasi tidak konsisten!';
    str = sprintf(str,RasioKonsistensi);
    disp(str);
end
end


