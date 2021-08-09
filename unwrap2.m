v1='f_';
v2='_tm.bmp';%try
v4='_t.bmp';
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
    name2=strcat(v1,m,ms,v4);
    pic2(:,:,n)=imread(name);
    kk(n)=pic(190,205,n);
end

Max=zeros(360,400);
Min=Max;
for i=1:360
    for j=1:400
        
        Max(i,j)=max(pic(i,j,:));
        Min(i,j)=min(pic(i,j,:));
    end
end
for k=1:100
    
    for i=1:360
        for j=1:400
            
            C(i,j,k)=(2*pic(i,j,k)-Max(i,j)-Min(i,j))/(Max(i,j)-Min(i,j));
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
% kf=0;kb=0;numf=0;numb=0;
% for k=2:99
%     kf=0;kb=0;
%     for i=1:360
%         for j=1:400
%             if (pic(i,j,k-1)-pic(i,j,k))>0 && (pic(i,j,k)-pic(i,j,k+1))<0
%                 kb=kb+1;
%             end
%             if (pic(i,j,k-1)-pic(i,j,k))<0 && (pic(i,j,k)-pic(i,j,k+1))>0
%                 kf=kf+1;
%             end
%         end
%     end
%     if kb>50000  %找出的两个端点不一样的阈值
%        
%          numb=numb+1;
%         kbend(numb)=k;
%     end
%     if kf>72000
%          numf=numf+1;
%         kfend(numf)=k;
%     end
% end
% % for k=1:kfend(1) && k=kbend(1):kfend(2)
% % 
% for k=1:100
%     for i=1:360
%         for j=1:400
%             if k~=100
%                 if (((k<4 || (k>=28 && k<52) || k>=76) && (pic(i,j,k)-pic(i,j,k+1))<0))      ||    (((k>=4 && k<28) || (k>=52 && k<76)) && ((pic(i,j,k)-pic(i,j,k+1))>=0))
%                     wrapedphase2(i,j,k)=wrapedphase(i,j,k);
%                 else
%                     wrapedphase2(i,j,k)=2*pi-wrapedphase(i,j,k);
%                 end
%             else
%                 wrapedphase2(i,j,k)=2*pi-wrapedphase(i,j,k);
%             end
%         end
%     end
% end
% for k=1:100  %接近PI和2PI的进行平均
%     for i=1:360
%         for j=1:400
%             if i~=1 && i~=360 && j~=1 && j~=400
%                 if abs(wrapedphase2(i,j,k)-pi)<=0.2*pi || abs(wrapedphase2(i,j,k)-2*pi)<=0.2*pi
%                     wrapedphase2(i,j,k)=(wrapedphase2(i-1,j-1,k)+wrapedphase2(i-1,j,k)+wrapedphase2(i-1,j+1,k)+wrapedphase2(i,j-1,k)+wrapedphase2(i,j+1,k)+wrapedphase2(i+1,j-1,k)+wrapedphase2(i+1,j,k)+wrapedphase2(i+1,j+1,k))/8;
%                 end
%             end
%         end
%     end
% end
% 


unwrapedphase(:,:,:)=unwrap(wrapedphase2,[],2);
%     for i=1:360
%         for j=1:400
%             for k=1:100
%                 unwrapedphase2(i,j,k)=uint8(unwrapedphase(i,j,k));
%             end
%         end
%     end
    
  %归一化        
for k=1:100
   
    min_unwrapedphase(k)=min(reshape(unwrapedphase(:,:,k),[360*400,1]));
    max_unwrapedphase(k)=max(reshape(unwrapedphase(:,:,k),[360*400,1]));
%      unwrapedphase(:,:,k)=unwrapedphase(:,:,k)-min_unwrapedphase(k);
%      max_unwrapedphase(k)= max_unwrapedphase(k)-min_unwrapedphase(k);
%       min_unwrapedphase(k)= min_unwrapedphase(k)-min_unwrapedphase(k);
end
CC=unwrapedphase(:,:,25);
for k=1:100
    
    for i=1:360
        for j=1:400
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

% kk1=reshape(wrapedphase(180,200,:),[1,100]);
% kk2=reshape(wrapedphase2(180,200,:),[1,100]);
% kk3=unwrap(kk2);
% figure(1);
% subplot(221);plot(kk1);
% title('0~\pi');
% subplot(222);plot(kk);
% title('沿时间轴100个点的信号');
% subplot(223);plot(kk2);
% title('0~2\pi');
% subplot(224);
% plot(kk3);
% title('展开相位');

myobj= VideoWriter('myvideo4.avi');
myobj.FrameRate = 5;
open(myobj)
for k=1:100
    writeVideo(myobj, normalized_unwrapedphase(:,:,k));
end
close(myobj)