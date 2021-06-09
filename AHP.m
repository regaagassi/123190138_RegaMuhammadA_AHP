jenis = {'mesin 1' 'Mesin 2' 'Mesin 3' 'Mesin 4'};


data = [ 90 80 70
         95 90 80
         90 75 50
         85 80 60];
     
sepatu = 100;
sepatuHigh = 100;
sepatuLow = 100;

data(:,1) = data(:,1) / sepatu;
data(:,2) = data(:,2) / sepatuHigh;
data(:,3) = data(:,3) / sepatuLow;

relasiAntarKriteria = [ 1     2     2
                        0     1     4
                        0     0     1];
 
TFN = {[-100/3 0     100/3]     [3/100  0     -3/100]
       [0      100/3 200/3]     [3/200  3/100 0     ]
       [100/3  200/3 300/3]     [3/300  3/200 3/100 ]
       [200/3  300/3 400/3]     [3/400  3/300 3/200 ]};
   
   [RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)
if RasioKonsistensi < 0.10
    % Metode Fuzzy AHP
    [bobotAntarKriteria, relasiAntarKriteria] = FuzzyAHP(relasiAntarKriteria, TFN);    

    % Hitung nilai skor akhir 
    ahp = data * bobotAntarKriteria';
    
    disp('Hasil Perhitungan dengan metode Fuzzy AHP')
    disp('Jenis Sepatu, Hasil Produksi, Kualitas')
end

    for i = 1:size(ahp, 1)
        if ahp(i) < 0.5
            status = 'C';
        elseif ahp(i) < 0.75
            status = 'B';
        elseif ahp(i) >= 0.75
            status = 'A';
        end
        
        disp([char(jenis(i)), blanks(13 - cellfun('length',jenis(i))), ', ', ... 
             num2str(ahp(i)), blanks(10 - length(num2str(ahp(i)))), ', ', ...
             char(status)])
    end