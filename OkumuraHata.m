function LP=OkumuraHata(fc,hb,hm,d,flag, city_size)

%MODELL OKUMURA-HATA

%fc-> frquency (MHZ) 150-1500 MHZ
%hb-> height (m) of the transmitting antenna 30-200 m
%hm-> height (m) of the receiving antenna 1-10 m
%d-> distance Tx-Rx (Km) 1-100 Km
%flag-> environment 1. urban, 2. sub-urban, 3. rural

%path loss for urban area (dB)
Lp=69.55+26.16*log10(fc)-13.82*log10(hb)-a(hm,fc,city_size)+(44.9-6.55*log10(hb))*log10(d);

%path loss for sub-urban area (dB)
Lps=Lp-2*(log10(fc/28))^2-5.4;

%path loss for rural area  (dB)
Lpo=Lp-4.78*(log10(fc))^2+18.33*log10(fc)-40.98;

%electric field (V/m)
%E=69.82-6.16*log10(fc)+13.82*log10(hb)+a(hm,fc)-(44.9-6.55*log10(hb))*log10(d^b);

switch flag
    case 1
        LP=Lp;
    case 2
        LP=Lps;
    case 3
        LP=Lpo;
    otherwise
        disp('error')
end


function Factor= a(hm,fc, city_size)

switch city_size
    case 1
        Factor=(1.1*log10(fc)-0.7)*hm-(1.56*log10(fc)-0.8); %for the small and medium city
    case 2
        Factor=3.2*(log10(11.75*hm))^2-4.97;  % fc>400 MHz. for big city
end
