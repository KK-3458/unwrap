% imagename='\\iomd_nas\Public Folder\FUYU_folder\Speckle&Fringe\Research\Paper2\Temp-BS3125\f_000001_t.bmp';
% A=imread('f_000001_t.bmp');
% imshow(A);
% size(A);
v1='f_';
v2='_tm.bmp';
frame=100;
pic=zeros(360,400,100);
kk=zeros(1,100);
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
    kk(n)=pic(200,100,n);
   
end
wraped_phase50=zeros(360,400);
Max=zeros(360,400);
Min=Max;
% for k=1:100
k=50;
for i=1:360
    for j=1:400
        
        Max(i,j)=max(pic(i,j,:));
        Min(i,j)=min(pic(i,j,:));
        C50(i,j)=(2*pic(i,j,k)-Max(i,j)-Min(i,j))/(Max(i,j)-Min(i,j));
        wraped_phase50(i,j)=acos(C50(i,j));
        
        C51(i,j)=(2*pic(i,j,k+1)-Max(i,j)-Min(i,j))/(Max(i,j)-Min(i,j));
        wraped_phase51(i,j)=acos(C51(i,j));
        
        C49(i,j)=(2*pic(i,j,k-1)-Max(i,j)-Min(i,j))/(Max(i,j)-Min(i,j));
        wraped_phase49(i,j)=acos(C49(i,j));
        if pic(i,j,k)<pic(i,j,k+1)%第50帧展开2pi
            
            wraped_phase50(i,j)=2*pi-wraped_phase50(i,j);
            
        end
        if pic(i,j,51)<pic(i,j,52)%第51帧展开2pi
            
            wraped_phase51(i,j)=2*pi-wraped_phase51(i,j);
            
        end
        if pic(i,j,49)<pic(i,j,50)%第49帧展开2pi
            
            wraped_phase49(i,j)=2*pi-wraped_phase49(i,j);
            
        end
        if abs(wraped_phase50(i,j)-pi)<=0.2*pi || abs(wraped_phase50(i,j)-2*pi)<=0.2*pi
            wraped_phase50(i,j)=(wraped_phase49(i,j)+wraped_phase51(i,j))/2;
            %              if imag(wraped_phase50(i,j))== 0
            %                  D(i,j)=0;
            %              else
            %                  D(i,j)=1;
            %              end
        end
    end
end
%     figure(1);
%     subplot(1,3,1);
%     J=fftshift(fft2(pic(:,:,50),360,400));
%     O=abs(J);
%     imshow(O/256);
% PSF=fspecial('average',8);
% p_filter=imfilter(p,PSF);
% subplot(1,3,3);
% u=-180:179;v=-200:199;
% [U,V]=meshgrid(v,u);
% D=sqrt(U.^2+V.^2);
% D0=10;
% H=double(D<=D0);
% R=J.*H;
% R=ifft2(ifftshift(R));
% R=R(1:360,1:400);
% R=R/256;
% imshow(R);

subplot(2,1,1);

imshow(pic(:,:,50)/256);

subplot(2,1,2);
imshow(wraped_phase50/pi/2);

         
% plot(k);
%  K=pic(:,:,1);
%  imshow(K);

m_ax=Max(200,100);
m_in=Min(200,100);
for n=1:100
c(n)=(2*kk(n)-m_ax-m_in)/(m_ax-m_in);

z(n)=acos(c(n));
end
for n=1:99
    if kk(n)>=kk(n+1) 
        f(n)=z(n);
    else
        f(n)=2*pi-z(n);
    end
end
figure(2);
subplot(3,1,1);
stem(kk);
subplot(3,1,2);
f(100)=z(100);
stem(f);

for n=2:98
    if abs(f(n)-pi)<(0.2*pi) || abs(f(n)-2*pi)<(0.2*pi)
        f(n)=(f(n-1)+f(n+1))/2;
    end
end
subplot(3,1,3);
stem(f);

% Io=(m_in+m_ax)/2;
% Ia=(m_ax-m_in)/2;
% for n=1:100
%     
% a_(n)=acos((kk(n)-Io)/Ia);
% end
% figure(3);



% n=0.001:0.001:0.1;
% b=cos(2*pi*50*n);
% q=acos(b);
% stem(q);