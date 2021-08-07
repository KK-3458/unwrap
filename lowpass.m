v1='f_';
v2='_t.bmp';
v3='_tlow.bmp';
frame=100;
pic=zeros(360,400,100);
kk=zeros(1,100);
[x,y]=meshgrid(-200:199,-180:179);
        z=sqrt(x.*2+y.*2);
        D=8;
        n=6;
        H=1./(1+(z/D).^(2*n));
for n=1:frame
    if(n<10)
        m='00000';
    elseif(n>9 && n<100)
        m='0000';
    else
        m='000';
    end
    ms=int2str(n);
    name=strcat(v1,m,ms,v2);
    pic(:,:,n)=imread(name);

     imagefft(:,:,n)=fftshift(fft2(pic(:,:,n)));
        JJ= imagefft(:,:,n);
        K=JJ.*H;
         lowpassimage(:,:,n)=abs(ifft2(ifftshift(K)))/256;
         name2=strcat(v1,m,ms,v3);
         imwrite(lowpassimage(:,:,n),name2);
end
%   J=fftshift(fft2(pic(:,:,1)));
%         
%         K=J.*H;
%         lowpassimage=ifft2(ifftshift(K));
%         subplot(121);
%         imshow(pic(:,:,1)/256);
%         subplot(122);
%         imshow(abs(lowpassimage)/256);