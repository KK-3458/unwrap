% figure(1);
% p1=imread('low_000001.bmp');
% I1=imshow(p1);
% figure(2);
% p2=imread('f_000001_tm1.bmp');
% I2=imshow(p2);
% 
% KK=imread('f_000001_tm1.bmp');
% K1=wrapedphase(:,:,1);
% 
 
% C1=C(:,:,1);
% K1=C(:,:,1);

% [J, rect] = imcrop(I);
s1='f_';s2='.bmp';s3='crop_';
v1='low_';
rect=[200,141,177,174];
% %crop and write crop_images
%read cropimage
% for n=1:100
%     if n<10
%         m='00000';
%     elseif n>9 && n<100
%         m='0000';
%     else
%         m='000';
%     end
%     ms=int2str(n);
%     name3=strcat('low_',m,ms,s2);
% %      pic(:,:,n)=imread(name3);
% %     name=strcat(s1,m,ms,s2);
%      name2=strcat('crop_',m,ms,s2);
% % %     I(:,:,n)=imread(name);
% % %      cropimage(:,:,n)=imcrop(I(:,:,n),rect);
% cropimages(:,:,n)=imread(name2);
% %     imwrite(cropimage(:,:,n),name2);
% end
 %%
% %%%%%%%%lowpass
% h=size(cropimages(:,:,1),1); 
% w=size(cropimages(:,:,1),2);
% frame=size(cropimages,3);
% u=-h/2:(h/2-1);
% v=-w/2:(w/2-1);
% D0=20;
% [U,V]=meshgrid(v,u);
% D=sqrt(U.^2+V.^2);
% N=6;
% H=1./(1+(D./D0).^(2*N));
% v1='low_';v2='.bmp';
% for n=1:frame
%     J=fftshift(fft2(cropimages(:,:,n),h,w));
%     K=J.*H;
%     L=ifft2(ifftshift(K));
%     L=L(1:h,1:w);
%     %已知为100帧
%       if n<10
%         m='00000';
%     elseif n>9 && n<100
%         m='0000';
%     else
%         m='000';
%       end
%       ms=int2str(n);
%     name=strcat(v1,m,ms,v2);
%     lowpassimages(:,:,n)=abs(L)/256;
%     imwrite(lowpassimages(:,:,n),name);
%     
% end
% %%%%%%%%%%%%%%low1=lowpassimages(:,:,1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%read lowpassimages
for n=1:100
    if n<10
        m='00000';
    elseif n>9 && n<100
        m='0000';
    else
        m='000';
    end
    ms=int2str(n);
    name3=strcat('low_',m,ms,'.bmp');
  pic(:,:,n)=double(imread(name3));
   kk(n)=pic(100,100,n);
end

%test
% A=[1 2 3;2 5 6];
% whos A;
I2=imread('f_000001_tm1.bmp');
l211=I2(1,:);

K=pic(:,:,1);
%%
%%%%%%%%%%%%%%%%%%%%%%%%   max      min   %%%%%%%%%%%%%%%%%%%%%%%%
h=175;w=178;
% for i=1:h
%     for j=1:w
%         for n=2:99
%             ka=0;ki=0; %ka mean k-max number
%            if ((pic(i,j,n)>=pic(i,j,n-1) &&  pic(i,j,n)>=pic(i,j,n+1))&& pic(i,j,n)>150)
%                ka=ka+1;
%                MAX(i,j,n)=pic(i,j,n);
%                MAXa(i,j,ka)=pic(i,j,n);
%                if ka==1
%                MAXb(i,j)=n-1;  %record first 0 stage end frame
%                end
%            end
%                if (pic(i,j,n)<=pic(i,j,n-1) &&  pic(i,j,n)<=pic(i,j,n+1))
%                    ki=ki+1;
%                    MIN(i,j,n)=pic(i,j,n);
%                     MINi(i,j,ki)=pic(i,j,n);
%                       if kb==1
%                MINb(i,j)=n-1;  %record first 0 stage end frame
%                end
%                end
%         end
%         %interp
%         for k=1:100
%             if k<=MAXb(i,j)
%                 MAX(i,j,k)=MAXa(i,j,1);
%             elseif MAX(i,j,k)==MAXa(i,j,size(MAXa(i,j,:)))
%                 for w=1:
%                 for q=1:size(MAXa(i,j,:))
%                     
%             elseif ~MAX(i,j,k)
%                     MAX(i,j,k)=
%             if (MAX(i,j,k)~=MAXa(i,j,1))
%                 MAX(i,j,k)=MAXa(i,j,1);
%             end
%             if ~MAX(i,j,k)
%                 
%     end
%                 end


for i=1:h
    for j=1:w
        %  find max and max_number
        ka=0;ki=0; %ka means k-max number
        for n=2:99
            
            if ((pic(i,j,n)>=pic(i,j,n-1) &&  pic(i,j,n)>=pic(i,j,n+1))&& pic(i,j,n)>150)
                ka=ka+1;
                MAXa(i,j,ka+1)=pic(i,j,n);
                MAXn(i,j,ka+1)=ka;
            end
            if (pic(i,j,n)<=pic(i,j,n-1) &&  pic(i,j,n)<=pic(i,j,n+1))
                ki=ki+1;
                MINi(i,j,ki+1)=pic(i,j,n);
                MINn(i,j,ki+1)=ki;
            end
        end
        %   front and back
        s1=size(MAXn(i,j,:),3);s2=size(MINn(i,j,:),3);
        MAXa(i,j,1)=MAXa(i,j,2);MAXa(i,j,s1+1)=MAXa(i,j,s1);
        MINi(i,j,1)=MINi(i,j,2);MINi(i,j,s2+1)=MINi(i,j,s2);
        %record number needing to interp
        k1=0;k2=0;
        for n=1:100  
            if ~MAX(i,j,n)
                k1=k1+1;
                nMax(i,j,k1)=n;
            end
            if ~MIN(i,j,n)
                k2=k2+1;
                nMin(i,j,k2)=n;
            end
            
        end
        %  interp
        MIN(i,j,:)=interp1(MINn(i,j,:),MINi(i,j,:),nMin(i,j,:));
        MAX(i,j,:)=interp1(MAXn(i,j,:),MAXa(i,j,:),nMax(i,j,:));
       % MIN(i,j,:)=interp1(MINn(i,j,:),MINi(i,j,:),nMin(i,j,:));
    end
end
 kk2=MAX(100,100,:);
 kk2=MIN(100,100,:);
                

                
                
                
for i=1:h
    for j=1:(w)
        
        Max(i,j)=max(pic(i,j,:));
        Min(i,j)=min(pic(i,j,:));
    end
end

for k=1:100
    
    for i=1:h
    for j=1:(w)
            
            C(i,j,k)=double((2*pic(i,j,k)-Max(i,j)-Min(i,j))/(Max(i,j)-Min(i,j)));
            wrapedphase(i,j,k)=acos(C(i,j,k));
                        if k~=100
                            if pic(i,j,k)<pic(i,j,k+1)
                                wrapedphase2(i,j,k)=2*pi-wrapedphase(i,j,k);
                            else
                                wrapedphase2(i,j,k)=wrapedphase(i,j,k);
                            end
                        else
                            if pic(i,j,k)<pic(i,j,k-1)
                            wrapedphase2(i,j,k)=wrapedphase(i,j,k);
                            else
                             wrapedphase2(i,j,k)=2*pi-wrapedphase(i,j,k);
                            end
                        end
            
        end
    end
end
w1=wrapedphase(:,:,1);
C2=C(:,:,1);
%%
    unwrapedphase(:,:,:)=unwrap(wrapedphase2,[],1);
for k=1:100
   
    min_unwrapedphase(k)=min(reshape(unwrapedphase(:,:,k),[178*h,1]));
    max_unwrapedphase(k)=max(reshape(unwrapedphase(:,:,k),[178*h,1]));

end
CC=unwrapedphase(:,:,25);
for k=1:100
    
    for i=1:h
    for j=1:(w-1)
            normalized_unwrapedphase(i,j,k)=(unwrapedphase(i,j,k)-min_unwrapedphase(k))/(max_unwrapedphase(k)-min_unwrapedphase(k));

        end
    end
end


for k=20:25
    figure(k);
    subplot(131);
    imshow(pic(:,:,k)/256);
    title('低通');
    subplot(132);
    imshow(wrapedphase2(:,:,k)/2/pi);
    title('0~2\pi');
     subplot(133);
    imshow((normalized_unwrapedphase(:,:,k)));
    title('解包裹');
end
un25=normalized_unwrapedphase(:,:,25);
wrap25=wrapedphase2(:,:,25);
pic25=pic(:,:,25);
figure(50);
imshow(wrapedphase2(:,:,25)/2/pi);
ku=normalized_unwrapedphase(:,1,25);
kw=wrapedphase2(:,1,25);
kw2=wrapedphase2(:,2,25);



kk1=reshape(wrapedphase(100,100,:),[1,100]);
kk2=reshape(wrapedphase2(100,100,:),[1,100]);
kk3=unwrap(kk2);
figure(1);
subplot(221);plot(kk1);
title('0~\pi');
subplot(222);plot(kk);
title('沿时间轴100个点的信号');
subplot(223);plot(kk2);
title('0~2\pi');
subplot(224);
plot(kk3);
title('展开相位');

% % wrapedphase2=image_normalize(wrapedphase2);
% % s1='w2';s2='.bmp';
% % for n=1:100
% %     
% %      if(n<10)
% %         m='00000';
% %     elseif(n>9 && n<100)
% %         m='0000';
% %     else
% %         m='000';
% %     end
% %     ms=int2str(n);
% %     name2=strcat(s1,m,ms,s2);
% %     imwrite(wrapedphase2(:,:,n),name2);
% % end
% 
% myobj= VideoWriter('myvideo5.avi');
% myobj.FrameRate = 5;
% open(myobj)
% 
% for k=1:100
%     writeVideo(myobj, normalized_unwrapedphase(:,:,k));
% end
% close(myobj)