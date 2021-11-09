function LP=OkumuraHata(fc,hb,hm,d,flag, city_size)

%MODELLO OKUMURA-HATA

%fc-> frequenza (MHZ) 150-1500 MHZ
%hb-> altezza (m) dell'antenna in trasmissione 30-200 m
%hm-> altezza (m) dell'antenna in ricezione 1-10 m
%d-> distaza Tx-Rx (Km) 1-100 Km
%flag-> ambiente 1. urbano, 2. suburbano, 3. rurale

%path loss per aree urbane (dB)
Lp=69.55+26.16*log10(fc)-13.82*log10(hb)-a(hm,fc,city_size)+(44.9-6.55*log10(hb))*log10(d);

%path loss per aree sub-urbane (dB)
Lps=Lp-2*(log10(fc/28))^2-5.4;

%path loss per aree rurali  (dB)
Lpo=Lp-4.78*(log10(fc))^2+18.33*log10(fc)-40.98;

%campo elettrico (V/m)
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
        Factor=(1.1*log10(fc)-0.7)*hm-(1.56*log10(fc)-0.8); %Per piccole e medie città
    case 2
        Factor=3.2*(log10(11.75*hm))^2-4.97;  % fc>400 MHz. Per grandi città
end
